import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  final String errorMessage;
  final bool isButtonEnable;

  const UserState({
    this.errorMessage = "",
    this.isButtonEnable = false,
  });

  UserState copyWith({
    String? errorMessage,
    bool? isButtonEnable,
  }) =>
      UserState(
        errorMessage: errorMessage ?? this.errorMessage,
        isButtonEnable: isButtonEnable ?? this.isButtonEnable,
      );

  @override
  List<Object?> get props => [
        errorMessage,
        isButtonEnable,
      ];
}
