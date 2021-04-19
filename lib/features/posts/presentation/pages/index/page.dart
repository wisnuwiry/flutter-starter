import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../posts.dart';
import 'sections/sections.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final _bloc = GetIt.I<PostsBloc>();
  final _scrollController = ScrollController();
  int _currentPage = 1;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    _fetchData(1);
    super.initState();
  }

  void _fetchData(int page) {
    _bloc.add(FetchPostsEvent(page: page, perPage: 40));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBarSection(context),
          body: BlocBuilder<PostsBloc, PostsState>(
            builder: (context, state) {
              if (state is PostsSuccess) {
                _currentPage = state.page;
              }

              return ContentSection(
                state: state,
                scrollController: _scrollController,
              );
            },
          ),
        ),
      ),
    );
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= 200) {
      _fetchData(_currentPage + 1);
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(() {})
      ..dispose();
    super.dispose();
  }
}
