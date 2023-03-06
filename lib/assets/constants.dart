abstract class Constants {
  static String basicImageUrl = 'lib/assets/images';
  static String splashIMG = '$basicImageUrl/logo.jpeg';
  static String loginIMG = '$basicImageUrl/login.jpeg';
  static String registerIMG = '$basicImageUrl/register.jpeg';
  static String companyIMG = '$basicImageUrl/company.jpeg';
  static String walletIMG = '$basicImageUrl/wallet.jpeg';
  static String buildingIMG = '$basicImageUrl/building.jpeg';

  static String userIdKey = 'id';

  //API
  static String baseAPIurl =
      'https://qaym-3kark2-ziadsindion.pythonanywhere.com/api/users';
  static String loginAPIurl = '$baseAPIurl/login/';
  static String registerAPIurl = '$baseAPIurl/register/';
  static String logoutAPIurl = '$baseAPIurl/logout/';
}
