import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketemaa/core/utilities/app_dimension/app_dimension.dart';
import 'package:ketemaa/core/utilities/app_dimension/app_sizes.dart';
import 'package:ketemaa/core/utilities/app_spaces/app_spaces.dart';
import 'package:ketemaa/features/profile/widgets/profile_divider.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:share_plus/share_plus.dart';
import 'package:store_redirect/store_redirect.dart';

import 'custom_app_bar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {


    final _dialog = RatingDialog(
      // your app's name?
      title: Text('Rate Us On App Store or Play Store'),
      // encourage your user to leave a high rating?
      message:
      Text(''),
      // your app's logo?
      image: Image.asset('slider/12.png'),
      submitButtonText: 'Submit',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, comment: ${response.comment}');
        // TODO: add your own logic
        if (response.rating < 3.0) {
          // send their comments to your email or anywhere you wish
          // ask the user to contact you instead of leaving a bad review
        } else {
          //go to app store
          StoreRedirect.redirect(androidAppId: 'com.xinxian.shop',iOSAppId: 'com.xinxian.shop');
        }
      },
    );






    return SafeArea(
      //maintainBottomViewPadding: true,
      minimum: EdgeInsets.zero,
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: EdgeInsets.only(
              left: AppDimension.padding_8,
              right: AppDimension.padding_8,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [
                    AppSpaces.spaces_height_5,
                    Text(
                      'My Account',
                      style: Get.textTheme.headline2,
                      textAlign: TextAlign.center,
                    ),
                    AppSpaces.spaces_height_5,
                    const Padding(
                      padding: EdgeInsets.only(left: 45.0, right: 45.0),
                      child: ProfileDetailsDivider(),
                    ),
                    AppSpaces.spaces_height_5,
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/media/image/profile.png'),
                      ),
                    ),
                    AppSpaces.spaces_height_5,
                    Text(
                      'User Name',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    const ProfileDetailsDivider(),
                    GestureDetector(
                      onTap: (){
                        // Add what you want to do on tap
                      },
                      child:Row(
                      children: [
                        Image.asset(
                          'assets/media/image/edit.png',
                          height: 25,
                          width: 25,
                        ),
                        AppSpaces.spaces_width_10,
                        Text(
                          'Profile Edit',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),
                        ),
                        new Spacer(),
                        Icon(Icons.navigate_next)
                      ],
                    ),
                   ),
                    const ProfileDetailsDivider(),
                    Row(
                      children: [
                        Image.asset(
                          'assets/media/image/customer-service.png',
                          height: 25,
                          width: 25,
                        ),
                        AppSpaces.spaces_width_10,
                        Text(
                          'Help and Support',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),
                        ),
                        new Spacer(),
                        Icon(Icons.navigate_next)
                      ],
                    ),
                    const ProfileDetailsDivider(),
                    Row(
                      children: [
                        Image.asset(
                          'assets/media/image/privacy-policy.png',
                          height: 25,
                          width: 25,
                        ),
                        AppSpaces.spaces_width_10,
                        Text(
                          'Privacy Policy',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),
                        ),
                        new Spacer(),
                        Icon(Icons.navigate_next)
                      ],
                    ),
                    const ProfileDetailsDivider(),


                    GestureDetector(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (context) => _dialog,
                        );

                      },
                      child:Row(
                      children: [
                        Image.asset(
                          'assets/media/image/rating.png',
                          height: 25,
                          width: 25,
                        ),
                        AppSpaces.spaces_width_10,
                        Text(
                          'Rate',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),
                        ),
                        new Spacer(),
                        Icon(Icons.navigate_next)
                      ],
                    ),
                    ),
                    const ProfileDetailsDivider(),

                    GestureDetector(
                      onTap: (){
                        Share.share('Visit Vemate Website:\n https://www.vemate.com/');
                      },
                      child:Row(
                      children: [
                        Image.asset(
                          'assets/media/image/share.png',
                          height: 25,
                          width: 25,
                        ),
                        AppSpaces.spaces_width_10,
                        Text(
                          'Share Vemate',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),
                        ),
                        new Spacer(),
                        Icon(Icons.navigate_next)
                      ],
                    ),
                    ),
                    const ProfileDetailsDivider(),
                    Row(

                      children: [

                        Image.asset(
                          'assets/media/image/information.png',
                          height: 25,
                          width: 25,
                        ),
                        AppSpaces.spaces_width_10,
                        Text(
                          'About Vemate',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),
                        ),
                        new Spacer(),
                        Icon(Icons.navigate_next)
                      ],
                    ),
                    const ProfileDetailsDivider(),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(AppDimension.padding_16),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: Colors.red.shade200,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(AppDimension.padding_10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Log Out',
                            style: Get.textTheme.bodyText2,
                          ),
                          AppSpaces.spaces_width_10,
                          Image.asset(
                            'assets/media/image/logout.png',
                            height: 15,
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
