import 'package:connect_fake_store/models/category_model.dart';
import 'package:example/widgets/chip_widget.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final List<CategoryModel> categories;
  const CategoriesPage({Key? key, required this.categories}) : super(key: key);

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
        child: ListView.separated(
          itemCount: categories.length,
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemBuilder: (context, index) {
            final CategoryModel category = categories[index];
            return ChipWidget(title: category.name);
          },
        ),
      ),
    );
  }
}
