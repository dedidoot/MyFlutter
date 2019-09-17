class UserModel {
  String id;
  String firstName;
  String lastName;

  UserModel({this.id, this.firstName, this.lastName});

  factory UserModel.createUser(Map<String, dynamic> jsonObject) {
    return UserModel(
      id: jsonObject["id"].toString(),
      firstName: jsonObject["first_name"],
      lastName: jsonObject["last_name"],
    );
  }
}
