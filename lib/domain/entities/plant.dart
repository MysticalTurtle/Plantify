import 'suggestion.dart';

class Plant {
  final List<String> images;
  final String name;
  final String scientificName;
  final List<Suggestion> suggestions;

  Plant({
    required this.images,
    required this.name,
    required this.scientificName,
    required this.suggestions,
  });

}