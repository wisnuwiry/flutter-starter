import 'package:dartz/dartz.dart';
import 'package:flutter_works/core/core.dart';

import '../domain.dart';

abstract class PostRepository {
  Future<Either<Failure, PaginationData<List<Post>, PaginateData>>> getPosts(
      {required int page, required int perPage});
}
