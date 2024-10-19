import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitesnap/core/interceptors/api_interceptor.dart';
import 'package:sitesnap/features/data/api/auth/auth_client.dart';
import 'package:sitesnap/features/data/api/social/social_client.dart';
import 'package:sitesnap/features/data/datasource/auth_datasource.dart';
import 'package:sitesnap/features/data/datasource/impl/auth_datasource_impl.dart';
import 'package:sitesnap/features/data/datasource/impl/shared_pref_datasource_impl.dart';
import 'package:sitesnap/features/data/datasource/impl/social_datasource_impl.dart';
import 'package:sitesnap/features/data/datasource/shared_pref_datasource.dart';
import 'package:sitesnap/features/data/datasource/social_datasource.dart';
import 'package:sitesnap/features/data/repository/auth_repository_impl.dart';
import 'package:sitesnap/features/data/repository/social_repository_impl.dart';
import 'package:sitesnap/features/domain/repository/auth_repository.dart';
import 'package:sitesnap/features/domain/repository/social_repository.dart';
import 'package:sitesnap/features/presentation/screen/process/bloc/process_bloc.dart';
import 'package:sitesnap/features/presentation/screen/user/bloc/user_bloc.dart';

final GetIt vf = GetIt.instance;

Future<void> init() async {
  Dio dio = Dio();
  dio.interceptors.add(ApiInterceptor());
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  //API Client
  vf.registerLazySingleton<AuthClient>(() => AuthClient(dio));
  vf.registerLazySingleton<SocialClient>(() => SocialClient(dio));

  //Datasource
  vf.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl(client: vf.call()));
  vf.registerLazySingleton<SharedPrefDataSource>(() => SharedPrefDataSourceImpl(sharedPref: sharedPreferences));
  vf.registerLazySingleton<SocialDataSource>(() => SocialDataSourceImpl(client: vf.call()));

  //Repository
  vf.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authDataSource: vf.call(),
      sharedPrefDataSource: vf.call(),
    ),
  );
  vf.registerLazySingleton<SocialRepository>(
    () => SocialRepositoryImpl(
      socialDataSource: vf.call(),
    ),
  );

  //BLOC
  vf.registerFactory<UserBloc>(() => UserBloc());
  vf.registerFactory<ProcessBloc>(
    () => ProcessBloc(
      authRepository: vf.call(),
      socialRepository: vf.call(),
    ),
  );
}
