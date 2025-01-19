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
  static String getTimeAgo(int timestamp) {
    if (timestamp.toString().isNotEmpty) {
      final now = DateTime.now();
      final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp); // Convert timestamp to DateTime
      final difference = now.difference(dateTime);

      if (difference.isNegative) {
        // Future event
        final futureDifference = dateTime.difference(now); // Difference in the future
        if (futureDifference.inDays > 0) {
          return 'In ${futureDifference.inDays}d';
        } else if (futureDifference.inHours > 0) {
          return 'In ${futureDifference.inHours}h';
        } else if (futureDifference.inMinutes > 0) {
          return 'In ${futureDifference.inMinutes}m';
        } else {
          return 'Just Now';
        }
      } else {
        // Past event
        if (difference.inDays > 0) {
          return '${difference.inDays}d ago';
        } else if (difference.inHours > 0) {
          return '${difference.inHours}h ago';
        } else if (difference.inMinutes > 0) {
          return '${difference.inMinutes}m ago';
        } else {
          return 'Now';
        }
      }
    } else {
      return "";
    }
  }



  static String getMediaFetchUrl(String url) {
    if (url.contains("https://")) {
      return url;
    }
    String result = "${Constants.baseUrl}api$url";
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
