const GOOGLE_KEY_API = "AIzaSyDaglcI5rA9QnA1_hneh4Ab4_n3abLS8w4";

class LocationUtils {
  static String generateImagePreview({
    double longitude = 0,
    double latitude = 0,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_KEY_API';
  }
}
