class Message {
  final String text;
  final String time;
  final bool isMe;
  final bool hasHeart;

  Message({
    required this.text,
    required this.time,
    required this.isMe,
    this.hasHeart = false,
  });
}