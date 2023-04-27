// ignore_for_file: file_names

class FavoriteM {
  int? id;
  String text;
  String text1;
  String first;
  String second;

  FavoriteM(
      {this.id,
      required this.text,
      required this.first,
      required this.second,
      required this.text1});

  FavoriteM.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        text = res['text'],
        text1 = res['text1'],
        first = res['first'],
        second = res['second'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'text': text,
      'text1': text1,
      'first': first,
      'second': second,
    };
  }
}
