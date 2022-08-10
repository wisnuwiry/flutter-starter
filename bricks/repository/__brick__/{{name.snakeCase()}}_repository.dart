{{#isNetwork}}import 'package:dio/dio.dart';{{/isNetwork}}
{{#isCache}}import 'package:hive/hive.dart';{{/isCache}}
{{#isBoth}}
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
{{/isBoth}}

/// {@template {{name.snakeCase()}}_repository}
/// A repository which manages the {{name.pascalCase()}}
/// {@endtemplate}
abstract class {{name.pascalCase()}}Repository {}

/// {@template {{name.snakeCase()}}_repository_impl}
/// A repository implementation from {{name.pascalCase()}}Repository
/// {@endtemplate}
class {{name.pascalCase()}}RepositoryImpl
    with 
    {{#isNetwork}}ServiceNetworkHandlerMixin{{/isNetwork}}
    {{#isCache}}ServiceCacheHandlerMixin{{/isCache}}
    {{#isBoth}}ServiceCacheHandlerMixin, ServiceNetworkHandlerMixin{{/isBoth}}
    implements {{name.pascalCase()}}Repository {
  const {{name.pascalCase()}}RepositoryImpl({
    {{#isNetwork}}required this.httpClient{{/isNetwork}}
    {{#isCache}}required this.cacheClient{{/isCache}}
    {{#isBoth}}
    required this.httpClient,
    required this.cacheClient,
    {{/isBoth}}
  });

  {{#isNetwork}}final Dio httpClient;{{/isNetwork}}
  {{#isCache}}final HiveInterface cacheClient;{{/isCache}}
  {{#isBoth}}
  final Dio httpClient;
  final HiveInterface cacheClient;
  {{/isBoth}}
  
}
