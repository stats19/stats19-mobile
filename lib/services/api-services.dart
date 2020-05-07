
///To connect you Backend on LOCAL, put the IPv4 Adress of your Computer here [_PC_HOST]
///And de-comment "static const [_FINAL_API_START_ENDPOINT] = _LOCAL_API_START_ENDPOINT"

class ApiArgs{

  static const _PC_HOST = "172.18.71.81";
  static const _LOCAL_API_START_ENDPOINT = "http://${_PC_HOST}:8080";

  static const header = {
    "content-type": "application/json",
    "access-control-allow-origin": "*",
    "vary": "Accept-Encoding"
  };

  static const _FINAL_API_START_ENDPOINT = _LOCAL_API_START_ENDPOINT;

  static String LEAGUES_ENDPOINT(){
      return "${_FINAL_API_START_ENDPOINT}/leagues";
  }
}

class ApiResponse<T>{
  T data;
  String errorMsg;
  ApiResponse({this.data, this.errorMsg});
}