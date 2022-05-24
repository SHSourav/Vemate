import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ketemaa/core/models/AlertModel.dart';
import 'package:ketemaa/core/models/CheckSetCheck.dart';
import 'package:ketemaa/core/models/CheckWishlistModel.dart';
import 'package:ketemaa/core/models/ComicsModel.dart';
import 'package:ketemaa/core/models/NewsModel.dart';
import 'package:ketemaa/core/models/ProfileModel.dart';
import 'package:ketemaa/core/models/SearchCollectiblesModel.dart';
import 'package:ketemaa/core/models/SearchComicsModel.dart';
import 'package:ketemaa/core/models/SetListModel.dart';
import 'package:ketemaa/core/models/SingleProductModel.dart';
import 'package:ketemaa/core/models/VaultStatusModel.dart';
import 'package:ketemaa/core/models/WishListModel.dart';
import 'package:ketemaa/core/network/base_client.dart';
import 'package:ketemaa/core/utilities/urls/urls.dart';
import 'package:ketemaa/main.dart';
import 'package:ketemaa/core/network/base_controller.dart';
import '../models/CollectiblesModel.dart';

class GetData extends ChangeNotifier with BaseController{
  CollectiblesModel? collectiblesModel;
  SearchCollectiblesModel? searchCollectiblesModel;

  ComicsModel? comicsModel;
  SearchComicsModel? searchComicsModel;

  SingleProductModel? singleProductModel;

  ProfileModel? profileModel;

  CheckWishlistModel? checkWishlistModel;
  CheckSetCheck? checkSetCheck;

  WishListModel? wishListModel;
  SetListModel? setListModel;

  VaultStatsModel? vaultStatsModel;

  NewsModel? newsModel;

  AlertModel? alertModel;

  Map<String, String> requestToken = {
    'Authorization': 'token ${prefs!.getString('token')}',
  };

  Future getUserInfo() async {
    profileModel = null;

    final response = await BaseClient().get(Urls.userInfo).catchError(handleError);

    var data = json.decode(response.toString());

    printInfo(info: 'getUserInfo: ' + data.toString());

    profileModel = ProfileModel.fromJson(data);

    notifyListeners();
  }

  clearData() {
    profileModel = null;
    vaultStatsModel = null;
    wishListModel = null;
    setListModel = null;

    notifyListeners();
  }

  Future getCollectibles({int offset = 0}) async {
    final response = await BaseClient().get(Urls.mainUrl +
        '/api/v1/veve/public/products/?type=0&limit=20&offset=$offset').catchError(handleError);

    var data = json.decode(response.toString());
    //printInfo(info: data.toString());

    if (collectiblesModel != null) {
      if (offset == 0) collectiblesModel!.results!.clear();

      collectiblesModel!.results!
          .addAll(CollectiblesModel.fromJson(data).results!);
    } else {
      collectiblesModel = CollectiblesModel.fromJson(data);
    }

    notifyListeners();
  }

  Future searchCollectibles(
      {String keyWord = '', String rarity = '', int offset = 0}) async {
    final response = await BaseClient().get(Urls.mainUrl +
        '/api/v1/veve/public/products/?type=0&limit=20&offset=$offset&rarity=$rarity&name=$keyWord').catchError(handleError);

    var data = json.decode(response.toString());

    printInfo(info: data.toString());

    if (searchCollectiblesModel != null) {
      if (offset == 0) searchCollectiblesModel!.results!.clear();

      searchCollectiblesModel!.results!
          .addAll(SearchCollectiblesModel.fromJson(data).results!);
    } else {
      searchCollectiblesModel = SearchCollectiblesModel.fromJson(data);
    }

    notifyListeners();
  }

