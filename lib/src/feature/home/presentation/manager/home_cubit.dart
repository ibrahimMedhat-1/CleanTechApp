import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  // layout logic
int currentIndex = 0;
void changeIndex(int index){
  currentIndex = index;
  emit(ChangeIndexState());
}



}
