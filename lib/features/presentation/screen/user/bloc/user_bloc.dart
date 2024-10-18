import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sitesnap/core/constants/app_strings.dart';
import 'package:sitesnap/core/utility/app_utility.dart';
import 'package:sitesnap/features/presentation/screen/user/bloc/user_state.dart';

enum UserUIEvent {
  initial,
  showEnterCode,
  goToNextPage,
}

class UserBloc extends Cubit<UserState> {
  UserBloc() : super(const UserState());

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
          inputData: text,
        ),
      );
    }
  }

  void onEnterPress() {
    emit(state.copyWith(event: UserUIEvent.showEnterCode));
    emit(state.copyWith(event: UserUIEvent.initial));
  }
}
