import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketemaa/core/Provider/postData.dart';
import 'package:ketemaa/core/utilities/app_colors/app_colors.dart';
import 'package:ketemaa/core/utilities/common_widgets/text_input_field.dart';
import 'package:ketemaa/features/vault/Wishlist/alert/alertFrequencyDropdown.dart';
import 'package:ketemaa/features/vault/Wishlist/alert/alertTextfield.dart';
import 'package:ketemaa/features/vault/Wishlist/alert/alertTypeDropDown.dart';
import 'package:provider/provider.dart';
import '../../../../core/models/WishListModel.dart';

class ShowAlertBox extends StatefulWidget {
  final Results? results;

  const ShowAlertBox({Key? key, this.results}) : super(key: key);

  @override
  _ShowAlertBoxState createState() => _ShowAlertBoxState();
}

class _ShowAlertBoxState extends State<ShowAlertBox> {
  TextEditingController valueController = TextEditingController();
  TextEditingController mintController1 = TextEditingController();
  TextEditingController mintController2 = TextEditingController();

  bool? toggleValue = false;
  bool? hasDropDownValue = false;

  PostData? postData;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            20.0,
          ),
        ),
      ),
      contentPadding: const EdgeInsets.only(
        top: 10.0,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Alerts",
            style: TextStyle(fontSize: 22.0, color: AppColors.textColor),
          ),
          AnimatedContainer(
            padding: EdgeInsets.only(left: 2, right: 2),
            duration: Duration(milliseconds: 100),
            height: 30.0,
            width: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: toggleValue == true ? Colors.purple : Colors.grey,
            ),
            child: Stack(

              children: <Widget>[
                AnimatedPositioned(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeIn,
                    top: 3.0,
                    left: toggleValue == true ? 30.0 : 0.0,
                    right: toggleValue == true ? 0.0 : 30.0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          toggleValue = !toggleValue!;
                        });
                      },
                      child:  Container(
                        alignment: toggleValue == true ?Alignment.centerLeft :Alignment.centerLeft ,
                        height: 25,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                        ),

                      ),

                    ))
              ],
            ),
          )
        ],
      ),
      content:toggleValue == true
          ?  SingleChildScrollView(
          padding:  EdgeInsets.symmetric(horizontal: 25),
          child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mint",
                            style: TextStyle(fontSize: 20.0, color: AppColors.textColor),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                         Row(
                            children: [
                              Expanded(
                                child: AlertTextField(
                                  height: Get.height*.02,
                                  controller: mintController1,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Text("-",style: TextStyle(color: AppColors.textColor,fontSize: 25),),
                              SizedBox(width: 10,),
                              Expanded(
                                child:AlertTextField(
                                height: Get.height*.02,
                                controller: mintController2,
                              ),
                              ),


                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Price",
                            style: TextStyle(fontSize: 20.0, color: AppColors.textColor),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                         Text(
                            "Value",
                            style:
                                TextStyle(fontSize: 20.0, color: AppColors.textColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AlertTextField(
                            height: Get.height*.03,
                            controller: valueController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Type",
                            style:
                                TextStyle(fontSize: 20.0, color: AppColors.textColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          AlertTypeDropDown(),

                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Frequency",
                            style:
                            TextStyle(fontSize: 20.0, color: AppColors.textColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          AlertFrequencyDropDown(),

                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              onTap: () {
                                postData = Provider.of<PostData>(context, listen: false);
                                var body = {
                                  "product": widget.results!.productDetail!.id,
                                  "type": 0,
                                  "price_type":TypeIndex,
                                  "value": double.parse(valueController.text),
                                  "frequency": frequencyIndex,
                                };

                                postData!.createAlert(context, body);
                              },
                              child: Text(
                                "Save",
                                style: TextStyle(fontSize: 18.0, color: Colors.purpleAccent),
                              ),

                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    )): Container(
        height: Get.height * .01,
      ),
    );
  }
}