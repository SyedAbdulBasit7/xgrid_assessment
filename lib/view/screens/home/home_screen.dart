import 'package:ecommerce_app/view/screens/home/home_widgets/product_list.dart';
import 'package:ecommerce_app/view/widgets/text_view.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_theme/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: TextView(
                      text: 'Shopping Cart',
                      style: AppTextStyle.bold20,
                    ),
                  ),
                  const Icon(Icons.upload),
                ],
              ),
            ),
          ),
          const ProductTile(),
        ],
      ),
    );
  }
}
