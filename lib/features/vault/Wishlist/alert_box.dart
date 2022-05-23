import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketemaa/core/utilities/app_colors/app_colors.dart';
import 'package:ketemaa/core/utilities/common_widgets/text_input_field.dart';
import 'package:toggle_switch/toggle_switch.dart';

bool? toggleValue = false;
bool? hasDropDownValue = false;

TextEditingController valueController = TextEditingController();

class showAlertBox extends StatefulWidget {
  const showAlertBox({Key? key}) : super(key: key);

  @override
  _showAlertBoxState createState() => _showAlertBoxState();
}

class _showAlertBoxState extends State<showAlertBox> {
  String dropdownvalue = 'Price rises';

  // List of items in our dropdown menu

  var items = [
    'Price rises',
    'Price drops',
  ];
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
            style: TextStyle(fontSize: 22.0, color: Colors.white),
          ),
          InkWell(
            onTap: () {
              printInfo(info: 'On Tapped');
            },
            child:  Text(
              "Save",
              style: TextStyle(fontSize: 18.0, color: Colors.purple),
            ),
          ),

        ],
      ),
      content: Container(
          height: toggleValue == true ? 350 : 100,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(


            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Price",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
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
                              child: AnimatedSwitcher(
                                duration: Duration(milliseconds: 100),
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  return RotationTransition(
                                    child: child,
                                    turns: animation,
                                  );
                                },
                                child: Container(
                                  height: 25,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
              toggleValue == true
                  ? Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Value",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          /*TextInputField(
                      labelText: "",
                      height: Get.height * .05,
                      textType: TextInputType.number,
                      controller: valueController,
                    ),*/
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                              textAlign: TextAlign.center,
                              controller: valueController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1.0),
                                  borderRadius: BorderRadius.circular(
                                    15.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1.0),
                                  borderRadius: BorderRadius.circular(
                                    15.0,
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Type",
                            style:
                            TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DropdownButtonFormField(
                              value: dropdownvalue,
                              dropdownColor: AppColors.backgroundColor,
                              decoration: InputDecoration(

                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                fillColor: AppColors.backgroundColor,
                              ),

                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: TextStyle(color: Colors.white,fontSize: 18),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),

                        ],
                      ),
                    )
                  : Container(),

            ],
          )),
    );
  }
}
