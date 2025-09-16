import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/route/app_paths.dart';
import '../../../../core/services/get_it.dart';
import '../../../../core/utils/extensions/request_handle_extension.dart';
import '../../domain/providers/user_provider.dart';
import '../providers/usecase_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () async {




      if (ServiceLocator.prefs.getString(UserKeys.userToken) != null) {
        ref.read(userProvider.notifier).setUser();
        context.go(mainScreenRoute);
      } else {

        context.go(loginScreenRoute);
        // }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    handleState(loginStateNotifierProvider, showLoading: true);
    return Scaffold(
        body: Center(
      child: Lottie.asset(
        fit: BoxFit.cover,
        Assets.imagesWelcome,
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
