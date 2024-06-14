import 'package:flutter/material.dart';

import '../providers/main_provider.dart';

class CategoriesPage extends StatelessWidget {
  final MainProvider provider;
  const CategoriesPage({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
        child: Text(provider.allCategories),
      ),
    );
  }
}
