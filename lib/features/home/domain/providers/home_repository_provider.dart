import '../../data/poviders/home_remote_datasource_provider.dart';
import '../../data/repositories/home_repository_imp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/home_repository.dart';


  /* Provide repositories */

final homeRepoProvider = Provider<HomeRepository>((ref)  {
  return HomeRepositoryImp(ref.read(homeRemoteDataSourceProvider));
});
