import 'dart:convert';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ketemaa/graph/graph_helper.dart';
import 'package:provider/provider.dart';
import '../core/Provider/getData.dart';
class ChartExample extends StatefulWidget {
  int? id;
  ChartExample({Key? key, this.id}) : super(key: key);

  @override
  _ChartExampleState createState() => _ChartExampleState();
}


class _ChartExampleState extends State<ChartExample> {
  var collectible = Get.arguments;

  bool _isLoaded = false;
  int _currentIndex = 0;


  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();



  @override
  void initState() {
    super.initState();

    var fetchData = Provider.of<GetData>(context, listen: false);
    fetchData.getSingleCollectible(widget.id);

    // make _isLoaded true after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetData>(builder: (context, data, child) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff272E49),
        elevation: 4,
        title: Text(
          data.singleCollectibleModel != null
              ? data.singleCollectibleModel!.details!.name.toString()
              : "",
          style: TextStyle(
              color: gh.c? Colors.blueGrey.shade300:Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.bold

          ),
        ),
        actions: [
          IconButton(
            icon: Icon(gh.c?null:Icons.list_alt),
            color: gh.c?Colors.blueGrey.shade300:Colors.green,
            padding: const EdgeInsets.only(right: 20),
            onPressed: () {
              setState(() {
                gh.c = !gh.c;
              });

            },

          ),
          IconButton(
            icon: Icon(Icons.notifications),
            color: gh.c?Colors.blueGrey.shade300:Colors.green,
            padding: const EdgeInsets.only(right: 20),
            onPressed: () {
              setState(() {
                gh.c = !gh.c;
              });

            },

          ),

        ],



      ),

      backgroundColor: Color(0xff272E49),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Container(

                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          FadeInUp(
                            duration: Duration(milliseconds: 100),
                            child: Text(
                                  data.singleCollectibleModel != null
                                  ?  "Floor Price: "+data.singleCollectibleModel!.details!.floorPrice.toString()
                                      : "",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.blueGrey.shade300, fontSize: 20),)),
                          SizedBox(height: 20,),

                        ],
                      ),
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 100),
                      child: Container(
                        width: double.infinity,
                        height: 250,
                        child: LineChart(
                          mainData(),
                          swapAnimationDuration: Duration(milliseconds: 1000), // Optional
                          swapAnimationCurve: Curves.bounceIn, // Optional

                      ),
                     )
                    ),
                  ],
                ),
              ),
            )
          ];
        },
        body: GraphHelper(),
      ),

    );
    });
  }

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  LineChartData mainData() {
    return LineChartData(
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
        show: false,
        horizontalInterval: 1.6,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            dashArray: const [3, 3],
            color: const Color(0xff37434d).withOpacity(0.2),
            strokeWidth: 2,
          );
        },
        drawVerticalLine: false
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 8),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return gh.aa;
              case 4:
                return gh.bb;
              case 8:
                return gh.cc;
              case 12:
                return gh.dd;
              case 16:
                return gh.ee;
              case 20:
                return gh.ff;
              case 24:
                return gh.gg;
              case 28:
                return gh.hh;
              case 32:
                return gh.ii;
              case 36:
                return gh.jj;
              case 40:
                return gh.kk;
              case 44:
                return gh.ll;
            }
            return '';
          },
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),

          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10';
              case 3:
                return '30';
              case 5:
                return '50';
              case 7:
                return '70';
              case 9:
                return '90';
            }
            return '';
          },
          reservedSize: 25,
          margin: 2,
        ),
      ),
      minX: 0,
      maxX: 45,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: _isLoaded ? [

            FlSpot(0, 3),
            FlSpot(2.9, 2),
            FlSpot(4.4, 3),
            FlSpot(6.4, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 4),
            FlSpot(12, 5),
            FlSpot(16, 1),
            FlSpot(20, 8),
            FlSpot(24, 2),
            FlSpot(28, 4.1),
            FlSpot(32, 5),
            FlSpot(36, 2.9),
            FlSpot(40, 1.8),
            FlSpot(44, 3),
          ] : [
            FlSpot(0, 0),
            FlSpot(2.4, 0),
            FlSpot(4.4, 0),
            FlSpot(6.4, 0),
            FlSpot(8, 0),
            FlSpot(9.5, 0),
            FlSpot(12, 0),
            FlSpot(16, 0),
            FlSpot(20, 0),
            FlSpot(24, 0),
            FlSpot(28, 0),
            FlSpot(32, 0),
            FlSpot(36, 0),
            FlSpot(40, 0),
            FlSpot(44, 0),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradientFrom: Offset(0, 0),
            gradientTo: Offset(0, 1),
            colors: [
              Color(0xff02d39a).withOpacity(0.1),
              Color(0xff02d39a).withOpacity(0),
            ]
          ),
        ),
      ],
    );

  }

}