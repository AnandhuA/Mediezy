import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  PermissionHelper._();

  // ================= LOCATION =================

  static Future<bool> handleLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check location service
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled && context.mounted) {
      _showSnackBar(context, "Location service is disabled. Please enable it.");

      await Geolocator.openLocationSettings();
      return false;
    }

    // Check permission
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied && context.mounted) {
        _showSnackBar(context, "Location permission denied");
        return false;
      }
    }

    // Permanently denied
    if (permission == LocationPermission.deniedForever && context.mounted) {
      _showPermissionDialog(
        context,
        title: "Location Permission Required",
        message:
            "Location permission is permanently denied. Please enable it from app settings.",
      );

      return false;
    }

    return true;
  }

  // ================= CAMERA =================

  static Future<bool> handleCameraPermission(BuildContext context) async {
    PermissionStatus status = await Permission.camera.status;

    if (status.isGranted) {
      return true;
    }

    if (status.isDenied) {
      status = await Permission.camera.request();

      if (status.isGranted) {
        return true;
      }
    }

    if (status.isPermanentlyDenied && context.mounted) {
      _showPermissionDialog(
        context,
        title: "Camera Permission Required",
        message:
            "Camera permission is permanently denied. Please enable it from app settings.",
      );
    }

    return false;
  }

  // ================= STORAGE =================

  static Future<bool> handleStoragePermission(BuildContext context) async {
    PermissionStatus status;

    if (Platform.isAndroid) {
      status = await Permission.storage.request();
    } else {
      status = await Permission.photos.request();
    }

    if (status.isGranted) {
      return true;
    }

    if (status.isPermanentlyDenied && context.mounted) {
      _showPermissionDialog(
        context,
        title: "Storage Permission Required",
        message:
            "Storage permission is permanently denied. Please enable it from settings.",
      );
    }

    return false;
  }

  // ================= CURRENT LOCATION =================

  static Future<Position?> getCurrentLocation(BuildContext context) async {
    final hasPermission = await handleLocationPermission(context);

    if (!hasPermission) {
      return null;
    }

    try {
      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
    } catch (e) {
      if (context.mounted) {
        _showSnackBar(context, "Failed to get current location");
      }

      return null;
    }
  }

  // ================= COMMON UI =================

  static void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  static void _showPermissionDialog(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
                await openAppSettings();
              },
              child: const Text("Open Settings"),
            ),
          ],
        );
      },
    );
  }
}
