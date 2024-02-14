import 'package:bloc/bloc.dart';
import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/feature/home/logic/data/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  HomeRepo homeRepo;

  // layout logic
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }

  List<MissionModel>? missionsList;

  void getMissionsList() async {
    emit(GetMissionsListLoading());
    Either<Failures, List<MissionModel>> result =
        await homeRepo.getMissionsList();
    result.fold((l) {
      emit(GetMissionsListFailure(l.errMessage));
    }, (r) {
      missionsList = r;
      emit(GetMissionsListSuccess());
    });
  }
}
