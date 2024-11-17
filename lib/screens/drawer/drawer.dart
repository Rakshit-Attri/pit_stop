import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../providers/UserAuth.dart';
import '../../main.dart';
import '../../utils/colors.dart';
import '../../utils/essentials.dart';
import '../../utils/helper_functions.dart';
import '../../utils/image_constants.dart';
import 'package:provider/provider.dart';

import '../../widgets/cached_image.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late UserAuth userAuth;
  @override
  void initState() {
    userAuth =
        Provider.of<UserAuth>(navigatorKey.currentContext!, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 10,
      width: E.width(context) - 58,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 38, 16, 0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Primary.brown,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedImage(imageUrl: E.getRandomImage()),
                    ),
                  ),
                  E.widthSpacer(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      E.heightSpacer(6),
                      E.myText(
                        '(406) 555-0120',
                        context: context,
                        fontSize: 14,
                        color: Primary.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ...HelperFunctions.getSpacedChildren(items: [
                    drawerItem(
                      context,
                      icon: ImageConstant.google,
                      text: 'Logout',
                      onTap: () async {
                        userAuth.logout();
                      },
                    ),
                  ], space: 8, column: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerItem(BuildContext context,
      {required String icon, required String text, VoidCallback? onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: Primary.black,
            ),
            E.widthSpacer(16),
            E.myText(E.capitalizeEachWord(text), context: context),
          ],
        ),
      ),
    );
  }
}
