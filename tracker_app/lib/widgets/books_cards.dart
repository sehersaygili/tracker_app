import 'package:flutter/material.dart';
import 'package:tracker_app/constants/colors.dart';
import 'package:tracker_app/models/book.dart';
import 'package:tracker_app/constants/text_styles.dart';

class BooksCards extends StatelessWidget {
  final Book book;
  final bool isFavorite;
  final Function(bool isFavorite) onFavoriteChanged;

  const BooksCards(
      {super.key,
      required this.book,
      required this.isFavorite,
      required this.onFavoriteChanged});

  @override
  Widget build(BuildContext context) {
    Widget imageNetwork() {
      return Opacity(
        opacity: 0.3, // Şeffaflık seviyesi (0.0 - 1.0 arasında)
        child: Image.network(
          'https://picsum.photos/id/${book.id}/200/300',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Image.network(
            'https://picsum.photos/id/${0}/200/300',
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15.5,
        top: 65.5,
      ),
      child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.only(),
          decoration: const BoxDecoration(
            color: AppColors.kShadowColor,
            gradient: LinearGradient(
              colors: [AppColors.kBoxColor, AppColors.kBoxColor2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 31, 8, 8),
                  blurRadius: 10.0,
                  offset: Offset(10, 10))
            ],
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded(
                      child: imageNetwork(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 90, bottom: 150),
                        child: IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red,
                            size: 25,
                          ),
                          onPressed: () {
                            onFavoriteChanged(!isFavorite);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Column(
                          children: [
                            StyledTextAppBar(text: book.title ?? ''),
                            StyledTextAppBar(text: book.author ?? ''),
                            StyledTextAppBar(text: "${book.genre ?? ''}"),
                            StyledTextCard(
                                text: "${book.publicationYear ?? ''}"),
                            StyledTextCard(text: book.description ?? ''),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
