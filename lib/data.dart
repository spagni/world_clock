class CitiesData {
  static List<City> cities = [
    City(
      city: 'Buenos Aires',
      continent: 'America',
      country: 'Argentina',
      timeZone: -3,
      iconAsset: 'assets/argentina.png',
    ),
    City(
      city: 'Rome',
      continent: 'Europe',
      country: 'Italy',
      timeZone: 2,
      iconAsset: 'assets/italy.png'
    ),
    City(
      city: 'New York',
      continent: 'America',
      country: 'United States',
      timeZone: -4,
      iconAsset: 'assets/usa.png'
    ),
    City(
      city: 'Düsseldorf',
      continent: 'Europe',
      country: 'Germany',
      timeZone: 2,
      iconAsset: 'assets/germany.png'
    ),
    City(
      city: 'Tokyo',
      continent: 'Asia',
      country: 'Japan',
      timeZone: 9,
      iconAsset: 'assets/japan.png'
    ),
    City(
      city: 'Paris',
      continent: 'Europe',
      country: 'France',
      timeZone: 2,
      iconAsset: 'assets/france.png'
    ),
    City(
      city: 'Miami',
      continent: 'America',
      country: 'United States',
      timeZone: -4,
      iconAsset: 'assets/usa.png'
    ),
  ];
}

class City {
  String city;
  String country;
  String continent;
  int timeZone;
  String iconAsset;

  City({
    this.city,
    this.continent,
    this.country,
    this.timeZone,
    this.iconAsset,
  });
}
