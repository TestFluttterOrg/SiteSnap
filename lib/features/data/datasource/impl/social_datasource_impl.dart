import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sitesnap/core/constants/app_strings.dart';
import 'package:sitesnap/features/data/api/social/social_client.dart';
import 'package:sitesnap/features/data/datasource/social_datasource.dart';
import 'package:sitesnap/features/domain/entity/social/social_entity.dart';
import 'package:sitesnap/features/domain/model/result_model.dart';

class SocialDataSourceImpl extends SocialDataSource {
  final SocialClient client;

  SocialDataSourceImpl({required this.client});

  @override
  Future<ResultModel<List<SocialEntity>>> getSocials() async {
    try {
      final result = await client.getSocials();
      final data = result.data;
      return ResultModel(isSuccess: true, data: data);
    } on DioException catch (e) {
      print("DIO ERROR");
    } catch (e) {
      print("CATCH");
    }
    return const ResultModel(
      isSuccess: false,
      message: AppStrings.messageFailedToGetSocials,
    );
  }
}
