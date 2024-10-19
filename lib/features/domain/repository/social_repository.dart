import 'package:either_dart/either.dart';
import 'package:sitesnap/features/domain/model/failed_model.dart';
import 'package:sitesnap/features/domain/model/social_model.dart';
import 'package:sitesnap/features/domain/model/success_model.dart';

abstract class SocialRepository {
  Future<Either<FailedModel, SuccessModel<List<SocialModel>>>> getSocials();
}