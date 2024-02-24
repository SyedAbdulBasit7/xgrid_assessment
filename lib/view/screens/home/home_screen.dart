import 'package:ecommerce_app/utils/extensions/context_extension.dart';
import 'package:ecommerce_app/view/screens/home/view_model/home_view_model.dart';
import 'package:ecommerce_app/view/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../base_view_model/base_view_model.dart';
import '../../../utils/app_constants/app_colors.dart';
import '../../../utils/app_theme/app_text_style.dart';
import '../../widgets/app_bars/app_bars.dart';
import '../../widgets/app_error/app_errors.dart';
import '../../widgets/app_shimmers/shimmer_loader.dart';
import '../../widgets/my_cached_network_image.dart';
import 'home_widgets/choose_your_operator.dart';
import 'home_widgets/packages_slider.dart';
import 'home_widgets/recent_packages.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  const HomeScreen({Key? key}) : super(key: key);

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
                  )),
                  const Icon(Icons.upload),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _servicesComponents({
    required String svgIcon,
    required String text,
    required int categoryId,
  }) {
    return GestureDetector(
      onTap: () => navigateToScreen(context, categoryId),
      child: Column(
        children: [
          MyCachedNetworkImage(
            height: 45,
            width: 45,
            imageUrl: svgIcon,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider),
              ),
            ),
            placeholder: const ShimmerLoader(
              height: 45,
              width: 45,
              radius: 10,
            ),
            errorWidget: const Icon(Icons.error),
          ),
          10.0.verticalSpace,
          Align(
            alignment: Alignment.topCenter,
            child: TextView(
              text: text,
              style: AppTextStyle.semiBold13.copyWith(color: AppColors.white),
              maxLine: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
