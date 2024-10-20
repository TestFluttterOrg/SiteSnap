import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sitesnap/core/constants/app_strings.dart';
import 'package:sitesnap/features/domain/model/brand_model.dart';
import 'package:sitesnap/features/domain/repository/brand_repository.dart';
import 'package:sitesnap/features/presentation/screen/others/%20bloc/others_state.dart';

enum OthersUIEvent {
  initial,
}

// enum BrandType {
//   none(""),
//   apple(AppStrings.apple),
//   windows(AppStrings.windows),
//   samsung(AppStrings.samsung);
//
//   final String name;
//   const BrandType(this.name);
// }

class OthersBloc extends Cubit<OthersState> {
  final BrandRepository brandRepository;

  OthersBloc({
    required this.brandRepository,
  }) : super(const OthersState());

  List<BrandModel> brands = [];

  void initialize() async {
    brands.clear();
    brands.addAll(await brandRepository.getBrands());

    if (brands.isNotEmpty) {
      final data = brands[0];
      emit(
        state.copyWith(
          currentBrand: data,
          reloadBrands: !state.reloadBrands,
        ),
      );
    }
  }

  void onPageChange(int pageIndex) {
    final data = brands[pageIndex];
    emit(
      state.copyWith(
        currentBrand: data,
      ),
    );
  }
}
