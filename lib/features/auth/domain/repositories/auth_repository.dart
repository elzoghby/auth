import '../../../../core/utils/typedefs.dart';

abstract class AuthRepository {
  FutureResponseModel login({String? username, String? password});


  FutureResponseModel signUp({
    String? firstName,
    String? lastName,
    String? email,
    String? username,
    String? password,

  });
}
