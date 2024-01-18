import 'package:dio/dio.dart';

import '../model/apimodel.dart';

class ApiService{
 
  Dio dio = Dio();
  Future<List<ApiModel>> apiService()async{
    try{
      final get = await dio.get('https://fakestoreapi.com/products');
      if(get.statusCode==200){
        List<dynamic> jsonList = get.data as List<dynamic>;
        return jsonList.map((json) => ApiModel.fromJson(json)).toList();

     //   return get.data.map((json) => ApiModel.fromJson(json)).toList();

      }
      else{
        throw 'something went wromg';
      }
    }
    catch(e){
      print('Exception in apiservice:${e}');
      throw 'something went wromg';

    }
    finally{
      print('api service function done');
    }
  }
}