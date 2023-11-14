import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tracker_app/constants/colors.dart';
import 'package:tracker_app/widgets/books_cards.dart';
import 'package:tracker_app/models/book.dart';
import 'package:tracker_app/services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BookService bookService = BookService();
  List<Book> result = [];

  Future<void> callBooks() async {
    try {
      result = await bookService.getBooks();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await callBooks();
            setState(() {});
          },
        ),
        body: Column(
          children: [
            const AppBar(),
            Expanded(
                child: BooksCardsWidget(
                    books: result,
                    onFavoriteChanged: (Book book, bool isFavorite) {
                      // Favori durumu değişikliğini burada işleyin
                      // Veri kaynağını (örneğin, veritabanını) güncellemek isteyebilirsiniz
                      setState(() {
                        // Kitabın listeye olan index'ini bulun
                        int index = result.indexWhere((b) => b.id == book.id);
                        if (index != -1) {
                          // isFavorite durumunu güncelleyin
                          result[index].isFavorite = isFavorite;
                        }
                      });
                    }))
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 120, left: 25, right: 20),
      height: AppConstants.kAppBarHeight,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 241, 74, 14), AppColors.kPrimaryLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Book Tracker",
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BooksCardsWidget extends StatelessWidget {
  const BooksCardsWidget(
      {super.key, required this.books, required this.onFavoriteChanged});
  final List<Book> books;
  final Function(Book book, bool isFavorite) onFavoriteChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 0, right: 20, top: 0),
      child: GridView.builder(
        padding: const EdgeInsets.all(30),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 1,
          crossAxisSpacing: 4,
        ),
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          return BooksCards(
            book: books[index],
            isFavorite: true,
            onFavoriteChanged: (isFavorite) {
              onFavoriteChanged(books[index], isFavorite);
            },
          );
        },
      ),
    );
  }
}
