import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget(
      {super.key,
      required this.tabs,
      required this.onTap,
      required this.tapBarIndex,
      this.listViewWidth});

  final List<String> tabs;
  final Function(int index) onTap;
  final int tapBarIndex;
  final double? listViewWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      width: listViewWidth ?? double.infinity,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                onTap(index);
              },
              child: TabBarItem(
                  text: tabs[index],
                  isThisItemChoosen: tapBarIndex == index ? true : false)),
          separatorBuilder: (context, index) => SizedBox(width: 8.w),
          itemCount: tabs.length),
    );
  }
}

class TabBarItem extends StatelessWidget {
  const TabBarItem(
      {super.key, required this.text, required this.isThisItemChoosen});

  final String text;
  final bool isThisItemChoosen;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
      height: 32.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isThisItemChoosen ? AppColors.primary : AppColors.black),
      child: Text(
        text,
        // style: FontStyles.styleMedium14.copyWith(
        //     color: isThisItemChoosen
        //         ? AppColors.white
        //         : AppColors.black,
        // ),
      ),
    );
  }
}
