import 'package:either_dart/src/either.dart';
import 'package:sitesnap/features/data/datasource/auth_datasource.dart';
import 'package:sitesnap/features/domain/entity/login/login_payload_entity.dart';
import 'package:sitesnap/features/domain/model/failed_model.dart';
import 'package:sitesnap/features/domain/model/success_model.dart';
import 'package:sitesnap/features/domain/model/user_model.dart';
import 'package:sitesnap/features/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<FailedModel, SuccessModel<UserModel>>> login(
    String username,
    String otp,
  ) async {
    final data = LoginPayloadEntity(userName: username, otp: otp);
    final result = await dataSource.login(data);
    if (result.isSuccess) {
      return Right(
        SuccessModel(
          data: UserModel(
            username: username,
            userCode: result.data ?? "",
          ),
        ),
      );
    } else {
      return Left(FailedModel(message: result.message));
    }
  }

  @override
  Future<void> logout() async {
    //Delay in 3 seconds to simulate an API call
    await Future.delayed(const Duration(seconds: 3));
  }
}
