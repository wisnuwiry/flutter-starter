import 'package:mason/mason.dart';

Future run(HookContext context) async {
  final handler = context.vars['handler'].toString().toLowerCase();
  final isNetwork = handler == 'network';
  final isCache = handler == 'cache';
  final isBoth = handler == 'both';

  context.vars = <String, dynamic>{
    ...context.vars,
    'isNetwork': isNetwork,
    'isCache': isCache,
    'isBoth': isBoth,
  };
}
