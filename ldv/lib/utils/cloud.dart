import 'package:http/http.dart' as http;
import 'dart:convert';


Future<Map> fetchData(id) async {
  var res =  await http.get('http://carlogauss.ddns.net:5000/relations/root');

  if (res.statusCode == 200){
    Map<String, dynamic> data = jsonDecode(res.body);
    return data;
  }
  else{
    return {"error":404};
  }
}