import 'package:equatable/equatable.dart';

import '../../../../../core/core.dart';
import '../../../posts.dart';

class PostResponseModel extends Equatable {
  const PostResponseModel({required this.data, required this.meta});

  factory PostResponseModel.fromJson(Map<String, dynamic> json) {
    return PostResponseModel(
      data: List<PostModel>.from(
          (json['items'] as List).map((e) => PostModel.fromJson(e))).toList(),
      meta: PaginateData.fromJson(json),
    );
  }

  final List<PostModel> data;
  final PaginateData meta;

  @override
  List<Object?> get props => throw UnimplementedError();
}
