class User {
  User({
    this.id,
    this.name,
    this.username,
  });

  int? id;
  String? name;
  String? username;

  User.initial()
      : id = 1,
        name = "",
        username = "";

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
      );
}
