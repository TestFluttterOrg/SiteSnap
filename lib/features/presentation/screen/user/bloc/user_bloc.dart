import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sitesnap/features/presentation/screen/user/bloc/user_state.dart';

class UserBloc extends Cubit<UserState> {
  UserBloc() : super(const UserState());
}