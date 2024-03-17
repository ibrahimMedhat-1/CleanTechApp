import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_devastation_state.dart';

class HomeDevastationCubit extends Cubit<HomeDevastationState> {
  HomeDevastationCubit() : super(HomeDevastationInitial());
}
