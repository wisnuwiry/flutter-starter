import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';

class PostItemCard extends StatelessWidget {
  const PostItemCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dp20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: context.theme.textTheme.subtitle2,
            ),
            const SizedBox(height: Dimens.dp16),
            Text(
              post.body,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            Wrap(
              spacing: Dimens.dp8,
              children: [
                ChoiceChip(
                  label: Text('${post.score}'),
                  selected: false,
                  onSelected: (selected) {},
                  avatar: const Icon(
                    Icons.score,
                    color: Colors.orange,
                  ),
                ),
                ChoiceChip(
                  label: Text('${post.upVoteCount}'),
                  selected: false,
                  onSelected: (selected) {},
                  avatar: const Icon(
                    Icons.expand_less,
                    color: Colors.green,
                  ),
                ),
                ChoiceChip(
                  label: Text('${post.downVoteCount}'),
                  selected: false,
                  onSelected: (selected) {},
                  avatar: const Icon(
                    Icons.expand_more,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
