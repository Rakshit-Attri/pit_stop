import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import 'colors.dart';
import 'image_constants.dart';

class E {
  static Text myText(
    data, {
    required context,
    decoration,
    Key? key,
    color,
    double? fontSize = 14,
    fontWeight,
    double? height,
    TextAlign? textAlign,
    FontStyle? fontStyle,
    TextDirection? textDirection,
    int? maxLines,
    bool isHeader = false,
  }) {
    final fontFamily = isHeader ? 'sansation' : 'poppins';
    // bool IsDark = IsDarkTheme(context);

    return Text(
      data,
      key: key,
      //textScaleFactor: 1,
      textAlign: textAlign,
      style: TextStyle(
          fontStyle: fontStyle,
          color: color,
          fontSize: fontSize,
          //  overflow: TextOverflow.ellipsis,
          fontWeight: fontWeight,
          height: height,
          fontFamily: fontFamily,
          decoration: decoration),
      // overflow: overflow,
      maxLines: maxLines,
    );
  }

  static myLoader({color, double size = 30, bool straight = true}) {
    return Center(
      child: straight
          ? SpinKitThreeBounce(
              color: color ?? Primary.darkGrey,
              size: size,
            )
          : SpinKitChasingDots(
              color: color ?? Primary.darkGrey,
              size: size,
            ),
    );
  }

  static String capitalize(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }

  static String capitalizeEachWord(String input) {
    if (input.isEmpty) {
      return input;
    }

    // Split the input string into words
    List<String> words = input.split(' ');

    // Capitalize each word
    List<String> capitalizedWords = words.map((word) {
      return capitalize(word);
    }).toList();

    // Join the capitalized words back into a single string
    return capitalizedWords.join(' ');
  }

  static List randomImages = [
    'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
    'https://i0.wp.com/thatrandomagency.com/wp-content/uploads/2021/06/headshot.png?resize=618%2C617&ssl=1',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaOjCZSoaBhZyODYeQMDCOTICHfz_tia5ay8I_k3k&s',
    'https://as1.ftcdn.net/v2/jpg/02/99/04/20/1000_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg',
    'https://as2.ftcdn.net/v2/jpg/01/51/99/39/1000_F_151993994_mmAYzngmSbNRr6Fxma67Od3WHrSkfG5I.jpg',
    'https://images.pexels.com/photos/15180324/pexels-photo-15180324/free-photo-of-low-angle-photography-of-man-wearing-black-bandana.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
  ];
  static String getRandomImage() {
    final random = Random();
    return randomImages[random.nextInt(randomImages.length)];
  }

  static Widget getShimmerBox(double height, {double? width}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Container(
        height: height,
        width: width ?? double.infinity,
        decoration: const BoxDecoration(
          // borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
      ),
    );
  }

