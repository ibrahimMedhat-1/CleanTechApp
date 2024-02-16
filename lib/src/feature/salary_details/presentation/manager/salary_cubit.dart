import 'package:ct_clean/src/core/config/routes/app_imports.dart';

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

  int? selectedYear;

  void yearOnChange(int? year) {
    params = params.copyWith(year: year);
    if (year == DateTime.now().year) {
      selectedMonth = DateTime.now().month -1;
    }
    selectedYear = year;
    getSalaryDetails();
  }

  List<int>? listMonths;

  List<int> get getListMonthByCurrentYear {
    if (selectedYear == null) return [];
    if (selectedYear == DateTime.now().year) {
      return List.generate(DateTime.now().month - 1, (index) => index + 1);
    } else {
      return List.generate(12, (index) => index + 1);
    }
  }

  int? selectedMonth;

  void monthOnChange(int? month) {
    params = params.copyWith(month: month);
    selectedMonth = month;
    getSalaryDetails();
  }
}
