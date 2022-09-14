class Post {
  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
    this.likes = 0,
  });

  int? userId;
  int? id;
  String? title;
  String? body;
  int likes = 0;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
}
