import 'package:http/http.dart';

import '../Model/model.dart';

class ApiService {}

Future<List<Model>> getData() async {
  final response =
      await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  // final response =
  //     await http.get(Uri.parse('http://192.168.29.75:5001/api/contacts'));

  if (response.statusCode == 200) {
    var contact = modelFromJson(response.body);

    return contact;
  } else {
    return [];
  }
}
