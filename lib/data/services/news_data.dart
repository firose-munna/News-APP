import 'dart:convert';
import 'package:http/http.dart';
import 'package:newsapp/data/model/article_model.dart';

class News {

  List<ArticleModel> dataToBeSavedIn = [];

  final String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=5a70dc7ec4d24a9c8a371b175450f5d5";

  Future<void> getNews() async {
    var response = await get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage']!=null && element['description']!=null) {
          ArticleModel articleModel = ArticleModel(
            //author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            publishedAt: element['publishedAt'],
           // content: element['content']
          );
          dataToBeSavedIn.add(articleModel);
        }
      });
    }
  }
}


class CategoryNews{

  List<ArticleModel> dataToBeSavedIn = [];

  Future<void> getNews(String category) async {
    var response = await get(Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=5a70dc7ec4d24a9c8a371b175450f5d5"));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage']!=null && element['description']!=null) {
          ArticleModel articleModel = ArticleModel(
              //author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt'],
             // content: element['content']
          );
          dataToBeSavedIn.add(articleModel);
        }
      });
    }

  }

}