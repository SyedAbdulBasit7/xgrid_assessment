import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_constants/app_colors.dart';
import '../../screens/notification/notification_list_view_model.dart';
import '../svg_custom_icon.dart';
import '../text_view.dart';

class AppBars {
  // static PreferredSizeWidget simpleAppBar() {
  //   return AppBar(
  //     // surfaceTintColor: AppColors.transparent,
  //     automaticallyImplyLeading: false,
  //     title: Row(
  //       children: [
  //         const Image(
  //             image: AssetImage(AppImages.groceryLogo), width: 32, height: 32),
  //         6.0.horizontalSpace,
  //         const SvgCustomIcon(svgIcon: AppImages.appLogo, iconSize: 24),
  //       ],
  //     ),
  //   );
  // }
  //
  // static PreferredSizeWidget backAppBar(BuildContext context,
  //     {void Function()? onPressed}) {
  //   return AppBar(
  //     leading: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: AppFloatingActionBtn(
  //         onPressed: onPressed ?? () => Navigator.pop(context),
  //         borderRadius: 12,
  //         elevation: 0,
  //         buttonColor: AppColors.primaryLight,
  //         child: const Icon(
  //           Icons.arrow_back_ios_new,
  //           size: 18,
  //           color: AppColors.primaryDark,
  //         ),
  //       ),
  //     ),
  //     backgroundColor: AppColors.white,
  //     title: Transform.translate(
  //       offset: const Offset(-8, 0),
  //       child: Row(
  //         children: [
  //           const Image(
  //               image: AssetImage(AppImages.groceryLogo),
  //               width: 32,
  //               height: 32),
  //           6.0.horizontalSpace,
  //           const SvgCustomIcon(svgIcon: AppImages.appLogo, iconSize: 24),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  static PreferredSizeWidget homeAppBar(
    BuildContext context, {
    void Function()? onNotification,
    void Function()? onLanguage,
    void Function()? onHamburger,
  }) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const SvgCustomIcon(svgIcon: AppImages.logo, iconSize: 30),
      actions: [
        Consumer<NotificationViewModel>(builder: (context, data, _) {
          return BadgeIcon(
            counter: '${data.notificationCount}',
            isShow: data.notificationCount > 0,
            icon: IconButton(
              onPressed: onNotification,
              icon: const SvgCustomIcon(
                svgIcon: AppImages.notification,
              ),
            ),
          );
        }),
        Consumer<AppLangConfig>(builder: (context, lang, _) {
          return PopupMenuButton<String>(
            constraints: const BoxConstraints(
              maxWidth: 100,
            ),
            position: PopupMenuPosition.under,
            surfaceTintColor: AppColors.white,
            onSelected: (value) async {
              await lang.setLocalLang(value);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                height: 30,
                value: 'en',
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: TextView(
                    text: 'English',
                    style: lang.localLang == 'en'
                        ? AppTextStyle.bold14
                        : AppTextStyle.medium14,
                  ),
                ),
              ),
              PopupMenuItem<String>(
                height: 30,
                value: 'fr',
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(
                    'French',
                    style: lang.localLang == 'fr'
                        ? AppTextStyle.bold14
                        : AppTextStyle.medium14,
                  ),
                ),
              ),
            ],
            child: IconButton(
              onPressed: onLanguage,
              icon: const SvgCustomIcon(
                svgIcon: AppImages.language,
              ),
            ),
          );
        }),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            onPressed: onHamburger,
            icon: const SvgCustomIcon(
              svgIcon: AppImages.hamburger,
            ),
          ),
        ),
      ],
    );
  }
}
