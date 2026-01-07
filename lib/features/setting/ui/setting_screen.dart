import 'package:flutter/material.dart';
import 'package:universe/features/setting/ui/widgets/setting_screen_body.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingScreenBody(),
    );
  }
}
