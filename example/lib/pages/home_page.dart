import 'package:example/providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/loader_widget.dart';
import '../widgets/option_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: true);
    return homeProvider.isLoading
        ? const LoaderWidget()
        : Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OptionCardWidget(
                  title: 'Categories',
                  icon: Icons.category,
                  onTap: () => homeProvider.getAllCategories(context: context),
                ),
                const SizedBox(
                  height: 12,
                ),
                OptionCardWidget(
                  title: 'Products',
                  icon: Icons.inventory_2,
                  onTap: () => homeProvider.getAllProducts(context: context),
                ),
              ],
            ),
          );
  }
}
