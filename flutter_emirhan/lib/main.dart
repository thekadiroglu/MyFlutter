import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // google_maps_flutter paketini içe aktarın
import 'otoparklar.dart'; // otoparklar.dart sayfasını içe aktarın

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ana Sayfa"),
        ),
        body: AnaSayfa(),
      ),
    );
  }
}

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OtoparklarPage(), // Otoparklar sayfası
              ),
            );
          },
          child: Container(
            width: 150,
            height: 200,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("İlk Card"),
              ),
            ),
          ),
        ),
        Container(
          width: 150,
          height: 200,
          child: Card(
            elevation: 5,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(37.7749, -122.4194), // Başlangıç konumu
                zoom: 12, // Yakınlaştırma seviyesi
              ),
              markers: {
                Marker(
                  markerId: MarkerId("marker_1"),
                  position: LatLng(37.7749, -122.4194), // Marker konumu
                  infoWindow: InfoWindow(
                    title: "İkinci Card Harita",
                  ),
                ),
              },
            ),
          ),
        ),
        Container(
          width: 150,
          height: 200,
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Üçüncü Card"),
            ),
          ),
        ),
      ],
    );
  }
}
