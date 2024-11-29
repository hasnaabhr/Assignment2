import 'dart:io';

void main() {
  // Main program loop to allow multiple conversions
  while (true) {
    // Display the menu to the user
    print("\nTemperature Conversion Options:");
    print("1. Celsius to Fahrenheit");
    print("2. Fahrenheit to Celsius");
    print("3. Celsius to Kelvin");
    print("4. Kelvin to Celsius");
    print("5. Fahrenheit to Kelvin");
    print("6. Kelvin to Fahrenheit");
    print("7. Exit");

    // Prompt the user to choose an option
    print("Enter your choice (1-7):");
    String? choiceInput = stdin.readLineSync();
    int? choice = int.tryParse(choiceInput ?? '');

    // Validate the choice input
    if (choice == null || choice < 1 || choice > 7) {
      print("Invalid choice. Please select a valid option.");
      continue; // Restart the loop for valid input
    }

    // Exit the program if the user selects option 7
    if (choice == 7) {
      print("Exiting the program. Goodbye!");
      break;
    }

    // Prompt the user to enter a temperature value
    print("Enter the temperature value:");
    String? tempInput = stdin.readLineSync();
    double? temp = double.tryParse(tempInput ?? '');

    // Validate the temperature input
    if (temp == null) {
      print("Invalid temperature. Please enter a valid number.");
      continue; // Restart the loop for valid input
    }

    // Perform the selected conversion based on the user's choice
    switch (choice) {
      case 1: // Celsius to Fahrenheit
        print("${temp}°C is ${celsiusToFahrenheit(temp).toStringAsFixed(2)}°F");
        break;
      case 2: // Fahrenheit to Celsius
        print("${temp}°F is ${fahrenheitToCelsius(temp).toStringAsFixed(2)}°C");
        break;
      case 3: // Celsius to Kelvin
        print("${temp}°C is ${celsiusToKelvin(temp).toStringAsFixed(2)}K");
        break;
      case 4: // Kelvin to Celsius
        if (temp < 0) {
          print(
              "Invalid Kelvin temperature. Value cannot be below absolute zero (0K).");
        } else {
          print("${temp}K is ${kelvinToCelsius(temp).toStringAsFixed(2)}°C");
        }
        break;
      case 5: // Fahrenheit to Kelvin
        print("${temp}°F is ${fahrenheitToKelvin(temp).toStringAsFixed(2)}K");
        break;
      case 6: // Kelvin to Fahrenheit
        if (temp < 0) {
          print(
              "Invalid Kelvin temperature. Value cannot be below absolute zero (0K).");
        } else {
          print("${temp}K is ${kelvinToFahrenheit(temp).toStringAsFixed(2)}°F");
        }
        break;
    }
  }
}

// Function to convert Celsius to Fahrenheit
// Formula: °F = (°C × 9/5) + 32
double celsiusToFahrenheit(double celsius) {
  return (celsius * 9 / 5) + 32;
}

// Function to convert Fahrenheit to Celsius
// Formula: °C = (°F − 32) × 5/9
double fahrenheitToCelsius(double fahrenheit) {
  return (fahrenheit - 32) * 5 / 9;
}

// Function to convert Celsius to Kelvin
// Formula: K = °C + 273.15
double celsiusToKelvin(double celsius) {
  return celsius + 273.15;
}

// Function to convert Kelvin to Celsius
// Formula: °C = K − 273.15
double kelvinToCelsius(double kelvin) {
  return kelvin - 273.15;
}

// Function to convert Fahrenheit to Kelvin
// Formula: K = (°F − 32) × 5/9 + 273.15
double fahrenheitToKelvin(double fahrenheit) {
  return (fahrenheit - 32) * 5 / 9 + 273.15;
}

// Function to convert Kelvin to Fahrenheit
// Formula: °F = (K − 273.15) × 9/5 + 32
double kelvinToFahrenheit(double kelvin) {
  return (kelvin - 273.15) * 9 / 5 + 32;
}
