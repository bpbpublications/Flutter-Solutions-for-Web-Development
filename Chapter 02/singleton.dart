// singleton.dart

class SettingsManager {
  // Private constructor
  SettingsManager._privateConstructor();

  // Static field to hold the single instance
  static final SettingsManager _instance = SettingsManager._privateConstructor();

  // Factory constructor to return the single instance
  factory SettingsManager() {
    return _instance;
  }

  // A map to hold settings as key-value pairs
  final Map<String, String> _settings = {};

  // Method to update a setting
  void setSetting(String key, String value) {
    _settings[key] = value;
  }

  // Method to retrieve a setting
  String? getSetting(String key) {
    return _settings[key];
  }
}

void main() {
  // Fetching the Singleton instance
  SettingsManager manager1 = SettingsManager();

  // Setting a value using the first reference
  manager1.setSetting('theme', 'dark');

  // Fetching the Singleton instance again (same instance)
  SettingsManager manager2 = SettingsManager();

  // Retrieving the value using the second reference
  print(manager2.getSetting('theme')); // Output: dark

  // Verifying both references point to the same instance
  print(manager1 == manager2); // Output: true
}
