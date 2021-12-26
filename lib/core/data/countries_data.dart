import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/core/data/raw/countries.dart';

class CountriesData {
  static List<Country> data = _dataFromMap();

  static List<Country> _dataFromMap() => countriesRawData
      .map<Country>(
        (e) => Country.fromJson(e).copyWith(
          flag: 'assets/images/flags/${e['code'].toString().toLowerCase()}.png',
        ),
      )
      .toList();
}
