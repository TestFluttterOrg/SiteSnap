import 'package:sitesnap/core/constants/app_assets.dart';
import 'package:sitesnap/core/constants/app_strings.dart';
import 'package:sitesnap/features/domain/model/brand_model.dart';
import 'package:sitesnap/features/domain/repository/brand_repository.dart';

class BrandRepositoryImpl extends BrandRepository {
  @override
  Future<List<BrandModel>> getBrands() async {
    final brands = <BrandModel>[];
    brands.add(const BrandModel(name: AppStrings.samsung, webUrl: "https://www.samsung.com", image: AppAssets.samsung));
    brands.add(const BrandModel(name: AppStrings.apple, webUrl: "https://www.apple.com", image: AppAssets.apple));
    brands.add(const BrandModel(name: AppStrings.windows, webUrl: "https://www.microsoft.com", image: AppAssets.windows));
    return brands;
  }
}