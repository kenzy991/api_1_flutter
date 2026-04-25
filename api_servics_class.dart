import 'package:dio/dio.dart';
import 'api_model.dart';

class ApiServicsClass {
  final dio = Dio();

  List<ApiModel> posts = [];

Future<void> getPosts() async {
      Response response = await dio.get('https://jsonplaceholder.typicode.com/posts');

      List data = response.data;
      posts = data.map((e) => ApiModel.fromJson(e)).toList();
  }
}
