// ignore_for_file: file_names

class ChatMessage2 {
  int? id;
  final String text;

  final String time;

  ChatMessage2({
    this.id,
    required this.text,
    required this.time,
  });
  ChatMessage2.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        text = res['text'],
        time = res['time'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'text': text,
      'time': time,
    };
  }
}
