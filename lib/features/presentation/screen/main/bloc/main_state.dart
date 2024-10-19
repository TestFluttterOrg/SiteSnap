import 'package:equatable/equatable.dart';
import 'package:sitesnap/features/domain/model/process_param_model.dart';
import 'package:sitesnap/features/presentation/screen/main/bloc/main_bloc.dart';

class MainState extends Equatable {
  final MainUIEvent event;
  final String errorMessage;
  final MainPageType pageType;
  final ProcessParamModel? processData;

  const MainState({
    this.event = MainUIEvent.initial,
    this.errorMessage = "",
    this.processData,
    this.pageType = MainPageType.user,
  });

  MainState copyWith({
    MainUIEvent? event,
    String? errorMessage,
    ProcessParamModel? processData,
    bool clearProcessData = false,
    MainPageType? pageType,
  }) =>
      MainState(
        event: event ?? this.event,
        errorMessage: errorMessage ?? this.errorMessage,
        processData: clearProcessData ? null : processData ?? this.processData,
        pageType: pageType ?? this.pageType,
      );

  @override
  List<Object?> get props => [
        event,
        errorMessage,
        processData,
        pageType,
      ];
}
