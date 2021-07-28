part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsLoading extends PostsState {}

class PostsSuccess extends PostsState {
  const PostsSuccess({
    required this.data,
    required this.page,
    required this.hasReachedMax,
  });

  final List<Post> data;
  final int page;
  final bool hasReachedMax;

  PostsSuccess copyWith({
    List<Post>? data,
    int? page,
    bool? hasReachedMax,
  }) {
    return PostsSuccess(
      data: data ?? this.data,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [data, page, hasReachedMax];
}

class PostsFailure extends PostsState {
  const PostsFailure(this.failure);

  final Failure failure;

  @override
  List<Object> get props => [failure];
}
