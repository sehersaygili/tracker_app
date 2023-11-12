import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tracker_app/models/book.dart';

class BookService {
  final Uri url = Uri.parse('https://freetestapi.com/api/v1/books');

  Future<List<Book>> getBooks() async {
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonList = jsonDecode(response.body);
        return (jsonList as List).map((e) => Book.fromJson(e)).toList();
      } else {
        // Handle error cases
        throw Exception('Failed to load books');
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception('Failed to load books: $e');
    }
  }
}
