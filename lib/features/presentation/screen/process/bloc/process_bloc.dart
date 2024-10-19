import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sitesnap/features/domain/model/process_param_model.dart';
import 'package:sitesnap/features/presentation/screen/process/bloc/process_state.dart';

enum ProcessType {
  none,
  login,
  logout,
  fetch,
}

enum ProcessUIEvent {
  initial,
}

class ProcessBloc extends Cubit<ProcessState> {
  ProcessBloc() : super(const ProcessState());

  void initialize(ProcessParamModel data) {
    emit(
      state.copyWith(
        processType: data.processType,
      ),
    );
  }
}
