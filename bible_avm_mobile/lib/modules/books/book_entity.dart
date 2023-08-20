import 'dart:convert';

import 'package:bible_avm_mobile/modules/charpters/charpters_entity.dart';
import 'package:flutter/foundation.dart';

class BookEntity {
  final int id;
  final int testamentId;
  final String bookName;
  final String bookUrl;
  final List<CharptersEntity> charpters;
  BookEntity({
    required this.id,
    required this.testamentId,
    required this.bookName,
    required this.bookUrl,
    required this.charpters,
  });

  BookEntity copyWith({
    int? id,
    int? testamentId,
    String? bookName,
    String? bookUrl,
    List<CharptersEntity>? charpters,
  }) {
    return BookEntity(
      id: id ?? this.id,
      testamentId: testamentId ?? this.testamentId,
      bookName: bookName ?? this.bookName,
      bookUrl: bookUrl ?? this.bookUrl,
      charpters: charpters ?? this.charpters,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'testamentId': testamentId,
      'bookName': bookName,
      'bookUrl': bookUrl,
      'charpters': charpters.map((x) => x.toMap()).toList(),
    };
  }

  factory BookEntity.fromMap(Map<String, dynamic> map) {
    return BookEntity(
      id: map['id']?.toInt() ?? 0,
      testamentId: map['testamentId']?.toInt() ?? 0,
      bookName: map['bookName'] ?? '',
      bookUrl: map['bookUrl'] ?? '',
      charpters: List<CharptersEntity>.from(map['charpters']?.map((x) => CharptersEntity.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookEntity.fromJson(String source) => BookEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookEntity(id: $id, testamentId: $testamentId, bookName: $bookName, bookUrl: $bookUrl, charpters: $charpters)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookEntity &&
        other.id == id &&
        other.testamentId == testamentId &&
        other.bookName == bookName &&
        other.bookUrl == bookUrl &&
        listEquals(other.charpters, charpters);
  }

  @override
  int get hashCode {
    return id.hashCode ^ testamentId.hashCode ^ bookName.hashCode ^ bookUrl.hashCode ^ charpters.hashCode;
  }
}
