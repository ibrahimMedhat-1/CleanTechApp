 import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/feature/salary_details/logic/data/salary_details_repo.dart';
part 'salary_state.dart';

class SalaryCubit extends Cubit<SalaryState> {
  SalaryCubit(this.repo) : super(SalaryInitial());
  SalaryDetailsRepo repo;

  SalaryDetailsParams params = SalaryDetailsParams();
  SalaryDetailsModel? salaryDetailsModel;

  void getSalaryDetails() async {
    emit(SalaryLoading());
    final result = await repo.getSalaryDetails(params);
    result.fold((l) => emit(SalaryFailure(l.errMessage)), (r) {
      salaryDetailsModel = r;
      emit(SalarySuccess());
    });
  }
void yearOnChange(int? year) {
    params = params.copyWith(year: year);
    getSalaryDetails();
  }

  void monthOnChange(int? month) {
    params = params.copyWith(month: month);
    getSalaryDetails();
  }
}
