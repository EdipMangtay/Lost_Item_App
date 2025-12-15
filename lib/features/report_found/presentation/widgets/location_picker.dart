import 'package:flutter/material.dart';
import 'package:campus_lost_found/core/constants/locations.dart';

class LocationPicker extends StatelessWidget {
  final String? selectedLocation;
  final ValueChanged<String?> onLocationSelected;

  const LocationPicker({
    super.key,
    this.selectedLocation,
    required this.onLocationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: selectedLocation,
      decoration: const InputDecoration(
        labelText: 'Found Location',
        hintText: 'Select where the item was found',
      ),
      items: CampusLocations.all.map((location) {
        return DropdownMenuItem(
          value: location,
          child: Text(location),
        );
      }).toList(),
      onChanged: onLocationSelected,
      validator: (value) => value == null ? 'Please select a location' : null,
    );
  }
}

