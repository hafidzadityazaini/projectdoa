class AmalanModel {
  final int id;
  final String title;

  AmalanModel({
    required this.id,
    required this.title,
  });

  factory AmalanModel.fromMap(Map<String, dynamic> json) {
    return AmalanModel(
      id: json['id'],
      title: json['title'],
    );
  }
}