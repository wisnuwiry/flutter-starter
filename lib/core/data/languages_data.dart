import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/core/data/raw/languages.dart';

class LanguagesData {
  static List<Language> data = _dataFromMap();

  static List<Language> _dataFromMap() =>
      languagesRawData.map(Language.fromJson).toList();
}
