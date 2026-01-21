import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LocationService {
  static Future<String> getCityName() async {
    if (kIsWeb) {
      return await _getCityFromIP();
    }

    try {
      // 1️⃣ Location service
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return await _getCityFromIP();

      // 2️⃣ Permission
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return await _getCityFromIP();
      }

      // 3️⃣ Get coordinates
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      // 4️⃣ Try Geocoding
      try {
        final placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        return placemarks.first.locality ??
            placemarks.first.subAdministrativeArea ??
            await _getCityFromIP();
      } catch (_) {
        // 🔥 Geocoder failed → fallback
        return await _getCityFromIP();
      }
    } catch (_) {
      return await _getCityFromIP();
    }
  }

  /// 🌍 IP-based fallback (VERY reliable)
  static Future<String> _getCityFromIP() async {
    try {
      final response = await http.get(Uri.parse('https://ipapi.co/json/'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['city'] ?? "Nearby";
      }
    } catch (_) {}
    return "Nearby";
  }
}
