import 'dart:convert';
import 'package:taskmanager/style/style.dart';
import 'package:http/http.dart' as http;

var BaseURL = "https://task.teamrabbil.com/api/v1";
var RequestHeader = {"Content-Type": "application/json"};


Future<bool>LoginRequest(FormValues) async {
  var URL = Uri.parse("${BaseURL}/login");
  var PostBody = json.encode(FormValues);
  var response = await http.post(URL, headers: RequestHeader, body: PostBody);


  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);


  if(ResultCode==200 && ResultBody['status']=='success')
  {
      SuccessToast("Request Success!");

      return true;
  }
  else
  {
      ErrorToast("Request Failed! Try again!!");
      return false;
  }
}

Future<bool>RegisterRequest(FormValues)async{

    var URL=Uri.parse("${BaseURL}/registration");
    var PostBody=json.encode(FormValues);

    var response = await http.post(URL, headers: RequestHeader, body: PostBody);

    var ResultCode =response.statusCode;
    var ResultBody = json.decode(response.body);


    if(ResultCode==200 && ResultBody['status']=='success')
    {
        SuccessToast("Request Success!");

        return true;
    }
    else
    {
        ErrorToast("Request Failed! Try again!!");
        return false;
    }
}

Future<bool>VerifyEmailRequest(Email)async{

    var URL=Uri.parse("${BaseURL}/RecoverVerifyEmail/${Email}");

    var response = await http.get(URL, headers: RequestHeader);

    var ResultCode =response.statusCode;
    var ResultBody = json.decode(response.body);


    if(ResultCode==200 && ResultBody['status']=='success')
    {
        SuccessToast("Request Success!");

        return true;
    }
    else
    {
        ErrorToast("Request Failed! Try again!!");
        return false;
    }
}

