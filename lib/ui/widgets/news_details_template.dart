import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:newsapp/ui/utils/color_palette.dart';

class NewsDetailsTemplate extends StatelessWidget {

  final String? title, description, url, urlToImage, publishedAt, content;
  final int indx;
  const NewsDetailsTemplate({super.key, this.title, this.description, this.urlToImage, this.url, this.publishedAt, required this.indx, this.content});

  goToNewsLink()async{
    String link = url.toString();
    if(await canLaunchUrl(Uri.parse(link))){
      await launchUrl(Uri.parse(link));
    }
    else{
      throw "News Link Not Found";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(

        children: [

          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(imageUrl: urlToImage.toString(), width: 390, height: 200, fit: BoxFit.cover,)
          ),
          const SizedBox(height: 8),
          Text("Title : " +title.toString(), style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),),
          const SizedBox(height: 8),
          Text("Description : " + description.toString(), style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 15,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          Text("Content : " + content.toString(), style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 15,
            color: Colors.grey[800],
          ),
          ),
          const SizedBox(height: 2),

          Row(
            children: [
              Text("Published Date : " + publishedAt.toString().substring(0,10), style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.primaryColor,
              ),
              ),
              const Spacer(),
              TextButton(onPressed: goToNewsLink, child: const Text("News Link")),
            ],
          ),
        ],
      ),
    );
  }
}