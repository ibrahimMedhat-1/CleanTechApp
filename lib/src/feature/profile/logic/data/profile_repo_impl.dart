import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/feature/profile/logic/model/contact_model.dart';
import 'package:dartz/dartz.dart';

class ProfileRepoImpl extends ProfileRepo {
  ProfileRepoImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failures, ProfileModel>> getDriverProfile(int driverId) async {
    try {
      final response = await apiService
          .getData(url: EndPoint.profile, query: {'driverId': driverId});
      print(response.data);
      final user = ProfileModel.fromJson(response.data);
      if (user.status == true) {
        return Right(user);
      } else {
        return Left(ServerFailure(user.msg.toString()));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ContactsModel>> getContacts() async {
    try {
      final response = await apiService.getData(url: EndPoint.contacts);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final contacts = ContactsModel.fromJson(response.data);
        return Right(contacts);
      } else {
        return Left(ServerFailure("Server Error in Get Contacts"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
