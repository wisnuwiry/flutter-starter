import 'package:equatable/equatable.dart';

class Post extends Equatable {
  const Post({
    required this.postId,
    required this.title,
    required this.body,
    required this.score,
    required this.upVoteCount,
    required this.downVoteCount,
  });

  final int postId;
  final String title;
  final String body;
  final int score;
  final int upVoteCount;
  final int downVoteCount;

  @override
  List<Object?> get props =>
      [postId, title, body, score, upVoteCount, downVoteCount];
}
