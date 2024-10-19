import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:sitesnap/features/presentation/screen/process/bloc/process_bloc.dart';

class ProcessState extends Equatable {
  final ProcessType processType;
  final ProcessUIEvent event;
  final Object? otherParam;
  final String errorMessage;

  const ProcessState({
    this.processType = ProcessType.none,
    this.event = ProcessUIEvent.initial,
    this.otherParam,
    this.errorMessage = "",
  });

  ProcessState copyWith({
    ProcessType? processType,
    ProcessUIEvent? event,
    Object? otherParam,
    String? errorMessage,
  }) =>
      ProcessState(
        processType: processType ?? this.processType,
        event: event ?? this.event,
        otherParam: otherParam ?? this.otherParam,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        processType,
        event,
        otherParam,
        errorMessage,
      ];
}
