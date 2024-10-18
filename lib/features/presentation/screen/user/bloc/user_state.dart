import 'package:equatable/equatable.dart';
import 'package:sitesnap/features/presentation/screen/user/bloc/user_bloc.dart';

class UserState extends Equatable {
  final String inputData;
  final String errorMessage;
  final bool isButtonEnable;
  final UserUIEvent event;

  const UserState({
    this.inputData = "",
    this.errorMessage = "",
    this.isButtonEnable = false,
    this.event = UserUIEvent.initial,
  });

  UserState copyWith({
    String? inputData,
    String? errorMessage,
    bool? isButtonEnable,
    UserUIEvent? event,
  }) =>
      UserState(
        inputData: inputData ?? this.inputData,
        errorMessage: errorMessage ?? this.errorMessage,
        isButtonEnable: isButtonEnable ?? this.isButtonEnable,
        event: event ?? this.event,
      );

  @override
  List<Object?> get props => [
        inputData,
        errorMessage,
        isButtonEnable,
        event,
      ];
}
