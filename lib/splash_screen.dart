import 'package:flutter/material.dart';
import 'package:it_mcq/core/router/app_navigator.dart';

import 'package:it_mcq/resources/text_styles.dart';
import 'package:it_mcq/utility/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () async {
      AppNavigator.goToLogin(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(child: iconAsset('logo', height: 100, width: 100)),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Skill Stack',
                style: st48RegularAbel(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 36),
            ],
          ),
        ],
      ),
    );
  }
}
