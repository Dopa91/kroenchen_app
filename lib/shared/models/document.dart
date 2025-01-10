class Document {
  final String id;
  final String name;
  final List<String> filePaths;
  final DateTime addedDate;

  Document({
    required this.id,
    required this.name,
    required this.filePaths,
    required this.addedDate,
  });
  Document copyWith({
    String? id,
    String? name,
    List<String>? filePaths,
    DateTime? addedDate,
  }) {
    return Document(
      id: id ?? this.id,
      name: name ?? this.name,
      filePaths: filePaths ?? this.filePaths,
      addedDate: addedDate ?? this.addedDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'filePaths': filePaths,
      'addedDate': addedDate.toIso8601String(),
    };
  }

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['id'],
      name: json['name'],
      filePaths: List<String>.from(json['filePaths']),
      addedDate: DateTime.parse(json['addedDate']),
    );
  }
}
