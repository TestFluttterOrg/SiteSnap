import 'package:equatable/equatable.dart';

class ResultModel<T> extends Equatable {
  final bool isSuccess;
  final String message;
  final T? data;

  const ResultModel({
    this.isSuccess = false,
    this.message = "",
    this.data,
  });

  @override
  List<Object?> get props => [
        isSuccess,
        message,
        data,
      ];
}
