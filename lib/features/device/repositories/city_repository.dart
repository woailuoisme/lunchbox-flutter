import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lunchbox/features/device/entities/city_model.dart';

/// 城市数据仓库 Provider
final cityRepositoryProvider = Provider<CityRepository>((ref) {
  return SimulatedCityRepository();
});

/// 城市列表数据 Provider
final cityListProvider = FutureProvider<List<CityModel>>((ref) async {
  final repository = ref.watch(cityRepositoryProvider);
  return repository.fetchCities();
});

/// 城市数据仓库接口
abstract class CityRepository {
  Future<List<CityModel>> fetchCities();
}

/// 模拟城市数据仓库实现
class SimulatedCityRepository implements CityRepository {
  @override
  Future<List<CityModel>> fetchCities() async {
    // 模拟网络延迟
    await Future<void>.delayed(const Duration(milliseconds: 500));

    return [
      const CityModel(name: '东莞市', tag: 'D', code: '4419'),
      const CityModel(name: '大连市', tag: 'D', code: '2102'),
      const CityModel(name: '佛山市', tag: 'F', code: '4406'),
      const CityModel(name: '福州市', tag: 'F', code: '3501'),
      const CityModel(name: '广州市', tag: 'G', code: '4401'),
      const CityModel(name: '贵阳市', tag: 'G', code: '5201'),
      const CityModel(name: '惠州市', tag: 'H', code: '4413'),
      const CityModel(name: '杭州市', tag: 'H', code: '3301'),
      const CityModel(name: '合肥市', tag: 'H', code: '3401'),
      const CityModel(name: '济南市', tag: 'J', code: '3701'),
      const CityModel(name: '昆明市', tag: 'K', code: '5301'),
      const CityModel(name: '兰州市', tag: 'L', code: '6201'),
      const CityModel(name: '洛阳市', tag: 'L', code: '4103'),
      const CityModel(name: '南京市', tag: 'N', code: '3201'),
      const CityModel(name: '南昌市', tag: 'N', code: '3601'),
      const CityModel(name: '上海市', tag: 'S', code: '3100'),
      const CityModel(name: '深圳市', tag: 'S', code: '4403'),
      const CityModel(name: '苏州市', tag: 'S', code: '3205'),
      const CityModel(name: '天津市', tag: 'T', code: '1200'),
      const CityModel(name: '太原市', tag: 'T', code: '1401'),
      const CityModel(name: '武汉市', tag: 'W', code: '4201'),
      const CityModel(name: '无锡市', tag: 'W', code: '3202'),
      const CityModel(name: '西安市', tag: 'X', code: '6101'),
      const CityModel(name: '厦门市', tag: 'X', code: '3502'),
      const CityModel(name: '郑州市', tag: 'Z', code: '4101'),
      const CityModel(name: '珠海市', tag: 'Z', code: '4404'),
    ];
  }
}
