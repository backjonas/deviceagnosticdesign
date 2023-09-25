import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  final sum = await SumApi().sum(1, 3);
  print("$sum");
}

class SumApi {
  Future<int> sum(int first, int second) async {
    final data = {"one": first, "two": second};

    final response = await http.post(
      Uri.parse('https://fitech-api.deno.dev/sum-api'),
      body: jsonEncode(data),
    );
    return jsonDecode(response.body)["sum"];
  }
}
