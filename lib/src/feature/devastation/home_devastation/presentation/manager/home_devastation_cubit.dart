import 'package:bloc/bloc.dart';
import 'package:ct_clean/src/core/config/routes/app_imports.dart';

part 'home_devastation_state.dart';

class HomeDevastationCubit extends Cubit<HomeDevastationState> {
  HomeDevastationCubit(this.repo) : super(HomeDevastationInitial());
  HomeDevastationRepo repo;
  List<MissionDevastationModel>? listMissions;
  void getDevastationMission() async {
    emit(GetDevastationMissionLoading());
    final result = await repo.getDamarMission();
    result.fold((l) {
      print(l.errMessage);
      emit(GetDevastationMissionFailure());
    }, (r) {
      listMissions = r;
      emit(GetDevastationMissionSuccess());
    });
  }
}
