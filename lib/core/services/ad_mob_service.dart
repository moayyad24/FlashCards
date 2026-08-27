import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AdMobService {
  final List<String> testDeviceIds = [
    // 'YOUR_TEST_DEVICE_ID_HERE',
  ];

  static const String _testAndroidBanner =
      'ca-app-pub-3940256099942544/6300978111';
  static const String _testIosBanner = 'ca-app-pub-3940256099942544/2934735716';

  static const String _testAndroidNative =
      'ca-app-pub-3940256099942544/2247696110';
  static const String _testIosNative = 'ca-app-pub-3940256099942544/3986624511';

  static const String _testAndroidInterstitial =
      'ca-app-pub-3940256099942544/1033173712';
  static const String _testIosInterstitial =
      'ca-app-pub-3940256099942544/4423843709';

  String get bannerAdUnitId {
    if (kDebugMode) {
      return Platform.isAndroid ? _testAndroidBanner : _testIosBanner;
    }
    return Platform.isAndroid
        ? (dotenv.env['ANDROID_BANNER_AD_UNIT_ID'] ?? '')
        : (dotenv.env['IOS_BANNER_AD_UNIT_ID'] ?? '');
  }

  String get nativeAdUnitId {
    if (kDebugMode) {
      return Platform.isAndroid ? _testAndroidNative : _testIosNative;
    }
    return Platform.isAndroid
        ? (dotenv.env['ANDROID_NATIVE_AD_UNIT_ID'] ?? '')
        : (dotenv.env['IOS_NATIVE_AD_UNIT_ID'] ?? '');
  }

  String get interstitialAdUnitId {
    if (kDebugMode) {
      return Platform.isAndroid
          ? _testAndroidInterstitial
          : _testIosInterstitial;
    }
    return Platform.isAndroid
        ? (dotenv.env['ANDROID_INTERSTITIAL_AD_UNIT_ID'] ?? '')
        : (dotenv.env['IOS_INTERSTITIAL_AD_UNIT_ID'] ?? '');
  }
}
