import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsTemplate extends StatelessWidget {

  final String? title, description, url, urlToImage, publishedAt;
  const NewsTemplate({super.key, this.title, this.description, this.urlToImage, this.url, this.publishedAt});

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
          Text(title.toString(), style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),),
          const SizedBox(height: 8),
          Text("Description: " + description.toString(), maxLines: 2, style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 15,
              color: Colors.grey[800],
            overflow: TextOverflow.ellipsis

          ),
          ),
          const SizedBox(height: 2),

          Row(
            children: [
              const SizedBox(width: 10,),
              const Spacer(),
              TextButton(onPressed: (){}, child: const Text("Read More")),
            ],
          ),
        ],
      ),
    );
  }
}