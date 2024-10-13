class DataModel {
  DataModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  int userId;
  int id;
  String title;
  String body;

  factory DataModel.fromMap(Map<String, dynamic> jsonData) {
    // دا شكل مختلف عن العرفه عن المودل
    // ignore: unnecessary_new
    return new DataModel(
      id: jsonData['id'] as int,
      userId: jsonData['userId'] as int? ?? 0,
      title: jsonData['title'] as String? ?? 'title not found',
      body: jsonData['body'] as String? ?? 'content not found',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // ignore: unnecessary_this
      'userId': this.userId,
      // ignore: unnecessary_this
      'id': this.id,
      // ignore: unnecessary_this
      'title': this.title,
      // ignore: unnecessary_this
      'body': this.body,
    };
  }
}
