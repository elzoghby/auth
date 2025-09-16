import '../../../../core/models/user_model.dart';

class HomeUser {
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  String? image;
  String? gender;

  HomeUser({
    this.firstName,
    this.lastName,
    this.image,
    this.email,
    this.username,
    this.gender,
  });
}

HomeUser toHomeUserEntity(UserModel user) {
  // Convert UserModel to UserEntity
  return HomeUser(
    firstName: user.firstName,
    lastName: user.lastName,
    username: user.username,
    email: user.email,
    image: user.image,
    gender: user.gender,
  );
}
