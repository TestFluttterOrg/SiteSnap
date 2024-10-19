import 'package:equatable/equatable.dart';
import 'package:sitesnap/features/presentation/screen/process/bloc/process_bloc.dart';

class ProcessState extends Equatable {
  final ProcessType processType;
  final ProcessUIEvent event;

  const ProcessState({
    this.processType = ProcessType.none,
    this.event = ProcessUIEvent.initial,
  });

  ProcessState copyWith({
    ProcessType? processType,
    ProcessUIEvent? event,
  }) =>
      ProcessState(
        processType: processType ?? this.processType,
        event: event ?? this.event,
      );

  @override
  List<Object?> get props => [
        processType,
        event,
      ];
}
