import 'package:either_dart/src/either.dart';
import 'package:sitesnap/features/data/datasource/social_datasource.dart';
import 'package:sitesnap/features/domain/mapper/social_entity_extension.dart';
import 'package:sitesnap/features/domain/model/failed_model.dart';
import 'package:sitesnap/features/domain/model/social_model.dart';
import 'package:sitesnap/features/domain/model/success_model.dart';
import 'package:sitesnap/features/domain/repository/social_repository.dart';

class SocialRepositoryImpl extends SocialRepository {
  final SocialDataSource socialDataSource;

  SocialRepositoryImpl({required this.socialDataSource});

  @override
  Future<Either<FailedModel, SuccessModel<List<SocialModel>>>> getSocials() async {
    final result = await socialDataSource.getSocials();
    if (result.isSuccess) {
      final list = result.data ?? [];
      final socialList = list.map((e) => e.mapToSocialModel()).toList();
      //Others
      socialList.add(
        const SocialModel(
          name: "Others",
          isFromApi: false,
        ),
      );
      return Right(SuccessModel(data: socialList));
    } else {
      return Left(FailedModel(message: result.message));
    }
  }
}
