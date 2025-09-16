import '../../../../core/utils/typedefs.dart';
import '../../data/data_sources/data_sources.dart';
import '../../domain/repositories/home_repository.dart';

class HomeRepositoryImp extends HomeRepository {
  final HomeRemoteDataSource _dataSource;

  HomeRepositoryImp(this._dataSource);

  @override
  FutureResponseModel getUser() {
    return _dataSource.getUser();
  }




}
