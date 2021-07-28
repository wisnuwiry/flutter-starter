import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/core.dart';
import '../../../../posts.dart';
import '../../../component/component.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({
    Key? key,
    required this.state,
    required this.scrollController,
  }) : super(key: key);

  final PostsState state;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final currentState = state;
    if (currentState is PostsSuccess) {
      return _SuccessContent(
        controller: scrollController,
        data: currentState.data,
        isLoading: !currentState.hasReachedMax,
      );
    } else if (currentState is PostsFailure) {
      return _FailureContent(failure: currentState.failure);
    }
    return _LoadingContent();
  }
}

class _LoadingContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _SuccessContent extends StatelessWidget {
  const _SuccessContent({
    Key? key,
    required this.controller,
    required this.data,
    required this.isLoading,
  }) : super(key: key);

  final ScrollController controller;
  final List<Post> data;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(Dimens.dp16),
      controller: controller,
      children: [
        ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = data[index];
            return PostItemCard(post: item);
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: data.length,
        ),
        if (isLoading == true) ...[
          const Divider(),
          const Center(child: CircularProgressIndicator()),
        ],
      ],
    );
  }
}

class _FailureContent extends StatelessWidget {
  const _FailureContent({Key? key, required this.failure}) : super(key: key);

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(failure.message),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<PostsBloc>(context)
                .add(const FetchPostsEvent(page: 1, perPage: 40));
          },
          child: const Text('Retry'),
        ),
        const Divider(),
      ],
    );
  }
}
