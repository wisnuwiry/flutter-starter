import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../posts.dart';

class GetPostsUseCase
    implements
        UseCaseFuture<Failure, PaginationData<List<Post>, PaginateData>,
            PaginateParams> {
  GetPostsUseCase(this.repository);

  final PostRepository repository;

  @override
  FutureOr<Either<Failure, PaginationData<List<Post>, PaginateData>>> call(
      PaginateParams params) {
    return repository.getPosts(page: params.page, perPage: params.perPage);
  }
}
