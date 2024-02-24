import 'package:ecommerce_app/utils/app_theme/app_text_style.dart';
import 'package:ecommerce_app/utils/extensions/context_extension.dart';
import 'package:ecommerce_app/utils/extensions/sized_box_extension.dart';
import 'package:ecommerce_app/view/screens/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../base_view_model/base_view_model.dart';
import '../../../../utils/app_constants/app_colors.dart';

import '../../../widgets/app_error/app_errors.dart';
import '../../../widgets/app_shimmers/shimmer_loader.dart';
import '../../../widgets/my_cached_network_image.dart';
import '../../../widgets/text_view.dart';

class MoreProducts extends StatelessWidget {
  const MoreProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, data, _) {
        if (data.state == NotifierState.loading) {
          return SizedBox(
            width: context.width,
            height: context.height,
            child: const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: CircularProgressIndicator(
                  color: AppColors.white,
                ),
              ),
            ),
          );
        }
        if (data.state == NotifierState.loading) {
          return SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 5,
              itemBuilder: (context, index) {
                return _productTile(context);
              },
            ),
          );
        }
        if (data.state == NotifierState.error) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: AppErrors(
                isCenter: false,
                error: data.error ?? 'Something went wrong',
                titleColor: AppColors.white,
                errorColor: AppColors.white,
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _productTile(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              MyCachedNetworkImage(
                height: 50,
                width: 50,
                imageUrl: 'svgIcon',
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
              TextView(
                text: 'Product Name',
                maxLine: 2,
                style: AppTextStyle.medium14,
              ),
              8.0.verticalSpace,
              TextView(
                text: 'Product Price',
                style: AppTextStyle.bold16,
              ),
              20.0.verticalSpace,
              TextView(
                text: 'Pick an option',
                style:
                    AppTextStyle.bold16.copyWith(color: AppColors.outlineBtn),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
          ),
          padding: EdgeInsets.all(4),
          child: TextView(
            text: '-75%',
            style: AppTextStyle.regular14.copyWith(color: AppColors.white),
          ),
        )
      ],
    );
  }
}
