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
      backgroundColor: Colors.orange,
      elevation: 10,
      width: E.width(context)*0.5,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 38, 16, 0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  E.heightSpacer(6),
                  E.myText(
                    userAuth.userData?.email,
                    context: context,
                    fontSize: 14,
                    color: Primary.white,
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
                      icon: Icons.logout,
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
      {required IconData icon, required String text, VoidCallback? onTap}) {
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
            Icon(
              icon,
              color: Primary.black,
              size: 24, // Adjust size if needed
            ),
            E.widthSpacer(16),
            E.myText(E.capitalizeEachWord(text), context: context),
          ],
        ),
      ),
    );
  }

}
