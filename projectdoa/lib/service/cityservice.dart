class CityItem {
  final String city;
  final String country;

  CityItem({
    required this.city,
    required this.country,
  });
}

class CityService {
  static List<CityItem> cities = [
    // Indonesia
    CityItem(city: "Jakarta", country: "Indonesia"),
    CityItem(city: "Bogor", country: "Indonesia"),
    CityItem(city: "Bandung", country: "Indonesia"),
    CityItem(city: "Surabaya", country: "Indonesia"),
    CityItem(city: "Medan", country: "Indonesia"),
    CityItem(city: "Makassar", country: "Indonesia"),
    CityItem(city: "Yogyakarta", country: "Indonesia"),
    CityItem(city: "Semarang", country: "Indonesia"),
    CityItem(city: "Palembang", country: "Indonesia"),

    // Saudi
    CityItem(city: "Makkah", country: "Saudi Arabia"),
    CityItem(city: "Madinah", country: "Saudi Arabia"),
    CityItem(city: "Riyadh", country: "Saudi Arabia"),
    CityItem(city: "Jeddah", country: "Saudi Arabia"),

    // UAE
    CityItem(city: "Dubai", country: "United Arab Emirates"),
    CityItem(city: "Abu Dhabi", country: "United Arab Emirates"),

    // Qatar
    CityItem(city: "Doha", country: "Qatar"),

    // Turkey
    CityItem(city: "Istanbul", country: "Turkey"),
    CityItem(city: "Ankara", country: "Turkey"),

    // Europe
    CityItem(city: "London", country: "United Kingdom"),
    CityItem(city: "Paris", country: "France"),
    CityItem(city: "Berlin", country: "Germany"),
    CityItem(city: "Amsterdam", country: "Netherlands"),
    CityItem(city: "Athens", country: "Greece"),
    CityItem(city: "Rome", country: "Italy"),

    // Asia
    CityItem(city: "Tokyo", country: "Japan"),
    CityItem(city: "Seoul", country: "South Korea"),
    CityItem(city: "Beijing", country: "China"),
    CityItem(city: "Kuala Lumpur", country: "Malaysia"),
    CityItem(city: "Singapore", country: "Singapore"),

    // America
    CityItem(city: "New York", country: "United States"),
    CityItem(city: "Los Angeles", country: "United States"),
    CityItem(city: "Chicago", country: "United States"),

    // Australia
    CityItem(city: "Sydney", country: "Australia"),
    CityItem(city: "Melbourne", country: "Australia"),
  ];
}