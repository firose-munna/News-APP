import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/ui/screens/category_screen.dart';

class CategoryTile extends StatelessWidget {
  final String categoryName, imageUrl;
  const CategoryTile({super.key, required this.categoryName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        Navigator.push(context, MaterialPageRoute(
          builder: (context) => CategoryFragment(
            category: categoryName.toLowerCase(),
          ),
        ));

      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(imageUrl: imageUrl.toString(), width: 160, height: 55, fit: BoxFit.cover,),
            ),


            Container(
              alignment: Alignment.center,
              width: 160, height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black45,


              ),
              child: Text(categoryName.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),),
            ),

          ],
        ),
      ),
    );
  }
}