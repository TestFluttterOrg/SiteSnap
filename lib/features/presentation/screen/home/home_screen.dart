import 'package:flutter/material.dart';
import 'package:sitesnap/features/domain/model/social_model.dart';
import 'package:sitesnap/features/presentation/components/app_scaffold.dart';

class HomeScreen extends StatelessWidget {
  final List<SocialModel> data;

  const HomeScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: Container());
  }
}
