import 'package:sitesnap/features/domain/model/failed_model.dart';
import 'package:sitesnap/features/domain/model/success_model.dart';
import 'package:sitesnap/features/domain/model/user_model.dart';
import 'package:either_dart/src/either.dart';

abstract class AuthRepository {
  Future<Either<FailedModel, SuccessModel<UserModel>>> login(String username, String otp);
  Future<void> logout();
}