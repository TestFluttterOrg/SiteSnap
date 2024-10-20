import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String username;
  final String userId;
  final String imgUrl;

  const UserModel({
    this.username = "",
    this.userId = "",
    this.imgUrl = "",
  });

  @override
  List<Object?> get props => [
        username,
        userId,
        imgUrl,
      ];
}
