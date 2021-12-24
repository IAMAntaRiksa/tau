import 'package:crud_api_with_bloc/data/model/list_model_person.dart';
import 'package:dio/dio.dart';

const String _baseURL = 'https://reqres.in/api';

class ApiClientResponse {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseURL,
      connectTimeout: 40000,
      sendTimeout: 40000,
    ),
  );

  Future<ListModelPerson?> fetchData({int page = 0, int perPage = 8}) async {
    try {
      Response response = await _dio
          .get('/users?page=$page&per_page=$perPage', queryParameters: {
        'page': page,
        'per_page': perPage,
      });

      if (response.statusCode == 200) {
        ListModelPerson data = ListModelPerson.fromJson(response.data);
        return data;
      }
    } on DioError catch (e) {
      e.toString();
    }
  }

  // Future<ListModelPerson> addData({int? id}) async {
  //   ListModelPerson? fPerson;
  //   try {
  //     Response response = await _dio.post('/posts/1', data: {});

  //     ListModelPerson fData = ListModelPerson.fromJson(response.data);
  //     if (response.statusCode == 200) {
  //       return fPerson = fData;
  //     }
  //   } on DioError catch (e) {
  //     e.toString();
  //   }
  //   return fPerson!;
  // }
}
