import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketemaa/core/Provider/getData.dart';
import 'package:ketemaa/core/utilities/app_colors/app_colors.dart';
import 'package:provider/provider.dart';

class DropDown extends StatefulWidget {
  final Color color;

  DropDown(this.color);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? value = "24H";
  final items = ['24H', '7D', '30D', '60D', '1Y'];

  int selectIndex = 0;

  GetData? getData;

  @override
  void initState() {
    // TODO: implement initState

    getData = Provider.of<GetData>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Get.height * .235,
      left: Get.width * .62,
      right: 0.0,
      child: DropdownButton<String>(
        value: value,
        items: items.map(buildMenuItem).toList(),
        onChanged: (value) {
          setState(() {
            this.value = value;

            value == '24H'
                ? selectIndex = 0
                : value == '7D'
                    ? selectIndex = 1
                    : value == '30D'
                        ? selectIndex = 2
                        : value == '60D'
                            ? selectIndex = 3
                            : selectIndex = 4;

            getData!.getVaultStats(selectIndex);

            printInfo(info: 'Value value: ' + value.toString());
            printInfo(info: 'Value value Index: ' + selectIndex.toString());
          }); //get value when changed
        },
        icon: const Icon(
          Icons.arrow_drop_down,
          size: 10,
        ),

        iconEnabledColor: Colors.white,
        //Icon color
        style: const TextStyle(
            //te
            color: Colors.white, //Font color
            fontSize: 20 //font size on dropdown button
            ),
        dropdownColor: widget.color,
        underline: Container(),
        //dropdown background color
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontSize: 15),
      ));
}