import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tracker_app/constants/colors.dart';
import 'package:tracker_app/widgets/books_cards.dart';
import 'package:tracker_app/models/book.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = Uri.parse('https://freetestapi.com/api/v1/books');
  List<Book> result = [];
  Future callBooks() async {
    try {
      final response = await http.get(url);

      var jsonList = jsonDecode(response.body);
      result = (jsonList as List).map((e) => Book.fromJson(e)).toList();
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
            Expanded(child: BooksCardsWidget(books: result))
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
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
          colors: [AppColors.kPrimaryColor, AppColors.kPrimaryLight],
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
                  style: TextStyle(
                    fontSize: 20, // Metnin font büyüklüğü
                    fontWeight: FontWeight.w300,
                    color: Colors.white, // Metnin rengi
                    shadows: [
                      Shadow(
                        color: const Color.fromARGB(255, 28, 26, 26)
                            .withOpacity(1), // Gölge rengi ve opaklığı
                        offset:
                            const Offset(2, 2), // Gölgenin x ve y koordinatları
                        blurRadius: 2, // Gölgenin bulanıklık yarıçapı
                      ),
                    ],
                  ),
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
  const BooksCardsWidget({super.key, required this.books});
  final List<Book> books;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        bottom: 30,
        right: 20,
      ),
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 1,
          crossAxisSpacing: 4,
        ),
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          return BooksCards(book: books[index]);
        },
      ),
    );
  }
}
