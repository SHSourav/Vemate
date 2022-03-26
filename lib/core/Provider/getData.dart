import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ketemaa/core/models/CommicsModel.dart';
import 'package:ketemaa/core/models/ProfileModel.dart';
import 'package:ketemaa/core/models/SingleCollectibleModel.dart';
import 'package:ketemaa/core/models/SingleComicModel.dart';
import 'package:ketemaa/core/utilities/urls/urls.dart';
import 'package:ketemaa/main.dart';
import '../models/CollectiblesModel.dart';

class GetData extends ChangeNotifier {
  CollectiblesModel? collectiblesModel;
  SingleCollectibleModel? singleCollectibleModel;

  ComicsModel? comicsModel;
  SingleComicModel? singleComicModel;

  ProfileModel? profileModel;

  Map<String, String> requestHeadersWithToken = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'token ${prefs!.getString('token')}',
  };
  Map<String, String> requestToken = {
    'Authorization': 'token ${prefs!.getString('token')}',
  };

  Future getUserInfo() async {
    profileModel = null;
    final response = await http.get(
      Uri.parse(Urls.userInfo),
      headers: requestToken,
    );

    var data = json.decode(response.body.toString());

    printInfo(info: data.toString());

    profileModel = ProfileModel.fromJson(data);

    notifyListeners();
  }

  Future getCollectibles() async {
    collectiblesModel = null;
    final response = await http.get(Uri.parse(
      Urls.collectibles,
    ));

    var data = json.decode(response.body.toString());

    printInfo(info: data.toString());

    collectiblesModel = CollectiblesModel.fromJson(data);

    notifyListeners();
  }

  Future getSingleCollectible(int? id) async {
    singleCollectibleModel = null;
    final response = await http.get(Uri.parse(
      Urls.singleCollectible + id!.toString(),
    ));

    printInfo(info: Urls.singleCollectible + id.toString());

    var data = json.decode(response.body.toString());

    printInfo(info: data.toString());

    singleCollectibleModel = SingleCollectibleModel.fromJson(data);

    notifyListeners();
  }

  Future getComics() async {
    comicsModel = null;
    final response = await http.get(Uri.parse(
      Urls.comics,
    ));

    var data = json.decode(response.body.toString());

    printInfo(info: data.toString());

    comicsModel = ComicsModel.fromJson(data);

    notifyListeners();
  }

  Future getSingleComic(int? id) async {
    singleComicModel = null;
    final response = await http.get(Uri.parse(
      Urls.singleComic + id!.toString(),
    ));

    printInfo(info: Urls.singleComic + id.toString());

    var data = json.decode(response.body.toString());

    printInfo(info: data.toString());

    singleComicModel = SingleComicModel.fromJson(data);

    notifyListeners();
  }
}
