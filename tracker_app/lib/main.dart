import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app/constants/themes.dart';
import 'package:tracker_app/models/book.dart';
import 'package:tracker_app/models/favorite_book.dart';

import 'package:tracker_app/view/detail_page.dart';
import 'package:tracker_app/view/home_page.dart';

void main() {
  runApp(const MyApp());
  //uygulama başlangıcında MyApp çağırılır.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //birçok veri modelini saklamak için kullanılır.
      providers: [
        Provider(create: (context) => Book()), //Book modeline erişim sağlar.
        ChangeNotifierProxyProvider<Book, FavoritePageModel>(
          //ChangeNotifierProxyprovider birinci sağlayıcıdan değeri dinleyi bu değeri kullanıp diğer modeli günceller
          create: (context) =>
              FavoritePageModel(), //modelin bir örneği oluşturulur
          update: (context, book, favoritepage) {
            //favoritelist -> Book modelinin örneği, favoritepage -> FavoritePageModel örneği
            if (favoritepage == null) {
              throw ArgumentError.notNull('favoritePage');
            }
            return favoritepage; //yeni bir değer döndürülmeli
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Book Tracker',
        theme: AppThemes.getAppTheme(), //temayı ayrı sayfadan çağırdım
        initialRoute: '/home',
        routes: {
          '/': (context) => const HomePage(), //Ana sayfa için rota
          '/favorite-page': (context) =>
              const FavoritePage(), //favori sayfası için rota
        },
      ),
    );
  }
}
