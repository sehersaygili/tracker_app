import 'package:flutter/material.dart';
import 'package:tracker_app/constants/colors.dart';
import 'package:tracker_app/models/book.dart';
import 'package:tracker_app/constants/text_styles.dart';
import 'package:tracker_app/view/detail_page.dart';

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
      return GestureDetector(
        onTap: () {
          // Navigate to the detail page when the image is tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(book: book),
            ),
          );
        },
        child: Opacity(
          opacity: 0.9, //0.3,
          child: Image.network(
            'https://picsum.photos/id/${book.id}/200/300',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Image.network(
              'https://picsum.photos/id/${0}/200/300',
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20.5,
        top: 10.5,
      ),
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
          fit: StackFit.passthrough,
          children: [
            imageNetwork(),
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                  size: 30,
                ),
                onPressed: () {
                  onFavoriteChanged(!isFavorite);
                },
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Card(
                color: Colors.grey.shade200.withOpacity(0.5),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.sizeOf(context).width * 0.25,
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    children: [
                      StyledTextAppBar(
                        text: book.title ?? '',
                        flexible: true,
                      ),
                      StyledTextAppBar(
                        text: book.author ?? '',
                        flexible: true,
                      ),
                      StyledTextAppBar(
                        text: "${book.genre ?? ''}",
                        flexible: true,
                      ),
                      StyledTextCard(
                        text: "${book.publicationYear ?? ''}",
                        flexible: true,
                      ),
                      StyledTextCard(
                        text: book.description ?? '',
                        flexible: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
