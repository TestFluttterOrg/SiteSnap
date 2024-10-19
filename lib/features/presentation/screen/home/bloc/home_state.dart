import 'package:equatable/equatable.dart';
import 'package:sitesnap/features/domain/model/user_model.dart';
import 'package:sitesnap/features/presentation/screen/home/bloc/home_bloc.dart';

class HomeState extends Equatable {
  final HomeUIEvent event;
  final bool reloadIconList;
  final UserModel userData;

  const HomeState({
    this.event = HomeUIEvent.initial,
    this.reloadIconList = false,
    this.userData = const UserModel(),
  });

  HomeState copyWith({
    HomeUIEvent? event,
    bool? reloadIconList,
    UserModel? userData,
  }) =>
      HomeState(
        event: event ?? this.event,
        reloadIconList: reloadIconList ?? this.reloadIconList,
        userData: userData ?? this.userData,
      );

  @override
  List<Object?> get props => [
        event,
        reloadIconList,
        userData,
      ];
}
