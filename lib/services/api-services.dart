
///To connect you Backend on LOCAL, put the IPv4 Adress of your Computer here [_PC_HOST]
///And de-comment "static const [_FINAL_API_START_ENDPOINT] = _LOCAL_API_START_ENDPOINT"

abstract class ApiArgs{

  static const PC_HOST = "172.18.71.81";
  static String get base_url => "http://${PC_HOST}:8080";

  static const header = {
    "content-type": "application/json",
    "access-control-allow-origin": "*",
    "vary": "Accept-Encoding"
  };

  static String LEAGUES_ENDPOINT(){
      return "${ApiArgs.base_url}/api/leagues";
  }

  static String LOGIN_ENDPOINT(){
    return "${ApiArgs.base_url}/login";
  }
}

class ApiResponse<T>{
  T data;
  String errorMsg;
  ApiResponse({this.data, this.errorMsg});
}