import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({super.key});

  List<Widget> screens = [
HomeScreen(),
    MessageScreen(),
    CustomerScreen(),
  ];
  final homeCubit = sl<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeCubit,
      child: MyScaffold(
        appBar: AppBar(
          title: BlocBuilder(
            bloc: homeCubit,
            builder: (context, state) {
              String title = homeCubit.currentIndex == 1
                  ? AppStrings.contactTheAdministration.tr(context)
                  : AppStrings.home.tr(context);

              return Text(title, style: FontStyles.interSize18_600White);
            },
          ),
          actions: [Assets.images.logoWhite.image(), 15.isWight],
        ),
        body: BlocBuilder(
            bloc: homeCubit,
            builder: (context, state) => screens[homeCubit.currentIndex]),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: AppColors.white,
          index: homeCubit.currentIndex,
          items: [
            Assets.images.home.image(),
            Assets.images.messaging.image(),
            Assets.images.customer.image()
          ],
          color: AppColors.primary2,
          onTap: homeCubit.changeIndex,
        ),
      ),
    );
  }
}
