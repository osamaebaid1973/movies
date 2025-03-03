import 'package:http/http.dart' as http;
import 'package:movies/core/constants/app_constants.dart';
class ApiHelper{
  static Future<http.Response> getRequest(String endPoint,{Map<String,String>? query})async{
    Uri url = Uri.https(AppConstants.BASE_URL,endPoint,query);
    var response = await http.get(url,headers:{"Authorization":"Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNTY5NGY4ZDdiYjkwZDI5MTNiZmNhYWEwODk5Yzc4MSIsIm5iZiI6MTczODc0Nzg5Ny4xODUsInN1YiI6IjY3YTMyZmY5ZGMyNGVlOTNkMTgxMTQ0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GaZ3lxtZ0DbPWg2mr5RrPvFZ9IyaQfwidPBUCe_HsO4"});
    return response;
  }
  static Future<http.Response> postRequest(String endPoint,Object? body)async{
    Uri url = Uri.https(AppConstants.BASE_URL,endPoint);
    var response = await http.post(url,body:body);
    return response;
  }
}