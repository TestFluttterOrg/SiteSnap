import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String username;
  final String userCode;

  const UserModel({
    this.username = "",
    this.userCode = "",
  });

  @override
  List<Object?> get props => [
        username,
        userCode,
      ];
}
