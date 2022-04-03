import 'package:animate_do/animate_do.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketemaa/core/Provider/postData.dart';
import 'package:ketemaa/core/utilities/app_colors/app_colors.dart';
import 'package:ketemaa/core/utilities/app_spaces/app_spaces.dart';
import 'package:provider/provider.dart';

import '../core/Provider/getData.dart';
import 'components/item_details_helper.dart';

class ProductDetails extends StatefulWidget {
  final int? id;

  const ProductDetails({Key? key, this.id}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  GetData? getData;

  PostData? postData;

  @override
  void initState() {
    super.initState();

    getData = Provider.of<GetData>(context, listen: false);

    postData = Provider.of<PostData>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetData>(
      builder: (context, data, child) {
        return Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /* FadeInUp(
                duration: const Duration(milliseconds: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DesignHelper(
                      onPressed: () {},
                      child: const Text(
                        "1H",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),

                    //FOR 7 DAYS
                    DesignHelper(
                      onPressed: () {},
                      child: const Text(
                        "24H",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    DesignHelper(
                      onPressed: () {
                        getData!.getSingleProduct(widget.id, graphType: 1);
                      },
                      child: const Text(
                        "7D",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    AppSpaces.spaces_height_5,
                    //FOR 30 DAYS
                    DesignHelper(
                      onPressed: () {},
                      child: const Text(
                        "30D",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppSpaces.spaces_height_5,
              FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //FOR 60 DAYS
                    DesignHelper(
                      onPressed: () {},
                      child: const Text(
                        "60D",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 5,
                    ),

                    //FOR 1 YEAR
                    DesignHelper(
                      onPressed: () {},
                      child: const Text(
                        "1Y",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              AppSpaces.spaces_height_40,*/
              // recent transactions
              FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: Text(
                  data.singleProductModel != null
                      ? data.singleProductModel!.name.toString() + "'s Details"
                      : "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blueGrey.shade300,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              AppSpaces.spaces_height_20,
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 0.5)),
                  child: ListView(children: <Widget>[
                    ItemDetailsHelper(
                      text: "Floor Price",
                      text1: data.singleProductModel != null
                          ? data.singleProductModel!.floorPrice.toString()
                          : "",
                    ),
                    const SizedBox(
                      height: 0.5,
                    ),
                    ItemDetailsHelper(
                      text: "Owner",
                      text1: data.singleProductModel != null
                          ? data.singleProductModel!.owner.toString()
                          : "",
                    ),
                    const SizedBox(
                      height: 0.5,
                    ),
                    ItemDetailsHelper(
                      text: "Edition",
                      text1: data.singleProductModel != null
                          ? data.singleProductModel!.edition.toString()
                          : "",
                    ),
                    const SizedBox(
                      height: 0.5,
                    ),
                    ItemDetailsHelper(
                      text: "Name",
                      text1: data.singleProductModel != null
                          ? data.singleProductModel!.name.toString()
                          : "",
                    ),
                    const SizedBox(
                      height: 0.5,
                    ),
                    ItemDetailsHelper(
                      text: "Drop Date",
                      text1: data.singleProductModel != null
                          ? data.singleProductModel!.dropDate.toString()
                          : "",
                    ),
                    const SizedBox(
                      height: 0.5,
                    ),
                    ItemDetailsHelper(
                      text: "List Price",
                      text1: data.singleProductModel != null
                          ? data.singleProductModel!.listPrice.toString()
                          : "",
                    ),
                    const SizedBox(
                      height: 0.5,
                    ),
                    ItemDetailsHelper(
                      text: "Editions",
                      text1: data.singleProductModel != null
                          ? data.singleProductModel!.editions.toString()
                          : "",
                    ),
                    const SizedBox(
                      height: 0.5,
                    ),
                    ItemDetailsHelper(
                      text: "Edition Type",
                      text1: data.singleProductModel != null
                          ? data.singleProductModel!.editionType.toString()
                          : "",
                    ),
                    const SizedBox(
                      height: 0.5,
                    ),
                    ItemDetailsHelper(
                      text: "Season",
                      text1: data.singleProductModel != null
                          ? data.singleProductModel!.season.toString()
                          : "",
                    ),
                    const SizedBox(
                      height: 0.5,
                    ),
                    ItemDetailsHelper(
                      text: "Rarity",
                      text1: data.singleProductModel != null
                          ? data.singleProductModel!.rarity.toString()
                          : "",
                    ),
                    const SizedBox(
                      height: 0.5,
                    ),
                    ItemDetailsHelper(
                      text: "Brand",
                      text1: data.singleProductModel != null
                          ? data.singleProductModel!.brand.toString()
                          : "",
                    ),
                    const SizedBox(
                      height: 0.5,
                    ),
                    ItemDetailsHelper(
                      text: "Series",
                      text1: data.singleProductModel != null
                          ? data.singleProductModel!.series.toString()
                          : "",
                    ),
                  ]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      var body = {
                        "product": data.singleProductModel!.id,
                        "type": 1
                      };

                      data.checkWishlistModel!.isFound == false
                          ? postData!.addToWishlist(
                              context,
                              body,
                              data.singleProductModel!.id,
                            )
                          : Flushbar(
                              flushbarPosition: FlushbarPosition.BOTTOM,
                              isDismissible: false,
                              duration: const Duration(seconds: 3),
                              messageText: const Text(
                                "Product already in your wishlist",
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.green),
                              )).show(context);
                    },
                    child: Container(
                      width: Get.width * .45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: AppColors.purpleGradient,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 15, bottom: 15),
                        child: data.checkWishlistModel!.isFound == false
                            ? Text(
                                'Add to Wishlist',
                                style: Get.textTheme.bodyMedium,
                              )
                            : Text(
                                'Already in Wishlist',
                                style: Get.textTheme.bodyMedium,
                              ),
                      ),
                    ),
                  ),
                  AppSpaces.spaces_width_2,
                  InkWell(
                    onTap: () {
                      var body = {
                        "product": data.singleProductModel!.id,
                        "type": 0
                      };

                      data.checkSetCheck!.isFound == false
                          ? postData!.addToSet(
                              context,
                              body,
                              data.singleProductModel!.id,
                            )
                          : Flushbar(
                              flushbarPosition: FlushbarPosition.BOTTOM,
                              isDismissible: false,
                              duration: const Duration(seconds: 3),
                              messageText: const Text(
                                "Product already in your set",
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.green),
                              )).show(context);
                    },
                    child: Container(
                      width: Get.width * .45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: AppColors.purpleGradient,
                        //color: AppColors.primaryColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 15, bottom: 15),
                        child: data.checkSetCheck!.isFound == false
                            ? Text('Add to Set',
                                style: Get.textTheme.bodyMedium)
                            : Text('Already in Set',
                                style: Get.textTheme.bodyMedium),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}