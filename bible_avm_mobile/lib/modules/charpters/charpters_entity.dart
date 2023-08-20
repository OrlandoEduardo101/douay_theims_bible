import 'dart:convert';

import 'package:bible_avm_mobile/modules/verses/verse_entity.dart';
import 'package:flutter/foundation.dart';

class CharptersEntity {
  final int id;
  final int testamentId;
  final int bookId;
  final String charpterNumber;
  final String charpterUrl;
  final List<VerseEntity> verses;

  CharptersEntity({
    required this.id,
    required this.testamentId,
    required this.bookId,
    required this.charpterNumber,
    required this.charpterUrl,
    required this.verses,
  });

  CharptersEntity copyWith({
    int? id,
    int? testamentId,
    int? bookId,
    String? charpterNumber,
    String? charpterUrl,
    List<VerseEntity>? verses,
  }) {
    return CharptersEntity(
      id: id ?? this.id,
      testamentId: testamentId ?? this.testamentId,
      bookId: bookId ?? this.bookId,
      charpterNumber: charpterNumber ?? this.charpterNumber,
      charpterUrl: charpterUrl ?? this.charpterUrl,
      verses: verses ?? this.verses,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'testamentId': testamentId,
      'bookId': bookId,
      'charpterNumber': charpterNumber,
      'charpterUrl': charpterUrl,
      'verses': verses.map((x) => x.toMap()).toList(),
    };
  }

  factory CharptersEntity.fromMap(Map<String, dynamic> map) {
    return CharptersEntity(
      id: map['id']?.toInt() ?? 0,
      testamentId: map['testamentId']?.toInt() ?? 0,
      bookId: map['bookId']?.toInt() ?? 0,
      charpterNumber: map['charpterNumber'] ?? '',
      charpterUrl: map['charpterUrl'] ?? '',
      verses: List<VerseEntity>.from(map['verses']?.map((x) => VerseEntity.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharptersEntity.fromJson(String source) => CharptersEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CharptersEntity(id: $id, testamentId: $testamentId, bookId: $bookId, charpterNumber: $charpterNumber, charpterUrl: $charpterUrl, verses: $verses)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CharptersEntity &&
        other.id == id &&
        other.testamentId == testamentId &&
        other.bookId == bookId &&
        other.charpterNumber == charpterNumber &&
        other.charpterUrl == charpterUrl &&
        listEquals(other.verses, verses);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        testamentId.hashCode ^
        bookId.hashCode ^
        charpterNumber.hashCode ^
        charpterUrl.hashCode ^
        verses.hashCode;
  }
}
