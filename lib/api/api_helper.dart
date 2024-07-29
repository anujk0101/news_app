import 'dart:convert';

import 'package:http/http.dart' as httpClient;

class ApiHelper{

 Future<dynamic> getAPI({required String url}) async{
    var uri=Uri.parse(url);
    var res= await httpClient.get(uri);

    if(res.statusCode==200){
      var mData=jsonDecode(res.body);
      return mData;
    }
    else{
      return null;
    }

  }
}