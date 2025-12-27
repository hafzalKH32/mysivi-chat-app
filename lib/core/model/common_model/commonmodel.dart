class CommentResponseModel {
  final List<CommentModel> comments;

  CommentResponseModel({required this.comments});

  factory CommentResponseModel.fromJson(Map<String, dynamic> json) {
    return CommentResponseModel(
      comments: (json['comments'] as List<dynamic>)
          .map((item) => CommentModel.fromJson(item))
          .toList(),
    );
  }
}

class CommentModel {
  final int id;
  final String body;
  final int postId;
  final int likes;
  final UserModel user;

  CommentModel({
    required this.id,
    required this.body,
    required this.postId,
    required this.likes,
    required this.user,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      body: json['body'],
      postId: json['postId'],
      likes: json['likes'],
      user: UserModel.fromJson(json['user']),
    );
  }
}

class UserModel {
  final int id;
  final String username;
  final String fullName;

  UserModel({required this.id, required this.username, required this.fullName});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      fullName: json['fullName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'username': username, 'fullName': fullName};
  }
}
