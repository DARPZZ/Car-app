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
          BottomNavigationBarItem(icon: Icon(Icons.ad_units_outlined), label: "Test"),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Car Details",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildInfoCard("RegNr", carInfo.regNr),
            _buildInfoCard("Status", carInfo.status),
            _buildInfoCard("Rented Car", carInfo.rentedCar ? 'Yes' : 'No'),
            _buildInfoCard("Leasing Period", carInfo.leasingPeriode),
            _buildInfoCard("Car Name", carInfo.carNameType),
            _buildInfoCard("Car Model", carInfo.carModelType),
            _buildInfoCard("Model Year", carInfo.modelAar.toString()),
            _buildInfoCard("Engine Size", "${carInfo.motorStoerrelse} L"),
            _buildInfoCard("Horse Power", "${carInfo.motorHestekraefter} HP"),
            _buildInfoCard("Km per Liter", carInfo.motorKmPerLiter.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 2,
      child: ListTile(
        leading: Icon(Icons.directions_car, color: Colors.blueAccent),
        title: Text(title),
        subtitle: Text(value, style: TextStyle(color: Colors.black87)),
      ),
    );
  }
}
