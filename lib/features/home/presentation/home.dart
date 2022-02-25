import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketemaa/core/utilities/app_dimension/app_dimension.dart';
import 'package:ketemaa/core/utilities/app_spaces/app_spaces.dart';
import 'package:ketemaa/features/home/components/name_row.dart';
import 'package:ketemaa/features/profile/presentation/profile.dart';

import '../../../core/utilities/app_colors/app_colors.dart';
import '../components/matric_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: ListView(
        children: [
          Container(
            height: Get.height * .15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppDimension.padding_16),
                bottomRight: Radius.circular(AppDimension.padding_16),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(AppDimension.padding_16),
                  child: Text(
                    'Vemate',
                    style: Get.textTheme.headline2!
                        .copyWith(color: AppColors.black),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const Profile());
                  },
                  child: Padding(
                    padding: EdgeInsets.all(AppDimension.padding_16),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppDimension.padding_16),
                        ),
                      ),
                      child: Image.asset(
                        'assets/media/image/profile.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          AppSpaces.spaces_height_20,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: NameRow(
              name: 'My Collectibles Matrices',
              style: Get.textTheme.headline1!.copyWith(
                  color: AppColors.black, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: MatricesCard(
                    time: '1 Hour',
                    rate: '-3.49%',
                  ),
                ),
                AppSpaces.spaces_width_10,
                Expanded(
                  child: MatricesCard(
                    time: '24 Hours',
                    rate: '3.49%',
                  ),
                ),
                AppSpaces.spaces_width_10,
                Expanded(
                  child: MatricesCard(
                    time: '7 Days',
                    rate: '-3.49%',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: MatricesCard(
                    time: '30 Days',
                    rate: '-3.49%',
                  ),
                ),
                AppSpaces.spaces_width_10,
                Expanded(
                  child: MatricesCard(
                    time: '60 Days',
                    rate: '4.49%',
                  ),
                ),
              ],
            ),
          ),
          AppSpaces.spaces_height_20,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: NameRow(
              name: 'My Comics Matrices',
              style: Get.textTheme.headline1!.copyWith(
                  color: AppColors.black, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: MatricesCard(
                    time: '1 Hour',
                    rate: '-3.49%',
                  ),
                ),
                AppSpaces.spaces_width_10,
                Expanded(
                  child: MatricesCard(
                    time: '24 Hours',
                    rate: '3.49%',
                  ),
                ),
                AppSpaces.spaces_width_10,
                Expanded(
                  child: MatricesCard(
                    time: '7 Days',
                    rate: '-3.49%',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: MatricesCard(
                    time: '30 Days',
                    rate: '-3.49%',
                  ),
                ),
                AppSpaces.spaces_width_10,
                Expanded(
                  child: MatricesCard(
                    time: '60 Days',
                    rate: '4.49%',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}