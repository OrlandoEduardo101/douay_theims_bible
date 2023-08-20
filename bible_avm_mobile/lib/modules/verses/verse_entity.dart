import 'dart:convert';

class VerseEntity {
  final int id;
  final int charpterId;
  final int bookId;
  final int testamentId;

  final String verseNumber;
  final String verseText;
  VerseEntity({
    required this.id,
    required this.charpterId,
    required this.bookId,
    required this.testamentId,
    required this.verseNumber,
    required this.verseText,
  });

  VerseEntity copyWith({
    int? id,
    int? charpterId,
    int? bookId,
    int? testamentId,
    String? verseNumber,
    String? verseText,
  }) {
    return VerseEntity(
      id: id ?? this.id,
      charpterId: charpterId ?? this.charpterId,
      bookId: bookId ?? this.bookId,
      testamentId: testamentId ?? this.testamentId,
      verseNumber: verseNumber ?? this.verseNumber,
      verseText: verseText ?? this.verseText,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'charpterId': charpterId,
      'bookId': bookId,
      'testamentId': testamentId,
      'verseNumber': verseNumber,
      'verseText': verseText,
    };
  }

  factory VerseEntity.fromMap(Map<String, dynamic> map) {
    return VerseEntity(
      id: map['id']?.toInt() ?? 0,
      charpterId: map['charpterId']?.toInt() ?? 0,
      bookId: map['bookId']?.toInt() ?? 0,
      testamentId: map['testamentId']?.toInt() ?? 0,
      verseNumber: map['verseNumber'] ?? '',
      verseText: map['verseText'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VerseEntity.fromJson(String source) => VerseEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VerseEntity(id: $id, charpterId: $charpterId, bookId: $bookId, testamentId: $testamentId, verseNumber: $verseNumber, verseText: $verseText)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VerseEntity &&
        other.id == id &&
        other.charpterId == charpterId &&
        other.bookId == bookId &&
        other.testamentId == testamentId &&
        other.verseNumber == verseNumber &&
        other.verseText == verseText;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        charpterId.hashCode ^
        bookId.hashCode ^
        testamentId.hashCode ^
        verseNumber.hashCode ^
        verseText.hashCode;
  }
}
