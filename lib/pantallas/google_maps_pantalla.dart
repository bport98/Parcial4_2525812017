import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsPantalla extends StatefulWidget {
  @override
  _GoogleMapsPantallaState createState() => _GoogleMapsPantallaState();
}

class _GoogleMapsPantallaState extends State<GoogleMapsPantalla> {
  Set<Marker> _markers = {};

  void _OnMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(13.9038459, -89.507289),
          infoWindow: InfoWindow(
            title: 'Sucursal El Congo',
            snippet:
                'La organización Domicilios SV provee un sistema que permite a otras empresas almacenar los sitios Web para susnegocios',
          )));
      _markers.add(Marker(
          markerId: MarkerId('id-2'),
          position: LatLng(13.9866052, -89.686761),
          infoWindow: InfoWindow(
            title: 'Sucursal Chalchuapa',
            snippet:
                'La organización Domicilios SV provee un sistema que permite a otras empresas almacenar los sitios Web para sus negocios',
          )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
      body: Center(
          child: GoogleMap(
              onMapCreated: _OnMapCreated,
              markers: _markers,
              initialCameraPosition: CameraPosition(
                  target: LatLng(13.988420, -89.560251), zoom: 10))),
    );
  }
}
