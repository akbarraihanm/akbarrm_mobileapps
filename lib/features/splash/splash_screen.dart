import 'package:akbarrm_mobileapps/core/common/navigation.dart';
import 'package:akbarrm_mobileapps/core/config/app_color.dart';
import 'package:akbarrm_mobileapps/core/config/app_typography.dart';
import 'package:akbarrm_mobileapps/core/widgets/app_text.dart';
import 'package:akbarrm_mobileapps/features/main/presentation/page/main_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      AppNav.pushReplacement(context, MainScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.biruGelap,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: AppText(
            title: "Simple POS",
            textStyle: AppTypography.headLine(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
