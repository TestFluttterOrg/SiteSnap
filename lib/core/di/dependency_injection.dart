import 'package:get_it/get_it.dart';
import 'package:sitesnap/features/presentation/screen/user/bloc/user_bloc.dart';

final GetIt vf = GetIt.instance;

Future<void> init() async {

  //BLOC
  vf.registerFactory<UserBloc>(() => UserBloc());
}