  static AppBar myAppBar(
    BuildContext context,
    String title, {
    List<Widget>? actions,
    centerTitle = true,
    double fontSize = 18,
    double elevation = 0,
    Widget? leading,
    Widget? titleWidget,
    Color? iconColor,
    Color? titleColor,
    Color? backgroundColor,
    VoidCallback? editOnTap,
    bool showEditButton = false,
    bool showBackButton = true,
    VoidCallback? onBackButtonTap,
  }) {
    // Widget logoImage = SizedBox(
    //   height: 25,
    //   width: 25,
    //   child: Image.asset(
    //     'assets/logo.png',
    //     fit: BoxFit.cover,
    //   ),
    // );
    Widget titleText = titleWidget ??
        myText(title,
            context: context,
            fontSize: fontSize,
            isHeader: true,
            color: titleColor ?? Primary.black);

    List<Widget> appBarActions = [];

    if (showEditButton) {
      appBarActions.add(
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: InkWell(
            onTap: editOnTap,
            child: SvgPicture.asset(
              ImageConstant.logo,
              height: 16,
              width: 16,
              color: Primary.black,
            ),
          ),
        ),
      );
    }
    if (actions != null) {
      appBarActions.addAll(actions);
    }
    return AppBar(
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,

      automaticallyImplyLeading: false,
      leading: showBackButton
          ? InkWell(
              onTap: onBackButtonTap ??
                  () {
                    // print('asfasf');
                    Navigator.pop(context);
                  },
              child: Container(
                // padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.only(
                    // left: 16,
                    ),
                // child: SvgPicture.asset(
                //   ImageConstant.logo,
                //   // fit: BoxFit.scaleDown,
                //   color: iconColor ?? Primary.black,
                // ),
                child: Icon(
                  Icons.chevron_left,
                  color: iconColor ?? Primary.black,
                ),
              ))
          : leading,
      // iconTheme: IconThemeData(
      //   color: iconColor ?? Primary.white,
      // ),
      titleSpacing: 0,
      // bottom: PreferredSize(
      //   preferredSize: const Size.fromHeight(4.0),
      //   child: Divider(
      //     // color: Primary.brown,
      //     thickness: 1.0,
      //   ),
      // ),
      elevation: elevation,
      title: titleText,
      centerTitle: centerTitle,
      // actions: actions,
      actions: appBarActions,
      // title: title=="Home"?Row(
      //   children: [
      //     logoImage,
      //     widthSpacer(10),
      //     titleText,
      //   ],
      // ):titleText,
    );
  }

  static Widget purpleButton({
    VoidCallback? onTap,
    required String text,
    Color? color,
    double fontSize = 16,
    dynamic fontWeight = FontWeight.w300,
    required BuildContext context,
    double circularRadius = 8,
    bool isLoading = false,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double height = 60,
    double width = double.maxFinite,
    bool disable = false,
  }) {
    return InkWell(
      onTap: isLoading || disable ? null : onTap,
      child: Opacity(
        opacity: isLoading || disable ? 0.5 : 1,
        child: Container(
          margin: margin,
          padding: padding,
          decoration: BoxDecoration(
              color: color ?? Primary.darkPurple,
              borderRadius: BorderRadius.circular(circularRadius)),
          height: height,
          width: width,
          child: Center(
            child: isLoading
                ? myLoader(
                    straight: true,
                    color: Primary.black,
                  )
                : myText(text,
                    color: Colors.white,
                    context: context,
                    fontWeight: fontWeight,
                    fontSize: fontSize),
          ),
        ),
      ),
    );
  }

  static Widget myTextFormField(
      {required context,
      required TextEditingController controller,
      label,
      suffixIcon,
      prefixIcon,
      double circleRadius = 12,
      int maxLines = 1,
      margin = true,
      obscureText = false,
      readOnly = false,
      bool isHeader = false,
      VoidCallback? onTap,
      bool onlyNumbers = false,
      Function(dynamic)? onChanged,
      String? hintText,
      int? maxLength,
      String? initialValue}) {
    final fontFamily = isHeader ? 'sansation' : 'poppins';

    return Container(
      margin: EdgeInsets.zero,
      child: TextFormField(
        readOnly: readOnly,
        onTap: onTap,
        onChanged: onChanged,
        maxLines: maxLines,
        obscureText: obscureText,
        initialValue: initialValue,
        keyboardType: onlyNumbers ? TextInputType.number : null,
        controller: controller,
        inputFormatters: [
          if (maxLength != null) LengthLimitingTextInputFormatter(maxLength),
          if (onlyNumbers) FilteringTextInputFormatter.digitsOnly,
        ],
        cursorColor: Primary.darkWine,
        style: TextStyle(color: Primary.black, fontSize: 14),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          prefixIcon: (prefixIcon != null)
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: prefixIcon,
                )
              : null,
          labelText: label,
          labelStyle: TextStyle(
            color: Primary.white,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 26,
            minHeight: 26,
          ),
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: TextStyle(
              color: Primary.black, fontFamily: fontFamily, fontSize: 12),
          suffixIcon: suffixIcon,
          suffixIconConstraints: const BoxConstraints(
            maxWidth: 26,
            maxHeight: 26,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Primary.lightGrey),
            borderRadius: BorderRadius.circular(circleRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Primary.darkWine),
            borderRadius: BorderRadius.circular(circleRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Primary.lightGrey),
            borderRadius: BorderRadius.circular(circleRadius),
          ),
        ),
      ),
    );
  }

  static looseFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static SizedBox heightSpacer(double height) {
    return SizedBox(
      height: height,
    );
  }

  static SizedBox widthSpacer(double width) {
    return SizedBox(
      width: width,
    );
  }

  static Widget circleIcon(iconPath,
      {bool isImage = false, VoidCallback? onTap, Color? backgroundColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: Container(
          height: 48,
          width: 48,
          margin: const EdgeInsets.all(0),
          decoration: BoxDecoration(
              color: backgroundColor ?? Colors.transparent,
              border: Border.all(color: Primary.black),
              shape: BoxShape.circle),
          child: Center(
            child: isImage
                ? Image.asset(iconPath)
                : SvgPicture.asset(
                    iconPath,
                  ),
          ),
        ),
      ),
    );
  }

  static showCustomBottomSheet(
      {required BuildContext context, required Widget child}) {
    showModalBottomSheet(
        enableDrag: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        backgroundColor: Primary.black,
        isScrollControlled: true,
        isDismissible: true,
        context: context,
        builder: (context) {
          return child;
        });
  }

  static Widget rowClick(BuildContext context,
      {String? iconPath,
      required String text,
      VoidCallback? onTap,
      bool showDivider = false}) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              if (iconPath != null)
                SvgPicture.asset(
                  iconPath,
                  height: 16,
                  width: 16,
                ),
              E.widthSpacer(8),
              SizedBox(
                child: myText(
                    context: context,
                    capitalizeEachWord(text ?? ''),
                    fontSize: 13),
              )
            ],
          ),
        ),
        if (showDivider)
          Divider(
            color: Primary.lightWhite,
          )
      ],
    );
  }
}
