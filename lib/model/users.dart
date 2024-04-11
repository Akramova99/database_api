class Users {
  ///atribute
  String? title;
  String? body;
  int? id;
  int? userId;

  ///constructor
  Users(
      {required this.title,
      required this.body,
      required this.id,
      required this.userId});

  /// named constructor
  /// object uchun
  Users.fromJson(Map<String, dynamic> mp)
      : title = mp["title"],
        body = mp["body"],
        id = mp["id"],
        userId = mp["userId"];
  /// to json
  Map<String, dynamic> toJson ()=>{
    "title": title,
    "body": body,
    "id": id.toString(),
    "userId": userId.toString()
  };
}
