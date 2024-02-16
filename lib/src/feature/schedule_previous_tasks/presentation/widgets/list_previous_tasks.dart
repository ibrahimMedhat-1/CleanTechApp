import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/widgets/loading.dart';

class ListPreviousTasks extends StatelessWidget {
  const ListPreviousTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OldMissionCubit, OldMissionState>(
      builder: (context, state) {
        var model = context.read<OldMissionCubit>().oldMissionModel;
        List<Missions> list = model == null ? <Missions>[] : model.missions ?? <Missions>[];
        return model == null
            ? const SizedBox.shrink()
            : Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                  itemBuilder: (context, index) {
                    var item = list[index];
                    return PreviousTaskItem(item: item);
                  },
                ),
              );
      },
    );
  }
}
