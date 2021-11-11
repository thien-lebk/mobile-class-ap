abstract class DataUtils {
  static String getUserImage(String username) {
    return _getImageUrl(username);
  }

  static String getChannelImage() => _getImageUrl("");

  static String _getImageUrl(String value) =>
      "https://images.pexels.com/photos/7543203/pexels-photo-7543203.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
}
