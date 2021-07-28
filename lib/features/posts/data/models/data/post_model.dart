import '../../../../../core/core.dart';
import '../../../domain/domain.dart';

class PostModel extends Post {
  const PostModel({
    required int postId,
    required String title,
    required String body,
    required int score,
    required int upVoteCount,
    required int downVoteCount,
  }) : super(
          postId: postId,
          title: title,
          body: body,
          score: score,
          upVoteCount: upVoteCount,
          downVoteCount: downVoteCount,
        );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      postId: NumParser.intParse(json['post_id'], 0)!,
      title: json['title'],
      body: json['body'],
      score: NumParser.intParse(json['score'], 0)!,
      upVoteCount: NumParser.intParse(json['up_vote_count'], 0)!,
      downVoteCount: NumParser.intParse(json['down_vote_count'], 0)!,
    );
  }
}

extension PostModelX on Post {
  Map<String, dynamic> toJson() => {
        'post_id': postId,
        'title': title,
        'body': body,
        'score': score,
        'up_vote_count': upVoteCount,
        'down_vote_count': downVoteCount,
      };
}
