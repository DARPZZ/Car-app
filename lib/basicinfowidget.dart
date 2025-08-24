
import 'package:car_app_real/CarInfoProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasicInfoWidget extends StatelessWidget {
  const BasicInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final carInfo = Provider.of<CarInfoProvider>(context).carInfo;

    if (carInfo == null) {
      return const Scaffold(
        body: Center(child: Text('No car info available')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Info'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.ad_units_outlined), label: "Test"),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("RegNr: ${carInfo.regNr}"),
            Text("Status: ${carInfo.status}"),
            Text("Rented Car: ${carInfo.rentedCar ? 'Yes' : 'No'}"),
            Text("Leasing Period: ${carInfo.leasingPeriode}"),
            Text("Car Name: ${carInfo.carNameType}"),
            Text("Car Model: ${carInfo.carModelType}"),
            Text("Model Year: ${carInfo.modelAar}"),
            Text("Engine Size: ${carInfo.motorStoerrelse} L"),
            Text("Horse Power: ${carInfo.motorHestekraefter} HP"),
            Text("Km per Liter: ${carInfo.motorKmPerLiter}"),
          ],
        ),
      ),
    );
  }
}
