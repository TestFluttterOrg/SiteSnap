import 'package:sitesnap/features/domain/entity/social/social_entity.dart';
import 'package:sitesnap/features/domain/model/result_model.dart';

abstract class SocialDataSource {
  Future<ResultModel<List<SocialEntity>>> getSocials();
}