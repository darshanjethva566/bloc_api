

import 'package:prac_demo/service/apiservice.dart';

import '../states/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ApiBloc extends Cubit<AppState>{
  final ApiService apiService = ApiService();
  ApiBloc():super(InitState()){
    fetchData();
  }

  fetchData()async{
    try {
      final data = await apiService.apiService();
       emit(DataState(data: data));
    }
    catch(e){
       emit(ErrorState());

    }
  }

}