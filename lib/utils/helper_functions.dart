import 'package:flutter/material.dart';
import 'package:pit_stop/utils/constants.dart';

import 'essentials.dart';


class HelperFunctions {
  List<Map<String, dynamic>> allTags = [];

  static List<Widget> getSpacedChildren(
      {required List<Widget> items, double space = 10, bool column = false}) {
    if (items.isEmpty) {
      return items;
    }
    return List.generate(items.length * 2 - 1, (index) {
      if (index.isEven) {
        return items[index ~/ 2];
      } else {
        return column ? E.heightSpacer(space) : E.widthSpacer(space);
      }
    });
  }

  static String getMediaFetchUrl(String url) {
    if (url.contains("https://")) {
      return url;
    }
    String result = Constants.baseUrl + url;
    return result.replaceFirst("//media", "/media");
  }

  // static String getFullNameOfUser(User userData) {
  //   String result = capitalize(userData.firstName!);
  //   if (userData.lastName!.isNotEmpty) {
  //     result += " ${capitalize(userData.lastName!)}";
  //   }
  //   return result;
  // }
}
