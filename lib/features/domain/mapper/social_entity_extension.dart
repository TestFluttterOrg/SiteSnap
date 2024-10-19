import 'package:sitesnap/features/domain/entity/social/social_entity.dart';
import 'package:sitesnap/features/domain/model/social_model.dart';

extension SocialEntityExtension on SocialEntity {
  SocialModel mapToSocialModel() {
    final data = this;
    return SocialModel(
      name: data.name ?? "",
      history: data.history ?? "",
      iconUrl: data.iconUrl ?? "",
      imgUrl: data.imgUrl ?? "",
      webUrl: data.webUrl ?? "",
    );
  }
}