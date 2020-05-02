
///To connect you Backend on LOCAL, put the IPv4 Adress of your pc here [PC_HOST]
///And de-comment "static const [FINAL_API_START_ENDPOINT] = LOCAL_API_START_ENDPOINT"

class ApiArgs{

  static const _PC_HOST = "10.130.126.66";
  static const _LOCAL_API_START_ENDPOINT = "http://${_PC_HOST}:8081";

  //networks args with beeceptor mock api exemple
  static const beeceptor_MOCK_API_START_ENDPOINT = "https://api-appmob-test.free.beeceptor.com";

  static const header = {
    "content-type": "application/json",
    "access-control-allow-origin": "*",
    "vary": "Accept-Encoding"
  };

  static const _FINAL_API_START_ENDPOINT = _LOCAL_API_START_ENDPOINT;
  //static const FINAL_API_START_ENDPOINT = beeceptor_MOCK_API_START_ENDPOINT;

  static String LEAGUES_ENDPOINT(){
      return "${_FINAL_API_START_ENDPOINT}/leagues";
  }
}

class ApiResponse<T>{
  T data;
  String errorMsg;
  ApiResponse({this.data, this.errorMsg});
}

