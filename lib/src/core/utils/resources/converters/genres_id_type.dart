import 'dart:convert';

import 'package:floor/floor.dart';

class GenreIdList extends TypeConverter<List<int>, String> {
  @override
  List<int> decode(String databaseValue) {
    return (json.decode(databaseValue) as List<dynamic>).cast<int>();
  }

  @override
  String encode(List<int> value) {
    return json.encode(value);
  }
}
