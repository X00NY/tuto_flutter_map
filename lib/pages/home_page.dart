import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          initialRotation: 20,
          initialCenter: LatLng(49.4435694323031, 1.0888363913607035),
          initialZoom: 19,
          minZoom: 19,
          maxZoom: 19,
          interactionOptions: InteractionOptions(
              flags: InteractiveFlag.all & ~InteractiveFlag.rotate),
          cameraConstraint: CameraConstraint.contain(
            bounds: LatLngBounds.fromPoints(
              [
                LatLng(49.44359302853928, 1.0878965018415698),
              ],
            ),
          ),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          MarkerLayer(
            markers: [
              Marker(
                  rotate: true,
                  point: const LatLng(49.4435694323031, 1.0888363913607035),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return const Dialog(
                            child: SizedBox(
                              width: 400,
                              height: 400,
                              child: Center(child: Text("Hello world")),
                            ),
                          );
                        },
                      );
                    },
                    child: const Icon(
                      Icons.pin_drop,
                      size: 40,
                    ),
                  ),
                  alignment: Alignment.center)
            ],
          ),
        ],
      ),
    );
  }
}
