import 'package:car_app_real/providers/CarInfoProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdvancedSstats extends StatefulWidget {
  const AdvancedSstats({super.key});

  @override
  State<AdvancedSstats> createState() => _AdvancedSstatsState();
}

class _AdvancedSstatsState extends State<AdvancedSstats> {
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
              Expanded(child: _buildInfoCard("Total vægt", carInfo.totalVaegt.toString())),
              const SizedBox(width: 10),
              Expanded(child: _buildInfoCard("Brandstof", carInfo.drivkraftTypeNavn)),
            ],
          ),
          ...carInfo.udstyrliste.map((detail) => _buildInfoCard(detail,"")).toList(),
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