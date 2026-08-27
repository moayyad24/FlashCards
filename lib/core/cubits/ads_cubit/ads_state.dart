class AdsState {
  final bool isBannerLoading;
  final bool isBannerSuccess;
  final bool isBannerFailure;

  final bool isInterstitialLoading;
  final bool isInterstitialSuccess;
  final bool isInterstitialReady;
  final bool isInterstitialFailure;

  const AdsState({
    this.isBannerLoading = false,
    this.isBannerSuccess = false,
    this.isBannerFailure = false,
    this.isInterstitialLoading = false,
    this.isInterstitialSuccess = false,
    this.isInterstitialReady = false,
    this.isInterstitialFailure = false,
  });

  AdsState copyWith({
    bool? isBannerLoading,
    bool? isBannerSuccess,
    bool? isBannerFailure,
    bool? isInterstitialLoading,
    bool? isInterstitialSuccess,
    bool? isInterstitialReady,
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
      isInterstitialReady: isInterstitialReady ?? this.isInterstitialReady,
      isInterstitialFailure:
          isInterstitialFailure ?? this.isInterstitialFailure,
    );
  }
}
