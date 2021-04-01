class UserModel {
  String userId, username, email, pic;

  UserModel({this.userId, this.username, this.email, this.pic});

  UserModel.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    username = map['username'];
    email = map['email'];
    pic = map['pic'];
  }
  toJson() => {
        'userId': userId,
        'username': username,
        'email': email,
        'pic': pic,
      };
}
