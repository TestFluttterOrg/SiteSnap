import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sitesnap/core/interceptors/api_interceptor.dart';
import 'package:sitesnap/features/data/api/auth/auth_client.dart';
import 'package:sitesnap/features/data/datasource/auth_datasource.dart';
import 'package:sitesnap/features/data/datasource/impl/auth_datasource_impl.dart';
import 'package:sitesnap/features/data/repository/auth_repository_impl.dart';
import 'package:sitesnap/features/domain/repository/auth_repository.dart';
import 'package:sitesnap/features/presentation/screen/process/bloc/process_bloc.dart';
import 'package:sitesnap/features/presentation/screen/user/bloc/user_bloc.dart';

final GetIt vf = GetIt.instance;

Future<void> init() async {
  Dio dio = Dio();
  dio.interceptors.add(ApiInterceptor());

  //API Client
  vf.registerLazySingleton<AuthClient>(() => AuthClient(dio));

  //Datasource
  vf.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl(client: vf.call()));

  //Repository
  vf.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(dataSource: vf.call()));

  //BLOC
  vf.registerFactory<UserBloc>(() => UserBloc());
  vf.registerFactory<ProcessBloc>(
    () => ProcessBloc(
      authRepository: vf.call(),
    ),
  );
}
