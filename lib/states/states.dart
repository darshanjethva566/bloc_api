import '../model/apimodel.dart';

abstract class AppState{}
class InitState  extends AppState{}
class LoadingState extends AppState{}
class ErrorState extends AppState{}
class DataState extends AppState{
  List<ApiModel> ? data;

  DataState({this.data});
}
