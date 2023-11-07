import 'package:flutter/material.dart';
import 'package:tracker_app/models/book.dart';

class BooksCards extends StatelessWidget {
  final Book book;
  const BooksCards({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)),
          color: Colors.white,
          image: DecorationImage(
              image: NetworkImage(book.coverImage ?? ''), fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 10.0,
              spreadRadius: 10,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(book.title ?? ""),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Author: ${book.author ?? ''}"),
                Text("Genre: ${book.genre ?? ''}"),
                Text(
                  "Publication Year: ${book.publicationYear.toString() ?? ''}",
                ),
                Text("Description: ${book.description ?? ''}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
