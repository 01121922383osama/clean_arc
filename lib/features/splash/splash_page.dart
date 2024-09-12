import 'package:clean_arc/config/router/routes_name.dart';
import 'package:clean_arc/core/constants/app_lotties.dart';
import 'package:clean_arc/core/extension/navigations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          AppLotties.pation,
          onLoaded: (_) {
            context.pushReplacementNamed(pageRoute: RoutesName.home);
          },
        ),
      ),
    );
  }
}
