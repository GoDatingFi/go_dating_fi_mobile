class Api {
  // Create instance constructor;
  static Api instance = Api();

  //* Base API URL
  static const baseURL = "https://lifestory.dpotech.vn";

  String getLanguageCollection =
      "$baseURL/msa-localization/odata/Languages?\$filter=isdeleted eq false";
}
