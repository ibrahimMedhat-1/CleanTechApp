import 'dart:math';

import 'package:ct_clean/main.dart';
import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  List<Widget> screens = [
    HomeScreen(),
    MessageScreen(),
    CustomerScreen(),
  ];

  final homeCubit = sl<HomeCubit>();
  final fcm = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    LocationHelper().isLocationEnabled();
    LocationHelper().getPermissionLocation();
    homeCubit.changeIndex(0);
    homeCubit.getMissionsList();
    mainDriverId = UserLocal.driverId;
    fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    fcm.getNotificationSettings();
    fcm.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showLocalNotification();
    });
  }

  int rndmIndex = Random().nextInt(100);

  void showLocalNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      '$rndmIndex.0',
      "AhmedApp",
      channelDescription: "Clean Tech",
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
      rndmIndex,
      'Clean Tech',
      "Clean Tech",
      notificationDetails,
      payload: 'item x',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeCubit,
      child: MyScaffold(
        appBar: AppBar(
          title: BlocBuilder(
            bloc: homeCubit,
            builder: (context, state) {
              String title = homeCubit.currentIndex == 0
                  ? AppStrings.home.tr(context)
                  : homeCubit.currentIndex == 1
                      ? AppStrings.contactTheAdministration.tr(context)
                      : AppStrings.personalScreen.tr(context);

              return Text(
                title,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              );
            },
          ),
          actions: [Assets.svgs.logoWhite.svg(width: 120.w), 15.isWight],
        ),
        body: BlocBuilder(
            bloc: homeCubit,
            builder: (context, state) => screens[homeCubit.currentIndex]),
        bottomNavigationBar: BlocBuilder(
          bloc: homeCubit,
          builder: (context, state) {
            return CurvedNavigationBar(
              backgroundColor: AppColors.white,
              index: homeCubit.currentIndex,
              items: [
                Assets.svgs.home.svg(),
                Padding(
                  padding: EdgeInsets.all(5.w),
                  child: Assets.svgs.message.svg(),
                ),
                Assets.svgs.person.svg()
              ],
              color: AppColors.primary2,
              onTap: homeCubit.changeIndex,
            );
          },
        ),
      ),
    );
  }
}
