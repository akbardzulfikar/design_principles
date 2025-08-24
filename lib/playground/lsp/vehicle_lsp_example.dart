import 'package:flutter/material.dart';

/// Base contract for all vehicles
abstract class Vehicle {
  String get name;
  String startEngine();
  String accelerate();
  String brake();
}

/// Electric vehicle implementation
class ElectricCar implements Vehicle {
  @override
  String get name => "Electric Car";

  @override
  String startEngine() => "Electric motor started silently";

  @override
  String accelerate() => "Accelerating smoothly with electric power";

  @override
  String brake() => "Regenerative braking engaged";
}

/// Gas vehicle implementation
class GasCar implements Vehicle {
  @override
  String get name => "Gas Car";

  @override
  String startEngine() => "Gas engine started with a roar";

  @override
  String accelerate() => "Accelerating with gas engine power";

  @override
  String brake() => "Traditional brakes applied";
}

/// Hybrid vehicle implementation
class HybridCar implements Vehicle {
  @override
  String get name => "Hybrid Car";

  @override
  String startEngine() => "Hybrid system activated";

  @override
  String accelerate() => "Accelerating with hybrid power";

  @override
  String brake() => "Hybrid braking system engaged";
}

/// Widget demonstrating good LSP
class VehicleLspGood extends StatelessWidget {
  const VehicleLspGood({super.key});

  void _testVehicle(BuildContext context, Vehicle vehicle) {
    // All vehicles can be used interchangeably without issues
    final results = [
      "${vehicle.name}: ${vehicle.startEngine()}",
      "${vehicle.name}: ${vehicle.accelerate()}",
      "${vehicle.name}: ${vehicle.brake()}",
    ];

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Testing ${vehicle.name}"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: results.map((result) => Text("• $result")).toList(),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LSP Good Example - Vehicles")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "✅ Good LSP: All vehicles behave consistently",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _testVehicle(context, ElectricCar()),
            child: const Text("Test Electric Car"),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => _testVehicle(context, GasCar()),
            child: const Text("Test Gas Car"),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => _testVehicle(context, HybridCar()),
            child: const Text("Test Hybrid Car"),
          ),
        ],
      ),
    );
  }
}
