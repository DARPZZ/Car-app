import 'package:car_app_real/providers/CarInfoProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Udstyrwidget extends StatefulWidget {
  const Udstyrwidget({super.key});

  @override
  State<Udstyrwidget> createState() => _UdstyrwidgetState();
}

class _UdstyrwidgetState extends State<Udstyrwidget> {
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
            "Udstyr i bilen",
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
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
