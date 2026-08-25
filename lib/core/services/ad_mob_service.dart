class AdMobService {
  static bool isAndroid = true;
  static String? get bannerAdUnitId {
    if (isAndroid) {
      // test ca-app-pub-3940256099942544/6300978111
      return 'ca-app-pub-3940256099942544/6300978111';
    } else {
      return null;
    }
  }

  static String? get rewardedAdUnitId {
    if (isAndroid) {
      // test ca-app-pub-3940256099942544/5224354917
      return 'ca-app-pub-3940256099942544/5224354917';
    } else {
      return null;
    }
  }

  static String? get interstitialAdUnitId {
    if (isAndroid) {
      // test ca-app-pub-3940256099942544/1033173712
      return 'ca-app-pub-3940256099942544/1033173712';
    } else {
      return null;
    }
  }
}
