import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Book {
  int? id;
  String? title;
  String? author;
  dynamic publicationYear;
  List<String>? genre;
  String? description;
  String? coverImage;
  bool? isFavorite;

  Book({
    this.id,
    this.title,
    this.author,
    this.publicationYear,
    this.genre,
    this.description,
    this.coverImage,
    this.isFavorite = false,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}

class BookDataSource {
  static List<Book> books = [
    Book(id: 1, title: 'Kitap 1', author: 'Yazar 1'),
    Book(id: 2, title: 'Kitap 2', author: 'Yazar 2'),
  ];

  static Book getBookById(int bookId) {
    return books.firstWhere((book) => book.id == bookId);
  }
}
