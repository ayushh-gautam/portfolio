class UserModel {
  UserModel({
    required this.display_name,
    required this.email,
    required this.gender,
    required this.number,
    required this.photoUrl,
    required this.profession,
    required this.username,
  });
  late final String display_name;
  late final String email;
  late final String gender;
  late final String number;
  late final String photoUrl;
  late final String profession;
  late final String username;

  UserModel.fromJson(Map<String, dynamic> json) {
    display_name = json['display name'];
    email = json['email'];
    gender = json['gender'];
    number = json['number'];
    photoUrl = json['photoUrl'];
    profession = json['profession'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['display name'] = display_name;
    _data['email'] = email;
    _data['gender'] = gender;
    _data['number'] = number;
    _data['photoUrl'] = photoUrl;
    _data['profession'] = profession;
    _data['username'] = username;
    return _data;
  }
}
