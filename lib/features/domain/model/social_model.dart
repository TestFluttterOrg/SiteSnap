import 'package:equatable/equatable.dart';

class SocialModel extends Equatable {
  final String name;
  final String history;
  final String iconUrl;
  final String imgUrl;
  final String webUrl;
  final bool isFromApi;

  const SocialModel({
    this.name = "",
    this.history = "",
    this.iconUrl = "",
    this.imgUrl = "",
    this.webUrl = "",
    this.isFromApi = true,
  });

  @override
  List<Object?> get props => [
        name,
        history,
        iconUrl,
        imgUrl,
        webUrl,
        isFromApi,
      ];
}
