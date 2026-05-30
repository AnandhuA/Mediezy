import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mediezy/core/utils/permission_helper.dart';

import '../../../core/constants/key.dart';
import '../../../core/utils/shared_pref_fun.dart';

class DashboardProvider extends ChangeNotifier {
  bool isLoading = false;

  String userName = '';
  String currentLocation = 'Fetching location...';

  Future<void> init(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    await _loadUserData();
    await _loadCurrentLocation(context);

    isLoading = false;
    notifyListeners();
  }

  Future<void> _loadUserData() async {
    userName = SharedPref.getString(
      AppKeys.userName,
    );
  }

  Future<void> _loadCurrentLocation(
    BuildContext context,
  ) async {
    try {
      final Position? position =
          await PermissionHelper.getCurrentLocation(
        context,
      );

      if (position == null) {
        currentLocation = "Location unavailable";
        return;
      }

      final placemarks =
          await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;

        currentLocation =
            place.locality ??
            place.subAdministrativeArea ??
            place.administrativeArea ??
            "Unknown Location";
      }
    } catch (e) {
      currentLocation = "Unknown Location";
    }

    notifyListeners();
  }
}