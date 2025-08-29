import 'package:car_app_real/providers/CarInfoProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasicInfoWidget extends StatelessWidget {
  const BasicInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final carInfo = Provider.of<CarInfoProvider>(context).carInfo;

    if (carInfo == null) {
      return const Center(child: Text('No car info available'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "Car Details",
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(child: _buildInfoCard("RegNr", carInfo.regNr)),
              const SizedBox(width: 10),
              Expanded(child: _buildInfoCard("Status", carInfo.status)),
            ],
          ),

          Row(
            children: [
              Expanded(child: _buildInfoCard("Rented Car", carInfo.rentedCar ? 'Yes' : 'No')),
              const SizedBox(width: 10),
              Expanded(child: _buildInfoCard("Model Year", carInfo.modelAar.toString())),
            ],
          ),

          _buildInfoCard("Leasing Period", carInfo.leasingPeriode),

          Row(
            children: [
              Expanded(child: _buildInfoCard("Car Name", carInfo.carNameType)),
              const SizedBox(width: 10),
              Expanded(child: _buildInfoCard("Car Model", carInfo.carModelType)),
            ],
          ),

          Row(
            children: [
              Expanded(child: _buildInfoCard("Engine Size", "${carInfo.motorStoerrelse} L")),
              const SizedBox(width: 10),
              Expanded(child: _buildInfoCard("Km per Liter", carInfo.motorKmPerLiter.toString())),
            ],
          ),
          _buildInfoCard("Horse Power", "${carInfo.motorHestekraefter} HP"),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 2,
      child: ListTile(
        leading: const Icon(Icons.directions_car, color: Colors.blueAccent),
        title: Text(title),
        subtitle: Text(value, style: const TextStyle(color: Colors.black87)),
      ),
    );
  }
}
