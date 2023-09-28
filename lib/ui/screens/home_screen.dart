import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsapp/data/model/article_model.dart';
import 'package:newsapp/data/services/news_data.dart';
import 'package:newsapp/ui/utils/color_palette.dart';
import 'package:newsapp/ui/utils/image_paths.dart';
import 'package:newsapp/ui/widgets/news_template.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        title: SvgPicture.asset(ImagePaths.newsAppLogoSVG, width:  150,),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 2,
      ),
      body: _loading ? const Center(child: CircularProgressIndicator(),
      ): Container(
        color: Colors.white,
        child: RefreshIndicator(
          onRefresh: () async{
            getNews();
            _loading = true;
            setState(() {});
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text("Top News", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.primaryColor),),
                      Spacer(),
                      SizedBox(width: 10,)
                    ],
                  ),
                ),

                ListView.builder(
                  itemCount:  articles.length,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {

                    return NewsTemplate(
                      urlToImage: articles[index].urlToImage,
                      title: articles[index].title,
                      description: articles[index].description,
                      url: articles[index].url,
                      publishedAt: articles[index].publishedAt,
                      indx: index,
                    );
                  } ,
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}




