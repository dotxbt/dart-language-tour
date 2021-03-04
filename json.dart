import 'dart:convert';

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}

void jsonExample() {
  String jsonString = "{\"name\": \"Sabituddin Bigbang\",\"email\": \"dotxbt@gmail.com\"}";
  var userMap = jsonDecode(jsonString);
  var user = User.fromJson(userMap);
  print('Howdy, ${user.name}!');
  print('We sent the verification link to ${user.email}.');
}
