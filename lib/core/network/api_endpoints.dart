class ApiEndpoints {
  static const String baseUrl =
      "https://clothes-server-production.up.railway.app/api/v1";

  static const String register = "$baseUrl/users/register";
  static const String login = "$baseUrl/users/login";
  static const String newArrivals = "/items/new-arrivals";
  static const String cart = "$baseUrl/cart";
  static const String favorite = "$baseUrl/favorites";
  static const String addresses = "$baseUrl/addresses";
  static const String reviews = "$baseUrl/reviews";
  static const String paymentCards = "$baseUrl/payment-cards";
  static const String updateProfile = "$baseUrl/users/updateMe";
  static const String getProfile = "$baseUrl/users/getMe";
  static const String deleteProfile = "$baseUrl/users/deleteMe";
  static const String postOrders = "$baseUrl/orders";
  static const String myOrders = "$baseUrl/orders/my-orders";
  static const String items = "$baseUrl/items";
  static const String changePassword = "$baseUrl/users/changePassword";
}
