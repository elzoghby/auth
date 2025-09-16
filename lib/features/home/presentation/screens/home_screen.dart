import 'package:auth/core/Theme/Local_colors.dart';
import 'package:auth/core/utils/extensions/request_handle_extension.dart';
import 'package:auth/features/home/domain/entities/home_user_entity.dart';
import 'package:auth/features/home/presentation/providers/usecase_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/Theme/text_styles.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../providers/controllers_provider.dart';
import '../widgets/user_card.dart';


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeStateNotifierProvider.notifier).call();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    handleState(
      homeStateNotifierProvider,
      showLoading: true,

    );


    return PopScope(
      child: Scaffold(
        appBar: CustomAppBar(
          navigated: context.canPop(),
          appContext: context,
          title: 'Home screen',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children:[
                    Lottie.asset(Assets.imagesWelcome,height: 20.h),
                    SizedBox(height: 20.px,),
                    UserCard( user: ref.read(homeStateNotifierProvider).data??HomeUser(),),SizedBox(height: 20.px,),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
