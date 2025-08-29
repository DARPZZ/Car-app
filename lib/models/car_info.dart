// car_info.dart
class CarInfo {
  final String regNr;
  final String status;
  final bool rentedCar;
  final String leasingPeriode;
  final String carNameType;
  final String carModelType;
  final int modelAar;
  final double motorStoerrelse; 
  final double motorHestekraefter; 
  final double motorKmPerLiter;
  final int totalVaegt;
  final String drivkraftTypeNavn;
  final List udstyrliste;
  CarInfo({
    required this.regNr,
    required this.status,
    required this.rentedCar,
    required this.leasingPeriode,
    required this.carNameType,
    required this.carModelType,
    required this.modelAar,
    required this.motorStoerrelse,
    required this.motorHestekraefter,
    required this.motorKmPerLiter,
    required this.totalVaegt,
    required this.drivkraftTypeNavn,
    required this.udstyrliste,
  });

  factory CarInfo.fromJson(Map<String, dynamic> json) {
    return CarInfo(
      regNr: json['regNr'] ?? '',
      status: json['status'] ?? '',
      rentedCar: json['rentedcar'] ?? false,
      leasingPeriode: json['leasingPeriode'] ?? '',
      carNameType: json['car_name_type'] ?? '',
      carModelType: json['car_model_type'] ?? '',
      modelAar: json['modelÅr'] ?? 0,
      motorStoerrelse: (json['motor_størrelse']?? 0),
      motorHestekraefter: (json['motor_hestekræfter']?? 0 ),
      motorKmPerLiter: (json['motorKmPerLiter'] ?? 0),
      totalVaegt: (json['totalVaegt'] ?? 0),
      drivkraftTypeNavn: (json['drivkraftTypeNavn']),
      udstyrliste: (json['udstyr_liste']),

    );
  }
}
