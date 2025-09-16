
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/http_operation.dart';
import '../../../../core/utils/typedefs.dart';

class AuthRemoteDataSource {
  final HttpOperations _httpOps;

  AuthRemoteDataSource(this._httpOps);

  FutureResponseModel login(String? username, String? password) {


    return _httpOps.postData(
      authorized: false,
      endPoint: userLoginEndPoint,
      data: {
        "username": username,
        "password": password
      },
    );
  }

  FutureResponseModel signUp(
      {String? firstName,
      String? lastName,
      String? email,
      String? username,
      String? password,
     }) {
    return _httpOps.postData(
      authorized: false,
      endPoint: userRegisterEndPoint,
      data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "username": username,
        "password": password,

      },
    );
  }



}
