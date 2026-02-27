import 'dart:convert';
import 'package:crm_app/features/view-only/dummyApi_model.dart';
import 'package:http/http.dart' as http;

class CompanyDatasource {
  static Future<Company?> fetchRandomCompany() async {
    try {
      final response = await http.get(
        Uri.parse('https://fakerapi.it/api/v1/companies?_quantity=1'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final companyJson = data['data'][0];
        return Company.fromJson(companyJson);
      } else {
        print('Failed to load company: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching company: $e');
      return null;
    }
  }
}
