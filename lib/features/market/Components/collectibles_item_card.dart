import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ketemaa/core/utilities/shimmer/color_loader.dart';
import 'package:ketemaa/core/utilities/shimmer/loading.dart';
import 'package:ketemaa/features/market/presentation/collectible_details.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../core/Provider/getData.dart';
import '../../../core/models/CollectiblesModel.dart';
import '../../../core/utilities/app_colors/app_colors.dart';
import '../../../core/utilities/app_spaces/app_spaces.dart';


class CollectiblesItemCard extends StatefulWidget {
  const CollectiblesItemCard({Key? key}) : super(key: key);

  @override
  State<CollectiblesItemCard> createState() => _CollectiblesItemCardState();
}

class _CollectiblesItemCardState extends State<CollectiblesItemCard> {
  int offset = 0;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final GlobalKey _contentKey = GlobalKey();
  final GlobalKey _refreshkey = GlobalKey();

  GetData? getData;

  @override
  void initState() {
    super.initState();
    getData = Provider.of<GetData>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetData>(builder: (context, data, child) {
      return SizedBox(
        height: Get.height * .8,
        child: data.collectiblesModel != null
            ? SmartRefresher(
                key: _refreshkey,
                controller: refreshController,
                enablePullDown: true,
                enablePullUp: true,
                header: WaterDropMaterialHeader(
                  color: AppColors.graphCard,
                ),
                footer: const ClassicFooter(
                  loadStyle: LoadStyle.ShowWhenLoading,
                ),
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.collectiblesModel!.results!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 4,bottom: 4,left: 4,right: 4),
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: AppColors.graphCard,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.to(
                              () => CollectibleDetails(
                                productId:
                                    data.collectiblesModel!.results![index].id,
                              ),
                            );

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: Get.height * .09,
                                  width: Get.height * .078,
                                  decoration: BoxDecoration(
                                      color: AppColors.backgroundColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: AppColors.textBoxBgColor)),
                                  alignment: Alignment.center,
                                  child: data.collectiblesModel!.results![index].image == null ?Text(
                                    data.collectiblesModel!.results![index].name
                                        .toString()[0]
                                        .toUpperCase(),
                                    style: TextStyle(
                                        color: AppColors.backgroundColor,
                                        fontFamily: 'Inter',
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  )
                                    :CachedNetworkImage(
                                     imageUrl: data.collectiblesModel!.results![index].image!.image_on_list!.src.toString(),
                                    imageBuilder: (context, imageProvider) => Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: _loader,
                                     ),
                                ),
                                AppSpaces.spaces_width_5,
                                Expanded(
                                  flex: 7,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 5,
                                              child: SizedBox(
                                                child: Text(
                                                  data.collectiblesModel!
                                                      .results![index].name
                                                      .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: Get
                                                      .textTheme.bodyText2!
                                                      .copyWith(
                                                          color: AppColors
                                                              .textColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 13.sp),
                                                ),
                                              )),
                                          AppSpaces.spaces_width_2,
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              data.collectiblesModel!
                                                  .results![index].edition
                                                  .toString(),
                                              textAlign: TextAlign.start,
                                              style: Get.textTheme.bodyText1!
                                                  .copyWith(
                                                      color:
                                                          AppColors.textColor,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 10.sp),
                                            ),
                                          ),
                                        ],
                                      ),
                                      AppSpaces.spaces_height_10,
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: Text(
                                              data
                                                          .collectiblesModel!
                                                          .results![index]
                                                          .brand !=
                                                      null
                                                  ? data
                                                      .collectiblesModel!
                                                      .results![index]
                                                      .brand!
                                                      .name
                                                      .toString()
                                                  : '',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: Get.textTheme.bodyText1!
                                                  .copyWith(
                                                      color:
                                                          AppColors.textColor,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 10.sp),
                                            ),
                                          ),
                                          AppSpaces.spaces_width_2,
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              data.collectiblesModel!
                                                  .results![index].rarity
                                                  .toString(),
                                              textAlign: TextAlign.start,
                                              style: Get.textTheme.bodyText1!
                                                  .copyWith(
                                                      color:
                                                          AppColors.textColor,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 10.sp),
                                            ),
                                          ),
                                        ],
                                      ),
                                      AppSpaces.spaces_height_10,
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: Text(
                                              r"$" +
                                                  data
                                                      .collectiblesModel!
                                                      .results![index]
                                                      .floorPrice
                                                      .toString(),
                                              textAlign: TextAlign.start,
                                              style: Get.textTheme.bodyText1!
                                                  .copyWith(
                                                      color:
                                                          AppColors.textColor,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 11.sp),
                                            ),
                                          ),
                                          AppSpaces.spaces_width_2,
                                          const Expanded(
                                            flex: 3,
                                            child: Text(""),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                AppSpaces.spaces_width_2,
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: Get.height * .05,
                                        child: SfCartesianChart(
                                          plotAreaBorderWidth: 0,
                                          primaryXAxis: CategoryAxis(
                                            isVisible: false,
                                            majorGridLines:
                                                const MajorGridLines(width: 0),
                                            labelIntersectAction:
                                                AxisLabelIntersectAction.hide,
                                            labelRotation: 270,
                                            labelAlignment:
                                                LabelAlignment.start,
                                            maximumLabels: 7,
                                          ),
                                          primaryYAxis: CategoryAxis(
                                            isVisible: false,
                                            majorGridLines:
                                                const MajorGridLines(width: 0),
                                            labelIntersectAction:
                                                AxisLabelIntersectAction.hide,
                                            labelRotation: 0,
                                            labelAlignment:
                                                LabelAlignment.start,
                                            maximumLabels: 10,
                                          ),
                                          tooltipBehavior:
                                              TooltipBehavior(enable: true),
                                          series: <ChartSeries<Graph, String>>[
                                            LineSeries<Graph, String>(
                                              color: data
                                                          .collectiblesModel!
                                                          .results![index]
                                                          .priceChangePercent!
                                                          .sign ==
                                                      'decrease'
                                                  ? Colors.red
                                                  : Colors.green,
                                              dataSource: data
                                                  .collectiblesModel!
                                                  .results![index]
                                                  .graph!,
                                              xValueMapper: (Graph plot, _) =>
                                                  plot.date,
                                              yValueMapper: (Graph plot, _) =>
                                                  plot.floorPrice,
                                              xAxisName: 'Duration',
                                              yAxisName: 'Total',
                                            )
                                          ],
                                        ),
                                      ),
                                      AppSpaces.spaces_height_10,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '\$${data.collectiblesModel!.results![index].priceChangePercent!.changePrice != null ? data.collectiblesModel!.results![index].priceChangePercent!.changePrice!.toStringAsFixed(2) : ""}',
                                              textAlign: TextAlign.start,
                                              style: Get.textTheme.bodyText1!
                                                  .copyWith(
                                                      color:
                                                          AppColors.textColor,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10),
                                            ),
                                          ),
                                          AppSpaces.spaces_width_2,
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  data
                                                          .collectiblesModel!
                                                          .results![index]
                                                          .priceChangePercent!
                                                          .percent!
                                                          .toStringAsFixed(2) +
                                                      "%",
                                                  textAlign: TextAlign.end,
                                                  style: Get
                                                      .textTheme.bodyText1!
                                                      .copyWith(
                                                          color: data
                                                                      .collectiblesModel!
                                                                      .results![
                                                                          index]
                                                                      .priceChangePercent!
                                                                      .sign ==
                                                                  'decrease'
                                                              ? Colors.red
                                                              : Colors.green,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 10),
                                                ),
                                                if (data
                                                        .collectiblesModel!
                                                        .results![index]
                                                        .priceChangePercent!
                                                        .sign ==
                                                    'decrease')
                                                  const Expanded(
                                                    child: Icon(
                                                      Icons.arrow_downward,
                                                      color: Colors.red,
                                                      size: 10,
                                                    ),
                                                  )
                                                else
                                                  const Expanded(
                                                    child: Icon(
                                                      Icons.arrow_upward,
                                                      color: Colors.green,
                                                      size: 10,
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            :  ColorLoader(),
      );
    });


  }
  Widget _loader(BuildContext context, String url) {
    return  ImageIcon(
      AssetImage( 'assets/media/icon/logo v.png'),
      color: Color(0xFF3A5A98),
    );
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));

    getData!.getCollectibles();

    setState(() {
      refreshController.refreshCompleted();
      offset = 0;
    });
  }

  Future<void> _onLoading() async {
    offset = offset + 20;

    getData!.getCollectibles(offset: offset);

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        refreshController.loadComplete();
      });
    }
  }
}
