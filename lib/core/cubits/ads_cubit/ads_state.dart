class AdsState {
  final bool isBannerLoading;
  final bool isBannerSuccess;
  final bool isBannerFailure;

  final bool isInterstitialLoading;
  final bool isInterstitialSuccess;
  final bool isInterstitialFailure;

  const AdsState({
    this.isBannerLoading = false,
    this.isBannerSuccess = false,
    this.isBannerFailure = false,
    this.isInterstitialLoading = false,
    this.isInterstitialSuccess = false,
    this.isInterstitialFailure = false,
  });

  AdsState copyWith({
    bool? isBannerLoading,
    bool? isBannerSuccess,
    bool? isBannerFailure,
    bool? isInterstitialLoading,
    bool? isInterstitialSuccess,
    bool? isInterstitialFailure,
  }) {
    return AdsState(
      isBannerLoading: isBannerLoading ?? this.isBannerLoading,
      isBannerSuccess: isBannerSuccess ?? this.isBannerSuccess,
      isBannerFailure: isBannerFailure ?? this.isBannerFailure,
      isInterstitialLoading:
          isInterstitialLoading ?? this.isInterstitialLoading,
      isInterstitialSuccess:
          isInterstitialSuccess ?? this.isInterstitialSuccess,
      isInterstitialFailure:
          isInterstitialFailure ?? this.isInterstitialFailure,
    );
  }
}
