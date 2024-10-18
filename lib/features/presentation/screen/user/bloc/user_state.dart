import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  final String errorMessage;
  final bool isInputValid;
  final bool isButtonEnable;

  const UserState({
    this.errorMessage = "",
    this.isInputValid = true,
    this.isButtonEnable = false,
  });

  @override
  List<Object?> get props => [
        errorMessage,
        isInputValid,
        isButtonEnable,
      ];
}
