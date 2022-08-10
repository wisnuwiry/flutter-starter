import 'dart:async';

import 'package:fpdart/fpdart.dart';

class {{name.pascalCase()}}UseCase implements UseCase{{#isFuture}}Future{{/isFuture}}{{#isStream}}Stream{{/isStream}}<ErrorException, {{success_type.pascalCase()}}, NoParams> {
  const {{name.pascalCase()}}UseCase();


  @override
  {{#isFuture}}FutureOr{{/isFuture}}{{#isStream}}Stream{{/isStream}}<Either<ErrorException, {{success_type.pascalCase()}}>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
