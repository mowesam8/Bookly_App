import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(FontAwesomeIcons.solidStar, color: Color(0xffffdd4f), size: 16),
        const SizedBox(width: 6),
        Text("4.8", style: Styles.textStyle16),
        const SizedBox(width: 5),
        Opacity(opacity: 0.5, child: Text("(245)", style: Styles.textStyle14)),
      ],
    );
  }
}
