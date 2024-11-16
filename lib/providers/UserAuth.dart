import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../main.dart';
import '../models/UserModel.dart';
import '../networkCalls/myDio.dart';
import '../screens/onboarding/login.dart';
import '../utils/constants.dart';
import '../widgets/toast_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserAuth extends ChangeNotifier {
  String? _uid;
  User? _userData;
  User? get userData => _userData;
  String? get getUid => _uid;
  String? _useAuthToken;
  String? get useAuthToken => _useAuthToken;
  final Map<String, dynamic> _profileData = {};

  void updateProfileData(Map<String, dynamic> newData) {
    print("data updated");
    _profileData.addAll(newData);
    notifyListeners();
  }

  Map<String, dynamic> get profileData => _profileData;

  registration() async {
    try {
      var data = _profileData;
      print('profile Data: $data');
      debugPrint('trying create profile');
      var response = await MyDio().post(
        '${Constants.baseUrl}${Constants.registerProfile}',
        data: data,
      );
      var success = response.data['result']['success'];
      if (success == true) {
        await setUserProfileData();
        ToastManager.successToast("Signed Up Successfully");
        // Navigator.pushReplacement(
        //   navigatorKey.currentContext!,
        //   MaterialPageRoute(builder: (context) => const ForgotScreen()),
        // );
      } else {
        ToastManager.errorToast("Try again");
      }
    } catch (e) {
      print(e);
    }
  }

  editProfileData(Map<String, dynamic> requestData) async {
    try {
      final response = await MyDio().put(
        '${Constants.baseUrl}${Constants.updateUser}',
        data: jsonEncode(requestData),
      );
      print('Updating response: $response');

      if (response.statusCode == 200) {
        var responseData = response.data;
        var success = responseData['result']['response'];
        if (success == true) {
          print('Profile updated successfully');
          updateProfileData(requestData);
        } else {
          print('Failed to update profile');
          throw Exception('Failed to update profile');
        }
      } else {
        print('Failed to update profile: ${response.statusCode}');
        throw Exception('Failed to update profile');
      }
    } catch (e) {
      // Handle Dio errors or general exceptions
      print('Error updating profile: $e');
      throw Exception('Error updating profile: $e');
    }
  }

  void setUserData(User? userData) {
    _userData = userData;
    notifyListeners();
  }

  Future<bool> setUserProfileData() async {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    String? token = await secureStorage.read(key: 'token');
    _useAuthToken = token;

    try {
      var response =
          await MyDio().get('${Constants.baseUrl}${Constants.getUser}');
      final Map<String, dynamic>? json = response.data;
      if (json != null) {
        final userDataMap = json['result']['user'];
        if (userDataMap != null && userDataMap.isNotEmpty) {
          final user = User.fromJson(userDataMap);
          setUserData(user);
          print('User data set');
          return true;
        } else {
          print('User data not found or response is empty');
          return false;
        }
      } else {
        print('Response data is null');
        return false;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return false;
    }
  }

  Future<bool> login({required String email, required String password}) async {
    try {
      var response = await MyDio().post(
        '${Constants.baseUrl}${Constants.loginUser}',
        data: {"email": email, "password": password},
      );
      print('Response data: ${response.data}');
      if (response.statusCode == 200) {
        var responseData = response.data;
        var token = responseData['result']['token'];
        print('Token to save is: $token');
        await _saveAuthTokenToStorage(token);
        return true;
      } else {
        print('Login failed. Unexpected status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error occurred: $e');
      return false;
    }
  }

  Future<bool> signUp({required String email, required String password}) async {
    try {
      var response = await MyDio().post(
        '${Constants.baseUrl}${Constants.signup}',
        data: {"email": email, "password": password},
      );
      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        var responseData = response.data;
        var token = responseData['result']['token'];
        print('Token to save is: $token');
        await _saveAuthTokenToStorage(token);
        // await setUserProfileData(token);
        return true;
      } else {
        var errorMessage = response.data['message'] ?? 'Unknown error occurred';
        print('Signup failed: $errorMessage');
        return false;
      }
    } catch (e) {
      print('Error occurred: $e');
      return false;
    }
  }

  Future<void> _saveAuthTokenToStorage(String token) async {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    await secureStorage.write(key: 'token', value: token);
  }

  getAuthTokenToStorage() async {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    String? result = await secureStorage.read(key: 'token');
    return result;
  }

  logout() async {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    await secureStorage.delete(key: 'token');
    _useAuthToken = null;
    _userData = null;
    Navigator.of(navigatorKey.currentContext!)
        .pushReplacement(MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ));
    ToastManager.successToast("Logged Out");
    // var check = await secureStorage.read(key: 'token');
    // print(check);
    // Navigator.of(navigatorKey.currentContext!)
    //     .pushReplacement(MaterialPageRoute(
    //   builder: (context) => const SignInScreen(),
    // ));
  }

  // Future<void> storeNotificationToken(String token) async {
  //   const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  //   await secureStorage.write(key: 'notificationToken', value: token);
  //
  //   // Update token on the server
  //   try {
  //     var response = await MyDio().post(
  //       '${Constants.baseUrl}updateToken',
  //       data: {"notification_token": token},
  //     );
  //
  //     if (response.statusCode == 200 && response.data['result']['success']) {
  //       print('Notification token updated successfully');
  //     } else {
  //       print('Failed to update notification token');
  //     }
  //   } catch (e) {
  //     print('Error updating notification token: $e');
  //   }
  // }
  Future<void> storeNotificationToken(String token) async {
    try {
      var response = await MyDio().put(
        '${Constants.baseUrl}user/update/notificationToken',
        data: {"token": token},
      );
      if (response.statusCode == 200 && response.data['result']['response']) {
        print('Notification token updated successfully :::$response');
      } else {
        print('Failed to update notification token:::$response');
      }
    } catch (e) {
      print('Error updating notification token: $e');
    }
  }

  // signInWithGoogle({required BuildContext context}) async {
  //   try {
  //     final GoogleSignIn googleSignIn = GoogleSignIn();
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await googleSignIn.signIn();
  //
  //     final GoogleSignInAuthentication? googleSignInAuthentication =
  //         await googleSignInAccount?.authentication;
  //     var tokenId = googleSignInAuthentication?.idToken;
  //     var accessToken = googleSignInAuthentication?.accessToken;
  //     print('accessToken:$accessToken');
  //     if (accessToken != null) {
  //       var response = await MyDio().post(
  //         '${Constants.baseUrl}user/auth/google',
  //         data: {
  //           'auth_token': accessToken,
  //         },
  //       );
  //       // print('response:$response');
  //
  //       Map<String, dynamic> responseData =
  //           Map<String, dynamic>.from(response.data);
  //
  //       // print(responseData);
  //
  //       if (response.statusCode == 200 &&
  //           responseData['result'] != null &&
  //           responseData['result']['success'] == true) {
  //         // var token = responseData['result']['token'].toString();
  //         var token = responseData['result']['response'].toString();
  //         print('Token to response is: $response');
  //
  //         print('Token to save is: $token');
  //         await _saveAuthTokenToStorage(token);
  //         // afterSignInFlow(isProvider: true);
  //         bool userDataSet = await setUserProfileData();
  //         if (userDataSet) {
  //           Navigator.of(navigatorKey.currentContext!).pushReplacement(
  //             MaterialPageRoute(
  //               builder: (context) => const CustomBottomBar(),
  //             ),
  //           );
  //         } else {
  //           // userAuth.logout();
  //           Navigator.of(navigatorKey.currentContext!).push(
  //             MaterialPageRoute(
  //               builder: (context) => const CreateProfile(),
  //             ),
  //           );
  //         }
  //       } else {
  //         var errorMessage =
  //             response.data['result']['error'] ?? 'Unknown error occurred';
  //         ToastManager.errorToast(errorMessage);
  //       }
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
