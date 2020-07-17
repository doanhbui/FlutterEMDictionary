import 'dart:convert';

class Definition {
  final int id;
  final String word;
  final String myanmarDefinition;
  final String englishDefinition;

  Definition({
    this.id,
    this.word,
    this.myanmarDefinition,
    this.englishDefinition,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
      'myanmarDefinition': myanmarDefinition,
      'englishDefinition': englishDefinition,
    };
  }

  static Definition fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Definition(
      id: map['id'],
      word: map['word'],
      myanmarDefinition: map['myanmarDefinition'],
      englishDefinition: map['englishDefinition'],
    );
  }

  String toJson() => json.encode(toMap());

  static Definition fromJson(String source) => fromMap(json.decode(source));
}
