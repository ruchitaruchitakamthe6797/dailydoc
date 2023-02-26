class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://dd-chat-0.onrender.com/api/";

  // receiveTimeout
  static const int receiveTimeout = 30000;

  // connectTimeout
  static const int connectionTimeout = 50000;

  // endpoints
  static const String chat_list = baseUrl + "conversations";
   static const String conversations = baseUrl +"conversations/";
   static const String send_message = baseUrl +"conversations/";


}