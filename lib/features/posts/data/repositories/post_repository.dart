import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  final PostLocalDataSource localDataSource;
  final PostRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, PaginationData<List<Post>, PaginateData>>> getPosts(
      {required int page, required int perPage}) async {
    try {
      if (await networkInfo.isConnected) {
        final result =
            await remoteDataSource.getPosts(page: page, perPage: perPage);
        await localDataSource.saveCache(result.data);
        await localDataSource
            .setExpired(DateTime.now().add(const Duration(days: 3)));
        return Right(PaginationData(
          data: result.data,
          meta: result.meta,
        ));
      } else {
        if ((await localDataSource.isCached()) &&
            !(await localDataSource.isExpired())) {
          final result = await localDataSource.getData();
          return Right(PaginationData(
            data: result,
            meta: const PaginateData(
              hasMore: false,
              quotaMax: 0,
              quotaRemaining: 0,
            ),
          ));
        }
      }

      await localDataSource.clearCache();
      return const Left(ServerFailure(message: 'Time Out'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }
}
