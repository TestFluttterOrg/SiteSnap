import 'package:equatable/equatable.dart';

class BrandModel extends Equatable {
  final String name;
  final String webUrl;
  final String image;

  const BrandModel({
    required this.name,
    required this.webUrl,
    required this.image,
  });

  @override
  List<Object?> get props => [
        name,
        webUrl,
        image,
      ];
}
