import 'package:flutter/material.dart';

/// Base contract that makes assumptions
abstract class BadVehicle {
  String get name;
  void startEngine(); // Assumes all vehicles have engines that can be started
  void refuel(); // Assumes all vehicles need fuel
  int getFuelLevel(); // Assumes all vehicles have fuel
}

/// Gas car works fine with the contract
class BadGasCar implements BadVehicle {
  int _fuelLevel = 80;

  @override
  String get name => "Gas Car";

  @override
  void startEngine() {
    debugPrint("Gas engine started!");
  }

  @override
  void refuel() {
    _fuelLevel = 100;
    debugPrint("Gas tank refueled to 100%");
  }

  @override
  int getFuelLevel() => _fuelLevel;
}

/// Electric car violates LSP - doesn't fit the contract properly
class BadElectricCar implements BadVehicle {
  int _batteryLevel = 75;

  @override
  String get name => "Electric Car";

  @override
  void startEngine() {
    // Electric cars don't have traditional engines!
    throw UnsupportedError("Electric cars don't have engines to start!");
  }

  @override
  void refuel() {
    // Electric cars don't use fuel!
    throw UnsupportedError(
      "Electric cars don't use fuel - they need charging!",
    );
  }

  @override
  int getFuelLevel() {
    // Electric cars don't have fuel!
    throw UnsupportedError(
      "Electric cars don't have fuel - check battery instead!",
    );
  }
}

/// Bicycle violates LSP even more severely
class BadBicycle implements BadVehicle {
  @override
  String get name => "Bicycle";

  @override
  void startEngine() {
    throw UnsupportedError("Bicycles don't have engines!");
  }

  @override
  void refuel() {
    throw UnsupportedError("Bicycles don't need fuel!");
  }

  @override
  int getFuelLevel() {
    throw UnsupportedError("Bicycles don't have fuel!");
  }
}

/// Widget demonstrating LSP violation
class VehicleLspBad extends StatelessWidget {
  const VehicleLspBad({super.key});

  void _testVehicle(BuildContext context, BadVehicle vehicle) {
    try {
      // This will crash for electric cars and bicycles!
      vehicle.startEngine();
      vehicle.refuel();
      final fuelLevel = vehicle.getFuelLevel();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "${vehicle.name} tested successfully! Fuel: $fuelLevel%",
          ),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("❌ ${vehicle.name} failed: ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LSP Bad Example - Vehicles")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "🚨 Bad LSP: Subclasses break the contract",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "The base class assumes all vehicles have engines and use fuel, but electric cars and bicycles don't fit this assumption.",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _testVehicle(context, BadGasCar()),
            child: const Text("Test Gas Car (Will Work)"),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => _testVehicle(context, BadElectricCar()),
            child: const Text("Test Electric Car (Will Crash)"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => _testVehicle(context, BadBicycle()),
            child: const Text("Test Bicycle (Will Crash)"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          ),
        ],
      ),
    );
  }
}
