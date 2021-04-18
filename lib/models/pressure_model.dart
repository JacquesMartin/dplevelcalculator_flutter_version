class Pressure {
  final String imageUrl;
  final String name;
  final String category;
  final String description;

  Pressure({this.imageUrl, this.name, this.category, this.description});
}

final List<Pressure> pressures = [
  Pressure(
      imageUrl: 'assets/backgrounds/images/0.webp',
      name: 'Closed Tank Capillary Two Seal',
      category: 'Closed Tank',
      description:
          '''One of the most common and less maintenance type of level measurement.This is used on a pressurized tank wherein the tap to tap distance is the reference for pressure reading.The location of the transmitter in this case does not affect the reading.
'''),
  Pressure(
      imageUrl: 'assets/backgrounds/images/1.webp',
      name: 'Closed Tank Impulse Wet Leg',
      category: 'Closed Tank',
      description:
          '''Wet Leg implies that the LP impulse leg(or Reference Leg) is constantly filled with a medium at fixed level.This in turn becomes the reference pressure of the transmitter.This is the most common type of level measurement we can find in the industry. The reference point for measurement is the HP tapping point on the tank.
'''),
  Pressure(
      imageUrl: 'assets/backgrounds/images/2.webp',
      name: 'Impulse Dry Leg',
      category: 'Closed Tank',
      description:
          '''This type of level measurement utilizes an empty impulse leg connectec with the LP port of the transmitter.This is used on pressurized tank but poses a problem with technicians to constantly drain the LP leg since condensation due to differing temperature at its leg will cause inaccurate reading.The reference point for measurement is the HP tapping point on the tank.
'''),
  Pressure(
      imageUrl: 'assets/backgrounds/images/3.webp',
      name: 'Capillary Interface',
      category: 'Closed Tank',
      description:
          '''When a higher density medium is mixed with a lower density medium, the lower density float above the higher density creating an interface between them. This system normally have two drain lines, one above to drain the upper medium(overflow line) and one at the bottom to drain the higher density medium.This setting ensures that the tank will have constant level at all times with a mixture of both differing densities.The goal of this system is separation of two medium and that system will ensure that the higher density medium will not flow out to the overflow.The level being measured by the DP transmitter is of the one medium only(normally the higher density) and DCS will translate the level of the other medium. This calculation needs distance from the overflow to the maximum level the system should satisfy.
'''),
  Pressure(
      imageUrl: 'assets/backgrounds/images/4.webp',
      name: 'Impulse Wet Leg',
      category: 'Open Tank',
      description:
          '''This type of open tank level measurement,measures the level of the process directly proportional to its hydrostatic pressure(Specific Gravity of the Process multiplied by its height).This is cost effective and commonly utilized in boiler feed water tank. The measurement formula used in this app is based on Differential Pressure type Transmitter calculation(Differential Pressure = Hp - Lp). It is important to take note that the reference for  measurement is the HP tapping point of the Transmitter on the tank. The LP port of the DP transmitter is vented to air.
'''),
  Pressure(
      imageUrl: 'assets/backgrounds/images/5.webp',
      name: 'Capillary Zero Elevation',
      category: 'Open Tank',
      description:
          '''If the transmitter location is slightly above the HP tapping point,then this is called Zero Elevation.As a result the registered pressure reading at 0% Level or 4Ma will be negative.Still the HP tapping point on the tank is the reference for measurement.

'''),
  Pressure(
      imageUrl: 'assets/backgrounds/images/6.webp',
      name: 'Capillary Zero Suppression',
      category: 'Open Tank',
      description:
          '''If the transmitter location is slightly below the HP tapping point,then this is called Zero Suppression. The HP tapping point on the tank is the reference for measurement.LP port of the DP transmitter is vented to air for open tank configuration.
'''),
  Pressure(
      imageUrl: 'assets/backgrounds/images/7.webp',
      name: 'Bubbler System',
      category: 'Open Tank',
      description:
          '''Bubbler system uses constant supply of air to exit on the tip of the tube creating bubbles.If the level is at full it is harder for the bubbles to exit ,because of the hydrostatic pressure, and thus registering a higher pressure than when the tank is at low level. The tip of the tube submerged on the process is the reference point for measurement.
'''),
];
