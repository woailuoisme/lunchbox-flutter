import 'package:flutter_test/flutter_test.dart';
import 'package:lunchbox/features/device/entities/city_model.dart';

void main() {
  group('CityModel', () {
    const tCityModel = CityModel(
      id: 'c1',
      name: 'Beijing',
      code: 'BJ',
      pinyin: 'beijing',
      initial: 'B',
      latitude: 39.9,
      longitude: 116.4,
      isHot: true,
      deviceCount: 10,
    );

    test('should be a subclass of CityModel entity', () async {
      expect(tCityModel, isA<CityModel>());
    });

    test('fromJson should return a valid model', () async {
      final Map<String, dynamic> jsonMap = {
        'id': 'c1',
        'name': 'Beijing',
        'code': 'BJ',
        'pinyin': 'beijing',
        'initial': 'B',
        'latitude': 39.9,
        'longitude': 116.4,
        'is_hot': true,
        'device_count': 10,
      };

      final result = CityModel.fromJson(jsonMap);
      expect(result, tCityModel);
    });

    test('toJson should return a JSON map containing proper data', () async {
      final result = tCityModel.toJson();
      final expectedMap = {
        'id': 'c1',
        'name': 'Beijing',
        'code': 'BJ',
        'pinyin': 'beijing',
        'initial': 'B',
        'latitude': 39.9,
        'longitude': 116.4,
        'is_hot': true,
        'device_count': 10,
      };
      expect(result, expectedMap);
    });

    test('defaults should be correct', () async {
      const defaultCity = CityModel(id: 'c2', name: 'Shanghai', code: 'SH');
      expect(defaultCity.isHot, false);
      expect(defaultCity.deviceCount, 0);
      expect(defaultCity.latitude, 0.0);
    });
  });
}
