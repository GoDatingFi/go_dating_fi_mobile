class Api {
  // Create instance constructor;
  static Api instance = Api();

  //* Base API URL
  static const baseURL = "https://api.godatingfi.com/v1";

  String login = "$baseURL/auth/login";

  String listImage = "$baseURL/auth/login";

  String getNonce = "$baseURL/get_nonce";

  String verifySignedMessage = "$baseURL/verify_signed_message";
}
