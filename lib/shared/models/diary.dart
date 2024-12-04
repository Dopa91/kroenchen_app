class DiaryEntry {
  DateTime date;
  String content;
  bool hasFever;
  bool pain;

  DiaryEntry({
    required this.date,
    required this.content,
    required this.hasFever,
    required this.pain,
  });

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'content': content,
      'hasFever': hasFever,
      'pain': pain,
    };
  }

  static DiaryEntry fromJson(Map<String, dynamic> json) {
    return DiaryEntry(
      date: DateTime.parse(json['date']),
      content: json['content'],
      hasFever: json['hasFever'],
      pain: json['pain'],
    );
  }
}
