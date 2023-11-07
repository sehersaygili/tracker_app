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

  Book({
    this.id,
    this.title,
    this.author,
    this.publicationYear,
    this.genre,
    this.description,
    this.coverImage,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}
