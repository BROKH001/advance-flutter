
class APIConstrain {
  static const String tSecretAPIKey = "http://10.0.2.2:8000/api/";
}

class AuthEndPoints {
  static const String tLogin = "login";
  static const String tRegister = "register";
  static const String tLogout = "logout";

  static const String tUser = "user";
  static const String tUserProfile = "user/profile";

  static const String tProducts = "products";
  static const String tCategories = "categories";
  static const String tDiscount = "discount";

  static const String tCart = "cart";
  static const String tCartItems = "/items";
  static const String tCartAddItem = "/add";
  static const String tCartUpdate = "/update{id}";
  static const String tCartDelete = "/remove/{id}";
}
