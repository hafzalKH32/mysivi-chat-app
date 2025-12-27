class WordModel {
  final String word;
  final List<Definition> definitions;

  WordModel({required this.word, required this.definitions});

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      word: json['word'] ?? '',
      definitions:
          (json['definitions'] as List<dynamic>?)
              ?.map((item) => Definition.fromJson(item))
              .toList() ??
          [],
    );
  }
}

class Definition {
  final String partOfSpeech;
  final String definition;

  Definition({required this.partOfSpeech, required this.definition});

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      partOfSpeech: json['part_of_speech'] ?? '',
      definition: json['definition'] ?? '',
    );
  }
}
