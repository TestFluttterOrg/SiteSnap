import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sitesnap/features/domain/model/process_param_model.dart';
import 'package:sitesnap/features/domain/repository/auth_repository.dart';
import 'package:sitesnap/features/domain/repository/social_repository.dart';
import 'package:sitesnap/features/presentation/screen/process/bloc/process_state.dart';

enum ProcessType {
  none,
  login,
  logout,
  fetch,
}

enum ProcessUIEvent {
  initial,
  goToUserScreenFromLoginFailure,
  goToUserScreenFromLoggingOut,
  goToHomeScreen,
  fetchFailed,
}

class ProcessBloc extends Cubit<ProcessState> {
  final AuthRepository authRepository;
  final SocialRepository socialRepository;

  ProcessBloc({
    required this.authRepository,
    required this.socialRepository,
  }) : super(const ProcessState());

  void initialize(ProcessParamModel data) {
    emit(state.copyWith(processType: data.processType));

    switch (data.processType) {
      case ProcessType.login:
        _performLogin(data.username, data.otp);
        break;
      case ProcessType.logout:
        _performLogout();
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
            event: ProcessUIEvent.goToUserScreenFromLoginFailure,
            errorMessage: failed.message,
          ),
        );
        emit(state.copyWith(event: ProcessUIEvent.initial));
      },
      (success) {
        performDataFetch();
      },
    );
  }

  void performDataFetch() async {
    emit(state.copyWith(processType: ProcessType.fetch));
    final result = await socialRepository.getSocials();
    result.fold(
      (failed) {
        emit(
          state.copyWith(
            event: ProcessUIEvent.fetchFailed,
            errorMessage: failed.message,
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            event: ProcessUIEvent.goToHomeScreen,
            otherParam: success.data ?? [],
          ),
        );
      },
    );
    emit(state.copyWith(event: ProcessUIEvent.initial));
  }

  void _performLogout() async {
    await authRepository.logout();
    emit(state.copyWith(event: ProcessUIEvent.goToUserScreenFromLoggingOut));
    emit(state.copyWith(event: ProcessUIEvent.initial));
  }
}
