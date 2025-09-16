
import '../../../../core/providers/http_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data_sources/data_sources.dart';

final homeRemoteDataSourceProvider = Provider<HomeRemoteDataSource>((ref) {
  final httpOps = ref.read(httpOperationsProvider); // HttpOps Provider
  return HomeRemoteDataSource(httpOps);
});
