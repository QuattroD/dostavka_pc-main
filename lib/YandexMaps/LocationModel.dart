class AppLatLong {
 final double lat;
 final double long;

const AppLatLong({
   required this.lat,
   required this.long,
 });
}

class KazanLocation extends AppLatLong {
 const KazanLocation({
   super.lat = 55.7887,
   super.long = 49.1221,
 });
}