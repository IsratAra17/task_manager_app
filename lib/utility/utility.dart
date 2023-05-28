
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

String DefaultProfilePic="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHoAAAB6CAMAAABHh7fWAAAAb1BMVEXw7+s9PT06Ojrw7uzw7+k9PTv9+/o9PD47PjtNS0z08+/6+Pc1NTX39fQ7PTwyMjIwMi8qKimBgH6dnJpVVVV4d3VzcnHY2dXDwsFWV1QfIB21tLKurKvq6OaVk5JnZWTS0M+JiYYnJSdeX10UFRP+tMVAAAADLUlEQVRoge2a63aiMBCAISFYJwESrgpEofb9n3EnuNubQrUmuD/yHdvT48F+TjJJZtCAUhoEgflZHaOOomeYJ6JnuZ8W8tMifmLMRv2U7PZ4PB6Px+PxeDyeG4GExxwfACu3L0ky9FW53e6rfkiSFcWg+1IoKQghUsmy17CaeVcqwpBwk74gqtwl6ww6HFqyCT9D2sMqgw61Ci9Q1QpjDpXCkNNvaqYq52POixZN6Xd1GLaF4zGHQV6O9hkxuA07qbNZdc1dmheCDkM5uEw1Pko2rx5dqhNG5tWMOVRDk20282rZuEs06OSCOpQ7d+sLesUuV/Q7qnOqvtjHPqt7p+or+9g66m4xaqdzPSj2Mmt2muFBIJbUzGWVFldyXi0ql5s47BbU2Q5c3tdP9mTOTEq3B3ayu1IdnVGY3w7nOgogn3Gr3Olwm89oaCmuLW2xd+k9A3p7pVzItpq6L8WpPl2MuTpqpxM9AUApPZAvFVomDtjzgeOwQWOPQ/mQCyWmZUbwj7xBM99h4A4TLe5JW8Q0oLHuatYirOo0x4DjoiVd7EwM9PRKiCrRFQHwGFcTxKa/pnGzV4y1J+qoOksGJRie16IdG54YySTCN9GMLTHHh8jctJxYJxDseMyilqTuGp3EMedJ0HRHhjv7BntexpxUC1CocBNiNx1O8Sm5P1bjWB332asw+bbBbht/vxbWx5wXyvzvc9Smq0+JMJD34+SsDlXB7Y65KQjni/+v20tv1Q3DGxbgJtifSd9s9l6gFbldnSqLt3WgFtNM3oioraU5dK83RnyGtZ2tsPWW3KcmeIRaMZsVfSfKzo0VaoK+E0thm5leaneuh22j6aTxidxtDsnRQjtANUuX2ssZNdOPq6GTd4sRaWF9JeNCrzNPNj5+cuNU376iPxDH+GE1D3+lJow//n2y7I597BMSHlbrhfuDC6Ty8U1FZ79JcCvqqM0Q8RfyA9NF5gWZenwnheJwGMe8quojcionthfgk6eTuaKu8jwfDwcb5SFgoY3EF3B+/fmpRk4sFeQ0ivBhvu36L2mvtXbTFR+vWaHp9Xg8Ho/H4/F4PB6P5z/hDz/oMLLGgwPIAAAAAElFTkSuQmCC";

Future<void> WriteUserData(UserData) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', UserData['token']);
  await prefs.setString('email', UserData['data']['email']);
  await prefs.setString('firstName', UserData['data']['firstName']);
  await prefs.setString('lastName',UserData['data']['lastName']);
  await prefs.setString('mobile', UserData['data']['mobile']);
  await prefs.setString('photo', UserData['data']['photo']);
}
Future<void>WriteEmailVerification(Email)async{
  final prefs=await SharedPreferences.getInstance();
  await prefs.setString('EmailVerification', Email);
}
Future<void>WriteOTPVerification(OTP)async{
  final prefs=await SharedPreferences.getInstance();
  await prefs.setString('OTPVerification',OTP);
}
Future<String?> ReadUserData(Key) async {
  final prefs = await SharedPreferences.getInstance();
  String? mydata= await prefs.getString(Key);
  return mydata;
}
ShowBase64Image(Base64String){
  UriData? data= Uri.parse(Base64String).data;
  Uint8List MyImage= data!.contentAsBytes();
  return MyImage;
}

Future<bool>RemoveToken() async {
  final prefs = await SharedPreferences.getInstance();
await prefs.remove('token');
return true;
}