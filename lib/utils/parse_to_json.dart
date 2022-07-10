import '../models/Departments.dart';

List parseJsonData(List responseBody, String type, [String? scope]) {
  final response;
  final response1 = [];
  switch (type) {
    case 'departments':
      response =
          responseBody.map((json) => Departments.fromJson(json)).toList();
      break;

    default:
      response = [];
      break;
  }
  return response;
}
