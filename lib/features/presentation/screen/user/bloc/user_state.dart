import 'package:equatable/equatable.dart';
import 'package:sitesnap/features/presentation/screen/user/bloc/user_bloc.dart';

class UserState extends Equatable {
  final String username;
  final String code;
  final String errorMessage;
  final bool isButtonEnable;
  final UserUIEvent event;

  const UserState({
    this.username = "",
    this.code = "",
    this.errorMessage = "",
    this.isButtonEnable = false,
    this.event = UserUIEvent.initial,
  });

  UserState copyWith({
    String? username,
    String? code,
    String? errorMessage,
    bool? isButtonEnable,
    UserUIEvent? event,
  }) =>
      UserState(
        username: username ?? this.username,
        code: code ?? this.code,
        errorMessage: errorMessage ?? this.errorMessage,
        isButtonEnable: isButtonEnable ?? this.isButtonEnable,
        event: event ?? this.event,
      );

  @override
  List<Object?> get props => [
        username,
        code,
        errorMessage,
        isButtonEnable,
        event,
      ];
}
