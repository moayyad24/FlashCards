import 'package:cardy/core/cubits/ads_cubit/ads_cubit.dart';
import 'package:cardy/core/helper/app_router.dart';
import 'package:cardy/core/helper/dependency_injection.dart';
import 'package:cardy/core/helper/simple_bloc_observer.dart';
import 'package:cardy/core/services/ad_mob_service.dart';
import 'package:cardy/core/theme/app_theme.dart';
import 'package:cardy/core/theme/colors.dart';
import 'package:cardy/features/home/data/repo/home_repo_impl.dart';
import 'package:cardy/features/home/manager/home_cubit/home_cubit.dart';
import 'package:cardy/features/settings/data/repo/settings_repo_impl.dart';
import 'package:cardy/features/settings/manager/settings_cubit/settings_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await dotenv.load(fileName: ".env");
  await MobileAds.instance.initialize();
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => Cardy(
      appRouter: AppRouter(),
    ),
  ));
}

class Cardy extends StatelessWidget {
  final AppRouter appRouter;
  const Cardy({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(systemNavigationBarColor: AppColors.black));
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      fontSizeResolver: (fontSize, instance) {
        // Get the raw scaled font size using the height-based method
        double rawScaled = FontSizeResolvers.height(fontSize, instance);

        // Define maximum font sizes for different text categories
        // You can adjust these values based on your design needs
        if (fontSize <= 14) {
          // Small text (captions, hints) - max 18 on tablets
          return rawScaled.clamp(12.0, 18.0);
        } else if (fontSize <= 20) {
          // Body text - max 24 on tablets
          return rawScaled.clamp(14.0, 24.0);
        } else {
          // Headings - max 32 on tablets
          return rawScaled.clamp(20.0, 32.0);
        }
      },
      designSize: const Size(375, 812),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (context) =>
                SettingsCubit(getIt.get<SettingsRepoImpl>())..fetchSettings(),
          ),
          BlocProvider(
            create: (context) =>
                AdsCubit(getIt.get<AdMobService>())..loadInterstitialAd(),
          ),
          BlocProvider(
            create: (context) =>
                HomeCubit(getIt.get<HomeRepoImpl>())..homeFetchData(),
          ),
        ],
        child: MaterialApp(
          title: 'Cardy',
          darkTheme: AppTheme.appTheme,
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1),
              ),
              child: widget!,
            );
          },
        ),
      ),
    );
  }
}
