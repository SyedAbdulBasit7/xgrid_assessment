import 'package:ecommerce_app/utils/extensions/context_extension.dart';
import 'package:ecommerce_app/utils/extensions/sized_box_extension.dart';
import 'package:ecommerce_app/view/screens/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../../base_view_model/base_view_model.dart';
import '../../../../utils/app_constants/app_colors.dart';

import '../../../widgets/app_error/app_errors.dart';
import '../../../widgets/app_shimmers/shimmer_loader.dart';
import '../../../widgets/my_cached_network_image.dart';
import '../../../widgets/text_view.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key});

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
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _productTile(context);
                },
                childCount: 3,
              ),
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
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: MyCachedNetworkImage(
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
        ),
        Expanded(
          child: Column(
            children: [
              const Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        TextView(text: 'Title'),
                        TextView(text: 'Description'),
                        TextView(text: 'Description'),
                      ],
                    ),
                  ),
                  Icon(Icons.delete),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      const TextView(text: 'Price off'),
                      8.0.verticalSpace,
                      const TextView(text: 'Price'),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border:
                          Border.all(width: 0.5, color: AppColors.borderGray),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      children: [
                        const Icon(Icons.cancel),
                        5.0.horizontalSpace,
                        const TextView(text: '1'),
                        5.0.horizontalSpace,
                        const Icon(Icons.add),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
