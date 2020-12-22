import 'package:test/test.dart';
import 'package:gitterapi/gitter_api.dart';

void main() {
  group('This tests _sanatized method Test', () {
    final unsanatizedMap = <String, dynamic>{
      'key1': 'value1',
      'key2': null,
    };
    test('Should Filter all keys with null values.', () {
      final sanatizedMap = sanatized(unsanatizedMap);
      expect(sanatizedMap.length == 1, true);
    });

    test('Should return empty Map when a null value passed.', () {
      expect(sanatized(null).isEmpty, true);
    });
  }, tags: ['v1']);
}
