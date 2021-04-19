import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import '../data.dart';

abstract class PostRemoteDataSource {
  Future<PostResponseModel> getPosts({required int page, required int perPage});
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  PostRemoteDataSourceImpl(this.client);

  final Dio client;

  @override
  Future<PostResponseModel> getPosts(
      {required int page, required int perPage}) async {
    try {
      final response = await client.get(
        '/posts',
        queryParameters: {
          'page': page,
          'pagesize': perPage,
          'site': 'stackoverflow',
          'filter': '!)sBhEMunR5gUC70uqGmE',
        },
      );

      return PostResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }
}
