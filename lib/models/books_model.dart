

import 'dart:convert';

class BooksModel {
  final List<Book>? books;

  BooksModel({
    this.books,
  });

  BooksModel copyWith({
    List<Book>? book,
  }) =>
      BooksModel(
        books: book ?? books,
      );

  factory BooksModel.fromJson(String str) => BooksModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BooksModel.fromMap(Map<String, dynamic> json) => BooksModel(
    books: json["book"] == null ? [] : List<Book>.from(json["book"]!.map((x) => Book.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "book": books == null ? [] : List<dynamic>.from(books!.map((x) => x.toMap())),
  };
}

class Book {
  final int? bookId;
  final String? bookName;
  final String? writerName;
  final String? fileUrl;

  Book({
    this.bookId,
    this.bookName,
    this.writerName,
    this.fileUrl,
  });

  Book copyWith({
    int? bookId,
    String? bookName,
    String? writerName,
    String? fileUrl,
  }) =>
      Book(
        bookId: bookId ?? this.bookId,
        bookName: bookName ?? this.bookName,
        writerName: writerName ?? this.writerName,
        fileUrl: fileUrl ?? this.fileUrl,
      );

  factory Book.fromJson(String str) => Book.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Book.fromMap(Map<String, dynamic> json) => Book(
    bookId: json["book_id"],
    bookName: json["book_name"],
    writerName: json["writer_name"],
    fileUrl: json["file_url"],
  );

  Map<String, dynamic> toMap() => {
    "book_id": bookId,
    "book_name": bookName,
    "writer_name": writerName,
    "file_url": fileUrl,
  };
}
