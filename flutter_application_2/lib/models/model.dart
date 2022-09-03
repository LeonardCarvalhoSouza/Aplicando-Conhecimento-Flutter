class User {
  final String title;

  const User({
    required this.title,
  });
  static User fromJson(body) => User(
        title: body['title'],
      );
}
