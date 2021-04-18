class Converter {
  String measurementUnit;
  double rawLrv;
  String pressureUnit;

  // ignore: non_constant_identifier_names
  Converter({this.measurementUnit, this.pressureUnit, this.rawLrv});

  String convert() {
    String calculatedLRVValue;

    switch (measurementUnit) {
      case "in":
        switch (pressureUnit) {
          case "bar":
            calculatedLRVValue = (rawLrv * 0.00249082).toStringAsFixed(3);

            break;
          case "mmH20":
            calculatedLRVValue = (rawLrv * 25.3999998).toStringAsFixed(3);

            break;
          case "psi":
            calculatedLRVValue = (rawLrv * 0.036126).toStringAsFixed(3);

            break;
          case "kPa":
            calculatedLRVValue = (rawLrv * 0.249089).toStringAsFixed(3);

            break;
          case "MPa":
            calculatedLRVValue = (rawLrv * 0.000249089).toStringAsFixed(3);

            break;

          case "mbar":
            calculatedLRVValue = (rawLrv * 2.4908).toStringAsFixed(3);

            break;
          case "inH20":
            calculatedLRVValue = (rawLrv * 1000.0).toStringAsFixed(3);

            break;

          case "kg/cm2":
            calculatedLRVValue = (rawLrv * 0.00254).toStringAsFixed(3);

            break;
        }
        break;

      case "cm":
        switch (pressureUnit) {
          case "bar":
            calculatedLRVValue = (rawLrv * 0.000980665).toStringAsFixed(3);

            break;
          case "mmH20":
            calculatedLRVValue = (rawLrv * 10).toStringAsFixed(3);

            break;
          case "psi":
            calculatedLRVValue = (rawLrv * 0.0142233).toStringAsFixed(3);

            break;
          case "kPa":
            calculatedLRVValue = (rawLrv * 0.0980665).toStringAsFixed(3);

            break;
          case "MPa":
            calculatedLRVValue = (rawLrv * 0.0000980665).toStringAsFixed(3);

            break;

          case "mbar":
            calculatedLRVValue = (rawLrv * 0.980665).toStringAsFixed(3);

            break;
          case "inH20":
            calculatedLRVValue = (rawLrv * 0.393701).toStringAsFixed(3);

            break;

          case "kg/cm2":
            calculatedLRVValue = (rawLrv * 0.001).toStringAsFixed(3);
            break;
        }
        break;

      case "mm":
        switch (pressureUnit) {
          case "bar":
            calculatedLRVValue = (rawLrv * 0.0000980665).toStringAsFixed(3);
            break;

          case "mmH20":
            calculatedLRVValue = (rawLrv * 1).toStringAsFixed(3);
            break;
          case "psi":
            calculatedLRVValue = (rawLrv * 0.00142233).toStringAsFixed(3);

            break;
          case "kPa":
            calculatedLRVValue = (rawLrv * 0.00980665).toStringAsFixed(3);
            break;
          case "MPa":
            calculatedLRVValue = (rawLrv * 0.00000980665).toStringAsFixed(3);

            break;

          case "mbar":
            calculatedLRVValue = (rawLrv * 0.0980665).toStringAsFixed(3);

            break;
          case "inH20":
            calculatedLRVValue = (rawLrv * 0.0393701).toStringAsFixed(3);
            break;

          case "kg/cm2":
            calculatedLRVValue = (rawLrv * 0.0001).toStringAsFixed(3);

            break;
        }
        break;

      case "ft":
        switch (pressureUnit) {
          case "bar":
            calculatedLRVValue = (rawLrv * 0.0298906692).toStringAsFixed(3);

            break;
          case "mmH20":
            calculatedLRVValue = (rawLrv * 304.8).toStringAsFixed(3);

            break;
          case "psi":
            calculatedLRVValue = (rawLrv * 0.433527504).toStringAsFixed(3);

            break;
          case "kPa":
            calculatedLRVValue = (rawLrv * 2.98906692).toStringAsFixed(3);

            break;
          case "MPa":
            calculatedLRVValue = (rawLrv * 0.00298906692).toStringAsFixed(3);

            break;

          case "mbar":
            calculatedLRVValue = (rawLrv * 29.8906692).toStringAsFixed(3);

            break;
          case "inH20":
            calculatedLRVValue = (rawLrv * 12).toStringAsFixed(3);

            break;

          case "kg/cm2":
            calculatedLRVValue = (rawLrv * 0.03048).toStringAsFixed(3);
            break;
        }
        break;

      case "m":
        switch (pressureUnit) {
          case "bar":
            calculatedLRVValue = (rawLrv * 0.0980665).toStringAsFixed(3);

            break;
          case "mmH20":
            calculatedLRVValue = (rawLrv * 1000).toStringAsFixed(3);

            break;
          case "psi":
            calculatedLRVValue = (rawLrv * 1.42233433).toStringAsFixed(3);

            break;
          case "kPa":
            calculatedLRVValue = (rawLrv * 9.80665).toStringAsFixed(3);

            break;
          case "MPa":
            calculatedLRVValue = (rawLrv * 0.00980665).toStringAsFixed(3);

            break;

          case "mbar":
            calculatedLRVValue = (rawLrv * 98.0665).toStringAsFixed(3);

            break;
          case "inH20":
            calculatedLRVValue = (rawLrv * 39.3700787).toStringAsFixed(3);

            break;

          case "kg/cm2":
            calculatedLRVValue = (rawLrv * 0.1).toStringAsFixed(3);

            break;
        }
        break;
    }
    return calculatedLRVValue;
  }
}
