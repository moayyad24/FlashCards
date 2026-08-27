import 'package:cardy/core/cubits/ads_cubit/ads_state.dart';
import 'package:cardy/core/services/ad_mob_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsCubit extends Cubit<AdsState> {
  final AdMobService adMobService;
  AdsCubit(this.adMobService) : super(const AdsState());

  BannerAd? banner;
  InterstitialAd? interstitialAd;

  void createBannerAd() {
    emit(state.copyWith(
        isBannerLoading: true, isBannerSuccess: false, isBannerFailure: false));
    banner = BannerAd(
      size: AdSize.banner,
      request: const AdRequest(),
      adUnitId: adMobService.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) =>
            emit(state.copyWith(isBannerLoading: false, isBannerSuccess: true)),
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          banner = null;
          emit(state.copyWith(isBannerLoading: false, isBannerFailure: true));
        },
      ),
    )..load();
  }

  void loadInterstitialAd() {
    emit(state.copyWith(
        isInterstitialLoading: true,
        isInterstitialSuccess: false,
        isInterstitialFailure: false));
    InterstitialAd.load(
        adUnitId: adMobService.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            ad.fullScreenContentCallback = FullScreenContentCallback(
                // Called when the ad showed the full screen content.
                onAdShowedFullScreenContent: (ad) {},
                // Called when an impression occurs on the ad.
                onAdImpression: (ad) {},
                // Called when the ad failed to show full screen content.
                onAdFailedToShowFullScreenContent: (ad, err) {
                  ad.dispose();
                  interstitialAd = null;
                },
                // Called when the ad dismissed full screen content.
                onAdDismissedFullScreenContent: (ad) {
                  ad.dispose();
                  interstitialAd = null;
                  // Optionally reload here if you want it ready for next time:
                  // loadInterstitialAd();
                },
                // Called when a click is recorded for an ad.
                onAdClicked: (ad) {});
            // Keep a reference to the ad so you can show it later.
            interstitialAd = ad;
            emit(state.copyWith(
                isInterstitialLoading: false, isInterstitialSuccess: true));
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
            interstitialAd = null;
            emit(state.copyWith(
                isInterstitialLoading: false, isInterstitialFailure: true));
          },
        ));
  }

  /// Show the loaded interstitial ad.
  void showInterstitialAd() {
    if (interstitialAd != null) {
      interstitialAd!.show();
      // Emitting default state for interstitial so it can be reloaded later
      emit(state.copyWith(isInterstitialSuccess: false));
    } else {
      debugPrint('Warning: attempt to show interstitial before loaded.');
    }
  }

  @override
  Future<void> close() {
    banner?.dispose();
    interstitialAd?.dispose();
    return super.close();
  }
}
