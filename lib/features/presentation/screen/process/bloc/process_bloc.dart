import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sitesnap/features/domain/model/process_param_model.dart';
import 'package:sitesnap/features/domain/repository/auth_repository.dart';
import 'package:sitesnap/features/presentation/screen/process/bloc/process_state.dart';

enum ProcessType {
  none,
  login,
  logout,
  fetch,
}

enum ProcessUIEvent {
  initial,
  goToUserScreenForLoginFailure,
  goToHomeScreen,
}

class ProcessBloc extends Cubit<ProcessState> {
  final AuthRepository authRepository;

  ProcessBloc({
    required this.authRepository,
  }) : super(const ProcessState());

  void initialize(ProcessParamModel data) {
    emit(
      state.copyWith(
        processType: data.processType,
      ),
    );

    switch (data.processType) {
      case ProcessType.login:
        _performLogin(data.username, data.otp);
        break;
      case ProcessType.logout:
        break;
      default:
        break;
    }
  }

  void _performLogin(String username, String otp) async {
    final result = await authRepository.login(username, otp);
    result.fold(
      (failed) {
        emit(
          state.copyWith(
            event: ProcessUIEvent.goToUserScreenForLoginFailure,
          ),
        );
        emit(state.copyWith(event: ProcessUIEvent.initial));
      },
      (success) {
        _performDataFetch();
      },
    );
  }

  void _performDataFetch() {
    emit(state.copyWith(processType: ProcessType.fetch));
  }
}
