import 'package:mason/mason.dart';

Future run(HookContext context) async {
  final type = context.vars['type'].toString().toLowerCase();
  final isFuture = type == 'future';
  final isStream = type == 'stream';
  context.logger.err(type);

  context.vars = <String, dynamic>{
    ...context.vars,
    'isFuture': isFuture,
    'isStream': isStream,
  };
}
