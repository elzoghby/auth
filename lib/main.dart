import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/Theme/app_decorations.dart';
import 'core/network/helper_functions.dart';
import 'core/route/app_router.dart';
import 'core/services/get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();


  await ServiceLocator.init();



  runApp( ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp._internal(); // private named constructor
  static const MyApp instance =
  MyApp._internal(); // single instance -- singleton

  factory MyApp() => instance;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0, p1, p2) =>  MaterialApp.router(

        debugShowCheckedModeBanner: false,
        title: 'Auth',
        theme: AppDecorations.lightTheme,


        routerDelegate: appRouter.routerDelegate,
        routeInformationProvider: appRouter.routeInformationProvider,
        routeInformationParser: appRouter.routeInformationParser,
      ),
    );
  }
}
