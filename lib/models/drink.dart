abstract class DrinkModel {
  final String name;
  const DrinkModel(this.name);

  
}

class Shai extends DrinkModel {
  const Shai() : super('Shai');
}

class TurkishCoffee extends DrinkModel {
  const TurkishCoffee() : super('Turkish Coffee');
}

class HibiscusTea extends DrinkModel {
  const HibiscusTea() : super('Hibiscus Tea');
  
}
