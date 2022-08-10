import 'package:flutter/material.dart';

{{#useSection}}part 'sections/body_section.dart';{{/useSection}}

class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const {{name.pascalCase()}}View();
  }
}

class {{name.pascalCase()}}View extends StatefulWidget {
  const {{name.pascalCase()}}View({Key? key}) : super(key: key);

  @override
  _{{name.pascalCase()}}ViewState createState() => _{{name.pascalCase()}}ViewState();
}

class _{{name.pascalCase()}}ViewState extends State<{{name.pascalCase()}}View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{name.pascalCase()}} Page'),
      ),
{{#useSection}}body: const _BodySection(),{{/useSection}}
    );
  }
}
