import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/data/model/article_model.dart';
import 'package:newsapp/data/services/news_data.dart';
import 'package:newsapp/ui/utils/color_palette.dart';


class CategoryFragment extends StatefulWidget {
  final String category;
  const CategoryFragment({super.key, required this.category});

  @override
  State<CategoryFragment> createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {

  List<ArticleModel> articles = [];
  bool _loading = true;

  getNews() async {
    CategoryNews newsData = CategoryNews();
    await newsData.getNews(widget.category);
    articles = newsData.dataToBeSavedIn;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        leading: const BackButton(
          color: AppColors.primaryColor,
        ),
        title: Text(widget.category.toUpperCase(),
          style: const TextStyle(
              color: AppColors.primaryColor,
            fontSize: 20
          ),
        ),
      ),

      body: _loading ? const Center(
          child: CircularProgressIndicator()
      ): SingleChildScrollView(

        child: ListView.builder(
          itemCount:  articles.length,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {

            return NewsTemplate(
              urlToImage: articles[index].urlToImage,
              title: articles[index].title,
              description: articles[index].description,
              url: articles[index].url,
            );
          } ,
        ),
      ),
    );
  }
}

class NewsTemplate extends StatelessWidget {

  final String title, description, url, urlToImage;
  const NewsTemplate({super.key, required this.title, required this.description, required this.urlToImage, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(

        children: [

          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(imageUrl: urlToImage, width: 390, height: 200, fit: BoxFit.cover,),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),),
          const SizedBox(height: 8),
          Text(description, style: TextStyle( fontSize: 15, color: Colors.grey[800]),),
        ],
      ),
    );
  }
}