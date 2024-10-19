import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sitesnap/features/domain/model/social_model.dart';
import 'package:sitesnap/features/domain/repository/auth_repository.dart';
import 'package:sitesnap/features/presentation/screen/home/bloc/home_state.dart';

enum HomeUIEvent {
  initial,
}

class HomeBloc extends Cubit<HomeState> {
  final AuthRepository authRepository;

  HomeBloc({
    required this.authRepository,
  }) : super(const HomeState());

  List<SocialModel> socialList = [];

  void initialize(List<SocialModel> dataList) async {
    final userData = await authRepository.getUser();
    socialList.clear();
    socialList.addAll(dataList);
    emit(
      state.copyWith(
        userData: userData,
        reloadIconList: !state.reloadIconList,
      ),
    );
  }
}
