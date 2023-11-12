import 'package:flutter/material.dart';
import 'package:tracker_app/constants/colors.dart';
import 'package:tracker_app/models/book.dart';

class BooksCards extends StatelessWidget {
  final Book book;
  const BooksCards({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    Widget imageNetwork() {
      return Image.network(
        'https://picsum.photos/id/${book.id}/200/300',
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Image.network(
          'https://picsum.photos/id/${0}/200/300',
          fit: BoxFit.cover,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 17.5, top: 17.5),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 255, 123, 0).withOpacity(.69),
                  blurRadius: 10.0,
                  offset: Offset(5, 5))
            ],
          ),
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Expanded(child: imageNetwork()),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(),
                child: ListTile(
                  title: Text(
                    book.title ?? '',
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          backgroundColor: AppColors.kPrimaryColor,
                        ),
                        "Author: ${book.author ?? ''}",
                      ),
                      Text(
                        "Genre: ${book.genre ?? ''}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          backgroundColor: AppColors.kPrimaryColor,
                        ),
                      ),
                      Text(
                        "Publication Year: ${book.publicationYear ?? ''}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          backgroundColor: AppColors.kPrimaryColor,
                        ),
                      ),
                      Text(
                        "Description: ${book.description ?? ''}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          backgroundColor: AppColors.kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
