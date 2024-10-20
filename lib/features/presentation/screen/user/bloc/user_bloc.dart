import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sitesnap/core/constants/app_strings.dart';
import 'package:sitesnap/core/utility/app_utility.dart';
import 'package:sitesnap/features/domain/repository/auth_repository.dart';
import 'package:sitesnap/features/presentation/screen/user/bloc/user_state.dart';

enum UserUIEvent {
  initial,
  showEnterCode,
  goToNextPageLoggingIn,
  goToNextPageFetching,
  hideDialog,
}

class UserBloc extends Cubit<UserState> {
  final AuthRepository authRepository;

  UserBloc({required this.authRepository,}) : super(const UserState());

  void initialize() async {
    final userData = await authRepository.getUser();
    if (userData != null) {
      emit(state.copyWith(event: UserUIEvent.goToNextPageFetching));
      emit(state.copyWith(event: UserUIEvent.initial));
    }
  }

  void filterEnteredText(String text) {
    final textTrimmed = text.trim();
    if (textTrimmed == "" || textTrimmed == " ") {
      emit(
        state.copyWith(
          errorMessage: AppStrings.messageEnterUsername,
          isButtonEnable: false,
        ),
      );
    } else if (!AppUtility.isAlphanumeric(text)) {
      emit(
        state.copyWith(
          errorMessage: AppStrings.messageValueMustBeAlphaNumeric,
          isButtonEnable: false,
        ),
      );
    } else if (text.length > 24) {
      emit(
        state.copyWith(
          errorMessage: AppStrings.messageNotExceedCharLimit,
          isButtonEnable: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          errorMessage: "",
          isButtonEnable: true,
          username: text,
        ),
      );
    }
  }

  void verifyCode(String code) async {
    if (code.length == 6) {
      emit(
        state.copyWith(
          event: UserUIEvent.hideDialog,
          code: code,
        ),
      );
      await Future.delayed(const Duration(milliseconds: 500));
      emit(state.copyWith(event: UserUIEvent.goToNextPageLoggingIn));
      emit(state.copyWith(event: UserUIEvent.initial));
    }
  }

  void onEnterPress() {
    emit(state.copyWith(event: UserUIEvent.showEnterCode));
    emit(state.copyWith(event: UserUIEvent.initial));
  }
}
