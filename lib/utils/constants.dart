abstract class Constants {
  //images
  static String basicImageUrl = 'lib/assets/images';
  static String splashIMG = '$basicImageUrl/logo.jpeg';
  static String loginIMG = '$basicImageUrl/login.jpeg';
  static String registerIMG = '$basicImageUrl/register.jpeg';
  static String companyIMG = '$basicImageUrl/company.jpeg';
  static String walletIMG = '$basicImageUrl/wallet.png';
  static String buildingIMG = '$basicImageUrl/building.jpeg';

  //shared pref
  static String tokensKey = 'tokens';

  //API
  static String baseAPIurl =
      'https://qaym-3kark2-ziadsindion.pythonanywhere.com/api/users';
  static String loginAPIurl = '$baseAPIurl/login/';
  static String registerAPIurl = '$baseAPIurl/register/';
  static String logoutAPIurl = '$baseAPIurl/logout/';
}
