class PlantRecord {
  final String id;
  final String name;
  final String scientificName;
  final String description;
  final String imageUrl;
  final String date;

  PlantRecord({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.description,
    required this.imageUrl,
    required this.date,
  });

  factory PlantRecord.fromJson(Map<String, dynamic> json) {
    return PlantRecord(
      id: json['id'],
      name: json['name'],
      scientificName: json['scientificName'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'scientificName': scientificName,
      'description': description,
      'imageUrl': imageUrl,
      'date': date,
    };
  }
}