import 'package:bloc/bloc.dart';
import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.repo) : super(ProfileInitial());

  final ProfileRepo repo;
ProfileModel? profileModel;
  void getProfile(int driverId) async {
    emit(GetProfileLoading());
    Either<Failures, ProfileModel> result =
        await repo.getDriverProfile(driverId);
    result.fold(
      (l) {
        print(l.errMessage);
        emit(GetProfileFailure());

      },
      (r) {
        profileModel = r;
        emit(GetProfileSuccess());
      },
    );
  }
}
