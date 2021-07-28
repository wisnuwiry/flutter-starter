part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

class FetchPostsEvent extends PostsEvent {
  const FetchPostsEvent({required this.page, required this.perPage});

  final int page;
  final int perPage;

  @override
  List<Object> get props => [page, perPage];
}
