import 'package:camera/camera.dart';

class BarcodeScannerStatus {
  final bool isCameraAvailable;
  final String error;
  final String barcode;
  final bool stopedScanner;

  BarcodeScannerStatus({
    this.isCameraAvailable = false,
    this.error = "",
    this.stopedScanner = false,
    this.barcode = "",
  });

  factory BarcodeScannerStatus.available() => BarcodeScannerStatus(
        isCameraAvailable: true,
        stopedScanner: false,
      );

  factory BarcodeScannerStatus.error(String message) =>
      BarcodeScannerStatus(error: message, stopedScanner: true);

  factory BarcodeScannerStatus.barcode(String code) =>
      BarcodeScannerStatus(barcode: code, stopedScanner: true);

  bool get canShowCamera => isCameraAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;

  BarcodeScannerStatus copyWith({
    bool? isCameraAvailable,
    String? error,
    String? barcode,
    bool? stopedScanner,
  }) {
    return BarcodeScannerStatus(
      isCameraAvailable: isCameraAvailable ?? this.isCameraAvailable,
      error: error ?? this.error,
      barcode: barcode ?? this.barcode,
      stopedScanner: stopedScanner ?? this.stopedScanner,
    );
  }
}
