import 'package:floor/floor.dart';

class NullableNum extends TypeConverter<num?, double?> {
  @override
  num? decode(double? databaseValue) {
    return databaseValue;
  }

  @override
  double? encode(num? value) {
    return value?.toDouble();
  }
}
