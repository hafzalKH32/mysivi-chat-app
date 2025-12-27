class User {
  final String id;
  final String name;
  final String avatarColor;
  final bool isOnline;
  final String? lastMessage;
  final String? lastMessageTime;
  final int? unreadCount;

  User({
    required this.id,
    required this.name,
    required this.avatarColor,
    this.isOnline = false,
    this.lastMessage,
    this.lastMessageTime,
    this.unreadCount,
  });
}