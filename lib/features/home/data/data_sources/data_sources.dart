import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/http_operation.dart';
import '../../../../core/utils/typedefs.dart';

class HomeRemoteDataSource {
  final HttpOperations _httpOps;

  HomeRemoteDataSource(this._httpOps);

  FutureResponseModel getUser() {
    return _httpOps.getData(
      authorized: true,
      endPoint: getUserEndPoint,
    );
  }


}
