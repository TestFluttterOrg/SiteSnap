import 'package:either_dart/src/either.dart';
import 'package:sitesnap/features/data/datasource/auth_datasource.dart';
import 'package:sitesnap/features/data/datasource/constants/PrefKeys.dart';
import 'package:sitesnap/features/data/datasource/shared_pref_datasource.dart';
import 'package:sitesnap/features/domain/entity/login/login_payload_entity.dart';
import 'package:sitesnap/features/domain/model/failed_model.dart';
import 'package:sitesnap/features/domain/model/success_model.dart';
import 'package:sitesnap/features/domain/model/user_model.dart';
import 'package:sitesnap/features/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource authDataSource;
  final SharedPrefDataSource sharedPrefDataSource;

  AuthRepositoryImpl({
    required this.authDataSource,
    required this.sharedPrefDataSource,
  });

  @override
  Future<Either<FailedModel, SuccessModel<UserModel>>> login(
    String username,
    String otp,
  ) async {
    final data = LoginPayloadEntity(userName: username, otp: otp);
    final result = await authDataSource.login(data);
    if (result.isSuccess) {
      final userCode = result.data?.userId ?? "";
      final userImage = result.data?.profilePicture ?? "";

      //Save the username and userCode to local
      await sharedPrefDataSource.setData(PrefKeys.username, username);
      await sharedPrefDataSource.setData(PrefKeys.userId, userCode);
      await sharedPrefDataSource.setData(PrefKeys.userImg, userImage);

      return Right(
        SuccessModel(
          data: UserModel(
            username: username,
            userId: userCode,
            imgUrl: userImage,
          ),
        ),
      );
    } else {
      return Left(FailedModel(message: result.message));
    }
  }

  @override
  Future<void> logout() async {
    await sharedPrefDataSource.clearData(PrefKeys.username);
    await sharedPrefDataSource.clearData(PrefKeys.userId);
    await sharedPrefDataSource.clearData(PrefKeys.userImg);
    //Delay in 3 seconds to simulate an API call
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Future<UserModel?> getUser() async {
    final username = await sharedPrefDataSource.getData(PrefKeys.username) ?? "";
    final userId = await sharedPrefDataSource.getData(PrefKeys.userId) ?? "";
    final userImg = await sharedPrefDataSource.getData(PrefKeys.userImg) ?? "";

    if (username == "" || userId == "") {
      return null;
    } else {
      return UserModel(
        username: username,
        userId: userId,
        imgUrl: userImg,
      );
    }
  }
}
