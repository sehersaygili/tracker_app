// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      id: json['id'] as int?,
      title: json['title'] as String?,
      author: json['author'] as String?,
      publicationYear: json['publication_year'],
      genre:
          (json['genre'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
      coverImage: json['cover_image'] as String?,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'publication_year': instance.publicationYear,
      'genre': instance.genre,
      'description': instance.description,
      'cover_image': instance.coverImage,
    };
