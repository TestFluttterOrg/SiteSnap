import 'package:equatable/equatable.dart';
import 'package:sitesnap/features/domain/model/brand_model.dart';
import 'package:sitesnap/features/presentation/screen/others/%20bloc/others_bloc.dart';

class OthersState extends Equatable {
  final OthersUIEvent event;
  final bool reloadBrands;
  final BrandModel? currentBrand;

  const OthersState({
    this.event = OthersUIEvent.initial,
    this.reloadBrands = false,
    this.currentBrand,
  });

  OthersState copyWith({
    OthersUIEvent? event,
    bool? reloadBrands,
    BrandModel? currentBrand,
  }) =>
      OthersState(
        event: event ?? this.event,
        reloadBrands: reloadBrands ?? this.reloadBrands,
        currentBrand: currentBrand ?? this.currentBrand,
      );

  @override
  List<Object?> get props => [
        event,
        reloadBrands,
        currentBrand,
      ];
}
