import 'package:flutter/material.dart';

class Primary {
  static Color get darkBlack => const Color(0xff20242E);

  static Color get brown => const Color(0xff272A32);

  static Color get darkGrayPopUp => const Color(0xff282D35);

  static Color get lightWine => const Color(0XffC038CC);

  static Color get darkWine => const Color(0Xff972DA0);

  static Color get darkDBrown => const Color(0Xff939191);

  // static Color get darkGray => const Color(0XffE3E3E3);

  // static Color get lightGray => const Color(0XffF8F8F8);

  static Color get newHighlight => const Color(0XffE243DE);

  static Color get black => const Color(0Xff000000);
  static Color get white => Colors.white;
  static Color get darkPurple => const Color(0XffAA5AFC);
  static Color get lightGrey => const Color(0XffC5C5C5);
  static Color get lightestGrey => const Color(0XffE3E1E1);
  static Color get darkGrey => const Color(0XffA7A4A8);

  static Color get lightWhite => const Color(0XffFFFFFF).withOpacity(0.25);

  static Color get cardsBg => const Color(0Xff42454E);

  static LinearGradient glassEffect = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0XffFFFFFF).withOpacity(0.20),
      const Color(0XffFFFFFF).withOpacity(0.10),
    ],
  );

  // static LinearGradient glassPanelHome = LinearGradient(
  //   begin: Alignment.centerLeft,
  //   end: Alignment.centerRight,
  //   colors: [
  //     const Color(0Xff9A9A9A),
  //     const Color(0Xff2ED4D5).withOpacity(0.25),
  //   ],
  // );

  static LinearGradient multiColorGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xffE023DB),
      Color(0xff23E0D5),
    ],
  );
  static LinearGradient bookingGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xffE023DB).withOpacity(0.29),
      const Color(0xff23E0D5).withOpacity(0.05),
      const Color(0xff7A1377).withOpacity(0),
    ],
  );
  static LinearGradient multiColorOpacity = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      const Color(0xffE023DB).withOpacity(0.5),
      const Color(0xff23E0D5).withOpacity(0.5),
    ],
  );

  // static LinearGradient gradients = const LinearGradient(
  //   begin: Alignment.centerLeft,
  //   end: Alignment.centerRight,
  //   colors: [
  //     Color(0xffF54545),
  //     Color(0xffEFD167),
  //     Color(0xffCFE984),
  //     Color(0xffABE2DF),
  //     Color(0xffFB298E),
  //     Color(0xffE791BA),
  //   ],
  // );

  // static LinearGradient mainGradient = LinearGradient(
  //   begin: Alignment.centerLeft,
  //   end: Alignment.centerRight,
  //   colors: [
  //     const Color.fromARGB(255, 57, 134, 219),
  //     const Color.fromARGB(255, 44, 187, 232).withOpacity(0.88),
  //   ],
  // );

  static LinearGradient unSelected = LinearGradient(
    colors: [
      const Color(0XffFFFFFF).withOpacity(0.25),
      const Color(0XffFFFFFF).withOpacity(0.25)
      // Primary.lightWhite,
      // Primary.lightWhite,
      // Colors.grey.withOpacity(0.1),
      // Colors.white,
    ],
  );
// LinearGradient shadow = LinearGradient(
//   colors: [
//     Colors.black.withOpacity(0.5),
//     Colors.grey.withOpacity(0.5),
//   ],
// );
}
