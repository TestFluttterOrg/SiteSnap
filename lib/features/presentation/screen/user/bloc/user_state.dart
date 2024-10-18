import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  final String inputData;
  final String errorMessage;
  final bool isButtonEnable;

  const UserState({
    this.inputData = "",
    this.errorMessage = "",
    this.isButtonEnable = false,
  });

  UserState copyWith({
    String? inputData,
    String? errorMessage,
    bool? isButtonEnable,
  }) =>
      UserState(
        inputData: inputData ?? this.inputData,
        errorMessage: errorMessage ?? this.errorMessage,
        isButtonEnable: isButtonEnable ?? this.isButtonEnable,
      );

  @override
  List<Object?> get props => [
        inputData,
        errorMessage,
        isButtonEnable,
      ];
}
