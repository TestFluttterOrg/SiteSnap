import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sitesnap/features/domain/model/process_param_model.dart';
import 'package:sitesnap/features/domain/model/social_model.dart';
import 'package:sitesnap/features/presentation/screen/main/bloc/main_state.dart';

enum MainPageType {
  user,
  process,
  home,
}

enum MainUIEvent {
  initial,
  goToUserPage,
  goToProcessPage,
  goToHomePage,
  showErrorDialog,
}

class MainBloc extends Cubit<MainState> {
  MainBloc() : super(const MainState());

  List<SocialModel> socialList = [];

  void setEvent(MainUIEvent event) {
    emit(state.copyWith(event: event));
    emit(state.copyWith(event: MainUIEvent.initial));
  }

  void goToUserPage() {
    emit(
      state.copyWith(
        pageType: MainPageType.user,
        event: MainUIEvent.goToUserPage,
      ),
    );
    emit(state.copyWith(event: MainUIEvent.initial));
  }

  void goToProcessPage(ProcessParamModel data) {
    emit(
      state.copyWith(
        processData: data,
        event: MainUIEvent.goToProcessPage,
        pageType: MainPageType.process,
      ),
    );
    emit(state.copyWith(event: MainUIEvent.initial));
  }

  void goToHomePage(List<SocialModel> data) {
    socialList.clear();
    socialList.addAll(data);
    emit(
      state.copyWith(
        event: MainUIEvent.goToHomePage,
        pageType: MainPageType.home,
      ),
    );
    emit(state.copyWith(event: MainUIEvent.initial));
  }

  void showErrorMessage(String message) {
    emit(
      state.copyWith(
        errorMessage: message,
        event: MainUIEvent.showErrorDialog,
      ),
    );
    emit(state.copyWith(event: MainUIEvent.initial));
  }
}
