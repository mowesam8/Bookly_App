import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.rating, required this.count});
  final int rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(FontAwesomeIcons.solidStar, color: Color(0xffffdd4f), size: 16),
        const SizedBox(width: 6),
        Text(
          "${rating % 6}",
          style: Styles.textStyle16,
        ), // Note: Google Books API doesn't provide user ratings or ratings count anymore
        const SizedBox(width: 5),
        Opacity(
          opacity: 0.5,
          child: Text(
            "(${count % 10000})",
            style: Styles.textStyle14,
          ), // Note: Google Books API doesn't provide user ratings or ratings count anymore
        ),
      ],
    );
  }
}
