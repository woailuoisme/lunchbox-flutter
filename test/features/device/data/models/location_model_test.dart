import 'package:flutter_test/flutter_test.dart';
import 'package:lunchbox/features/device/entities/location_model.dart';

void main() {
  group('LocationModel', () {
    const tLocationModel = LocationModel(
      latitude: 31.2304,
      longitude: 121.4737,
      address: 'Shanghai',
    );

    test('should be a subclass of LocationModel entity', () async {
      // assert
      expect(tLocationModel, isA<LocationModel>());
    });

    test('fromJson should return a valid model', () async {
      // arrange
      final Map<String, dynamic> jsonMap = {
        'latitude': 31.2304,
        'longitude': 121.4737,
        'address': 'Shanghai',
      };

      // act
      final result = LocationModel.fromJson(jsonMap);

      // assert
      expect(result, tLocationModel);
    });

    test('toJson should return a JSON map containing proper data', () async {
      // act
      final result = tLocationModel.toJson();

      // assert
      final expectedMap = {
        'latitude': 31.2304,
        'longitude': 121.4737,
        'address': 'Shanghai',
      };
      expect(result, expectedMap);
    });
  });
}
