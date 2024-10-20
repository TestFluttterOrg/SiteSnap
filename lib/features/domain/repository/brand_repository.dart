import 'package:sitesnap/features/domain/model/brand_model.dart';

abstract class BrandRepository {
  Future<List<BrandModel>> getBrands();
}