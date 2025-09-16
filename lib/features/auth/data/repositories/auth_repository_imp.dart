import '../../../../core/utils/typedefs.dart';
import '../../data/data_sources/data_sources.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImp extends AuthRepository {
  final AuthRemoteDataSource _dataSource;

  AuthRepositoryImp(this._dataSource);

  @override
  FutureResponseModel login({String? username, String? password}) {
    return _dataSource.login(username, password);
  }

  @override
  FutureResponseModel signUp({
    String? firstName,
    String? lastName,
    String? email,
    String? username,
    String? password,
  }) {
    return _dataSource.signUp(
        firstName: firstName,
        lastName: lastName,
        email: email,
        username: username,
        password: password);
  }
}
