

import 'package:bookly_app/core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class CustomListViewCard extends StatelessWidget {
  const CustomListViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.28 ,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AssetsData.book1),
            ),
          ),
        ),
      ),
    );
  }
}
