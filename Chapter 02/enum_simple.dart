// enum_simple.dart
enum Screen{
  home,
  profile,
  settings
}

void main() {
  // Accessing enum values
  print(Screen.home);
  // Accessing enum name
  print(Screen.profile.name);
  // Accessing enum index
  print(Screen.settings.index);
  // Accessing all enum values
  print(Screen.values);
}