import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../core/core.dart';
import '../../../posts.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc({required this.useCase}) : super(PostsLoading());

  final GetPostsUseCase useCase;

  @override
  Stream<Transition<PostsEvent, PostsState>> transformEvents(
    Stream<PostsEvent> events,
    TransitionFunction<PostsEvent, PostsState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<PostsState> mapEventToState(
    PostsEvent event,
  ) async* {
    final currentState = state;

    if (event is FetchPostsEvent && !_hasReachedMax(currentState)) {
      try {
        if (currentState is! PostsSuccess) {
          yield PostsLoading();
          final result = await useCase(PaginateParams(
            page: event.page,
            perPage: event.perPage,
          ));

          yield result.fold(
            (failure) => PostsFailure(failure),
            (success) => PostsSuccess(
              data: success.data,
              page: event.page,
              hasReachedMax: !success.meta.hasMore,
            ),
          );
          return;
        }

        if (currentState is PostsSuccess && currentState.page < event.page) {
          final result = await useCase(PaginateParams(
            page: event.page,
            perPage: event.perPage,
          ));

          yield* result.fold(
            (failure) async* {},
            (success) async* {
              yield currentState.copyWith(
                data: currentState.data + success.data,
                hasReachedMax: !success.meta.hasMore,
                page: event.page,
              );
            },
          );
        }
      } catch (e) {
        yield PostsFailure(ServerFailure(message: e.toString()));
      }
    }
  }

  bool _hasReachedMax(PostsState state) =>
      state is PostsSuccess && state.hasReachedMax;
}
