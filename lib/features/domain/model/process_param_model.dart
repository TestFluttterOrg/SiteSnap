import 'package:sitesnap/features/presentation/screen/process/bloc/process_bloc.dart';

class ProcessParamModel {
  final String username;
  final String code;
  final ProcessType processType;

  const ProcessParamModel({
    this.username = "",
    this.code = "",
    this.processType = ProcessType.none,
  });
}
