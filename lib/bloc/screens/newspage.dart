import 'package:flutter/material.dart';
import 'package:news_app/models/newsresponse.dart';

import '../../models/apimanager.dart';

class NewsPage extends StatelessWidget {
  final manager = ApiManager();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>?>(
      builder: (context, AsyncSnapshot<List<Article>?> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                child: Card(
                  surfaceTintColor: Colors.deepPurple,
                  shadowColor: Colors.black87,
                  elevation: 5,
                  child: ListTile(
                    title: Text(
                      snapshot.data![index].title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      snapshot.data![index].description,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    leading: Image.network(
                      snapshot.data![index].urlToImage,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    isThreeLine: true,
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: manager.fetchNews(),
    );
  }
}
