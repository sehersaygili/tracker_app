import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app/models/favorite_book.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Page',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: _FavoritePageList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _FavoritePageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headlineMedium;
    var favoritepage = context.watch<FavoritePageModel>();

    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) => ListTile(
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {},
        ),
      ),
    );
  }
}
