import 'package:flutter/material.dart';

class InitialSearchViewBody extends StatelessWidget {
  const InitialSearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('Type something to search'),
        ],
      ),
    );
  }
}