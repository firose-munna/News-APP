import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsapp/data/model/article_model.dart';
import 'package:newsapp/data/services/news_data.dart';
import 'package:newsapp/ui/utils/color_palette.dart';
import 'package:newsapp/ui/utils/image_paths.dart';
import 'package:newsapp/ui/widgets/news_details_template.dart';


class NewsDetailsScreen extends StatefulWidget {
  final int indx;
  const NewsDetailsScreen({super.key, required this.indx});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {

  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    News newsData = News();
    await newsData.getNews();
    articles = newsData.dataToBeSavedIn;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(ImagePaths.newsAppLogoSVG, width: 150,),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 2,
        leading: const BackButton(
          color: AppColors.primaryColor,
        ),


      ),
      body: _loading ? const Center(child: CircularProgressIndicator(),
      ): NewsDetailsTemplate(
        urlToImage: articles[widget.indx].urlToImage,
        title: articles[widget.indx].title,
        description: articles[widget.indx].description,
        url: articles[widget.indx].url,
        publishedAt: articles[widget.indx].publishedAt,
        indx: widget.indx,
        content: articles[widget.indx].content,
      ),
    );
  }
}
