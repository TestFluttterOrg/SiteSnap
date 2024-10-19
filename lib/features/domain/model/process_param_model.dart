import 'package:equatable/equatable.dart';
import 'package:sitesnap/features/presentation/screen/process/bloc/process_bloc.dart';

class ProcessParamModel extends Equatable {
  final String username;
  final String otp;
  final ProcessType processType;

  const ProcessParamModel({
    this.username = "",
    this.otp = "",
    this.processType = ProcessType.none,
  });

  @override
  List<Object?> get props => [
        username,
        otp,
        processType,
      ];
}
