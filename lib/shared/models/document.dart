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
}
