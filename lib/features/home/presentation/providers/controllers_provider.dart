import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/home_controller.dart';

final homeControllerProvider = Provider.autoDispose<HomeController>((ref) {
  final controller = HomeController(ref);

  return controller;
});
