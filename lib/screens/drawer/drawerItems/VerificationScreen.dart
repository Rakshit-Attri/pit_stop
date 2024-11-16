import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../networkCalls/myDio.dart';
import '../../../providers/UserAuth.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/essentials.dart';
import '../../../utils/image_constants.dart';
import '../../../widgets/toast_manager.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  XFile? govtIdFront;
  XFile? govtIdBack;
  XFile? selfie;
  late UserAuth userAuth;
  @override
  void initState() {
    super.initState();
    userAuth = Provider.of<UserAuth>(context, listen: false);
    _tabController = TabController(length: 3, vsync: this);
  }

  Future<void> pickImage(int tabIndex) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        if (tabIndex == 0) {
          govtIdFront = image;
        } else if (tabIndex == 1) {
          govtIdBack = image;
        } else {
          selfie = image;
        }
      });
    }
  }

  void removeImage(int tabIndex) {
    setState(() {
      if (tabIndex == 0) {
        govtIdFront = null;
      } else if (tabIndex == 1) {
        govtIdBack = null;
      } else {
        selfie = null;
      }
    });
  }

  void submitVerification() async {
    if (govtIdFront != null && govtIdBack != null && selfie != null) {
      // Data to be sent in the request
      final data = {
        // "accountType":
        //     userAuth.userData?.accountType, // Assuming userAuth is available
        "userId": userAuth.userData?.id,
        "govtIdFront": govtIdFront!.path,
        "govtIdBack": govtIdBack!.path,
        "selfie": selfie!.path,
      };

      try {
        var response = await MyDio().post(
            '${Constants.baseUrl}${Constants.verificationSubmit}',
            data: data);

        if (response?.data['result']['success'] == true) {
          ToastManager.successToast('Verification submitted successfully.');
          print("Verification submitted successfully.");
          Navigator.pop(context);
        } else {
          String errorMessage =
              response?.data['result']['error'] ?? 'Submission failed';
          ToastManager.errorToast(errorMessage);
          print("Error: $errorMessage");
        }
      } on Exception catch (e) {
        ToastManager.errorToast(
            'An error occurred while submitting verification.');
        print("Error during submission: $e");
      }
    } else {
      ToastManager.errorToast('Please complete all steps.');
      print("Please complete all steps.");
    }
  }

  Widget verificationPage(BuildContext context, String title, String imagePath,
      int tabIndex, XFile? imageFile) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => pickImage(tabIndex),
          child: imageFile != null
              ? Column(
                  children: [
                    Image.file(
                      File(imageFile.path),
                      height: 200,
                      width: 300,
                    ),
                    E.heightSpacer(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => pickImage(tabIndex),
                          child: E.myText('Change',
                              context: context,
                              fontSize: 13,
                              color: Primary.lightGrey),
                        ),
                        E.widthSpacer(16),
                        InkWell(
                          onTap: () => removeImage(tabIndex),
                          child: E.myText('Remove',
                              context: context,
                              fontSize: 13,
                              color: const Color(0xffF23B3B)),
                        ),
                      ],
                    )
                  ],
                )
              : Column(
                  children: [
                    E.heightSpacer(60),
                    SvgPicture.asset(
                      imagePath,
                      height: 200,
                    ),
                  ],
                ),
        ),
        E.heightSpacer(80),
        // E.myText(
        //     'Hey ${userAuth.userData?.firstName} ${userAuth.userData?.lastName}',
        //     context: context,
        //     fontSize: 16,
        //     textAlign: TextAlign.center,
        //     color: Primary.darkPurple),
        E.heightSpacer(10),
        E.myText(
          title,
          context: context,
          fontSize: 16,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        // E.heightSpacer(40),
        E.purpleButton(
            // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            text: tabIndex == 2 ? 'Submit' : 'Next',
            context: context,
            onTap: () {
              if (tabIndex == 2) {
                submitVerification();
              } else {
                _tabController.animateTo(tabIndex + 1);
              }
            }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: E.myAppBar(context, 'Verification'),
      body: Column(
        children: [
          TabBar(
            labelStyle: const TextStyle(fontSize: 14),
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Primary.newHighlight,
            labelColor: Primary.newHighlight,
            unselectedLabelColor: Primary.darkGrey,
            tabs: const [
              Tab(text: 'Front'),
              Tab(text: 'Back'),
              Tab(text: 'Selfie'),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TabBarView(
                controller: _tabController,
                children: [
                  verificationPage(
                      context,
                      'Please provide a photo of the front of your voter ID.',
                      ImageConstant.front,
                      0,
                      govtIdFront),
                  verificationPage(
                      context,
                      'Please provide a photo of the back of your voter ID.',
                      ImageConstant.back,
                      1,
                      govtIdBack),
                  verificationPage(
                      context,
                      'Please provide a selfie for verification.',
                      ImageConstant.selfie,
                      2,
                      selfie),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
