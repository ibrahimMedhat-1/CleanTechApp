import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/feature/salary_details/logic/data/salary_details_repo.dart';
import 'package:dartz/dartz.dart';

class SalaryDetailsRepoImpl extends SalaryDetailsRepo {
  final ApiService apiService;

  SalaryDetailsRepoImpl(this.apiService);

  @override
  Future<Either<Failures, SalaryDetailsModel>> getSalaryDetails(SalaryDetailsParams params)async {
    try {
      final response =await apiService.getData(url: EndPoint.salary,query: params.toMap());
      if(response.statusCode == 200|| response.statusCode == 201){
        final data = SalaryDetailsModel.fromJson(response.data);
        return Right(data);
      }else{
        return Left(ServerFailure("Error in fetching data"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

 
}
 