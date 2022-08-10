import 'package:flutter/material.dart';

class {{feature_name.pascalCase()}}Page extends StatelessWidget {
  const {{feature_name.pascalCase()}}Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const {{feature_name.pascalCase()}}View();
  }
}

class {{feature_name.pascalCase()}}View extends StatefulWidget {
  const {{feature_name.pascalCase()}}View({Key? key}) : super(key: key);

  @override
  _{{feature_name.pascalCase()}}ViewState createState() => _{{feature_name.pascalCase()}}ViewState();
}

class _{{feature_name.pascalCase()}}ViewState extends State<{{feature_name.pascalCase()}}View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{feature_name.pascalCase()}} Page'),
      ),
    );
  }
}