  Future getComics({int offset = 0}) async {
    final response = await BaseClient().get(Urls.comic + '$offset').catchError(handleError);

    var data = json.decode(response.toString());

    if (comicsModel != null) {
      if (offset == 0) comicsModel!.results!.clear();

      comicsModel!.results!.addAll(ComicsModel.fromJson(data).results!);
    } else {
      comicsModel = ComicsModel.fromJson(data);
    }

    notifyListeners();
  }

  Future searchComics(
      {String keyWord = '', String rarity = '', int offset = 0}) async {
    final response = await BaseClient().get(Urls.mainUrl +
        '/api/v1/veve/public/products/?type=1&limit=20&offset=$offset&rarity=$rarity&name=$keyWord').catchError(handleError);

    var data = json.decode(response.toString());

    if (searchComicsModel != null) {
      if (offset == 0) searchComicsModel!.results!.clear();

      searchComicsModel!.results!
          .addAll(SearchComicsModel.fromJson(data).results!);
    } else {
      searchComicsModel = SearchComicsModel.fromJson(data);
    }

    notifyListeners();
  }

  Future getSingleProduct(int? id, {int graphType = 0}) async {
    singleProductModel = null;
    final response = await BaseClient()
        .get(Urls.singleProduct + '$id?graph_type=$graphType').catchError(handleError);

    printInfo(info: Urls.singleProduct + '$id?graph_type=$graphType');
    printInfo(info: response);

    var data = json.decode(response.toString());

    printInfo(info: data.toString());

    singleProductModel = SingleProductModel.fromJson(data);

    notifyListeners();
  }

  Future checkWishlist(int id) async {
    checkWishlistModel = null;
    final response = await BaseClient().get(Urls.checkWishlist + id.toString()).catchError(handleError);

    var data = json.decode(response.toString());

    printInfo(info: data.toString());

    checkWishlistModel = CheckWishlistModel.fromJson(data);

    notifyListeners();
  }

  Future checkSetList(int id) async {
    checkSetCheck = null;
    final response = await BaseClient().get(Urls.checkSet + id.toString()).catchError(handleError);

    var data = json.decode(response.toString());

    checkSetCheck = CheckSetCheck.fromJson(data);

    notifyListeners();
  }

  Future getWishList({int offset = 0}) async {
    final response = await BaseClient()
        .get(Urls.commonStorage + '?type=1&limit=20&offset=$offset').catchError(handleError);

    var data = json.decode(response.toString());

    printInfo(info: data.toString());

    if (wishListModel != null) {
      if (offset == 0) wishListModel!.results!.clear();

      wishListModel!.results!.addAll(WishListModel.fromJson(data).results!);
    } else {
      wishListModel = WishListModel.fromJson(data);
    }

    notifyListeners();
  }

  Future getSetList() async {
    setListModel = null;
    final response = await BaseClient().get(Urls.commonStorage + '?type=0').catchError(handleError);

    var data = json.decode(response.toString());

    printInfo(info: data.toString());

    setListModel = SetListModel.fromJson(data);

    notifyListeners();
  }

  Future getVaultStats(int graphType) async {
    vaultStatsModel = null;
    final response =
        await BaseClient().get(Urls.vaultStats + '?graph_type=$graphType').catchError(handleError);

    printInfo(info: Urls.vaultStats + '?graph_type=$graphType');

    var data = json.decode(response.toString());

    printInfo(info: data.toString());
    vaultStatsModel = VaultStatsModel.fromJson(data);

    notifyListeners();
  }

  Future getNews() async {
    newsModel = null;
    final response = await BaseClient().get(Urls.news).catchError(handleError);

    var data = json.decode(response.toString());

    printInfo(info: data.toString());
    newsModel = NewsModel.fromJson(data);

    notifyListeners();
  }

  Future getAlert() async {
    alertModel = null;
    final response = await BaseClient().get(Urls.alertList).catchError(handleError);

    var data = json.decode(response.toString());

    printInfo(info: data.toString());

    alertModel = AlertModel.fromJson(data);

    notifyListeners();
  }
}
