import 'dart:convert';

import 'package:bible_avm_mobile/modules/books/book_entity.dart';
import 'package:flutter/foundation.dart';

class TestamentEntity {
  final int id;

  final String testamentName;
  final List<BookEntity> books;
  TestamentEntity({
    required this.id,
    required this.testamentName,
    required this.books,
  });

  TestamentEntity copyWith({
    int? id,
    String? testamentName,
    List<BookEntity>? books,
  }) {
    return TestamentEntity(
      id: id ?? this.id,
      testamentName: testamentName ?? this.testamentName,
      books: books ?? this.books,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'testamentName': testamentName,
      'books': books.map((x) => x.toMap()).toList(),
    };
  }

  factory TestamentEntity.fromMap(Map<String, dynamic> map) {
    return TestamentEntity(
      id: map['id']?.toInt() ?? 0,
      testamentName: map['testamentName'] ?? '',
      books: List<BookEntity>.from(map['books']?.map((x) => BookEntity.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TestamentEntity.fromJson(String source) => TestamentEntity.fromMap(json.decode(source));

  @override
  String toString() => 'TestamentEntity(id: $id, testamentName: $testamentName, books: $books)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TestamentEntity &&
        other.id == id &&
        other.testamentName == testamentName &&
        listEquals(other.books, books);
  }

  @override
  int get hashCode => id.hashCode ^ testamentName.hashCode ^ books.hashCode;
}
