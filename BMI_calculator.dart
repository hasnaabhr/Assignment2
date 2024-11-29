import 'dart:io';

void main() {
  while (true) {
    //user weight
    print("please Enter your weight in kilograms");
    //conver from string to double
    double? weight = double.parse(stdin.readLineSync()!);
    //user height
    print("please Enter your  height in meters");
    //conver from string to double
    double? height = double.parse(stdin.readLineSync()!);
// Ensure valid inputs for weight and height
    // ignore: unnecessary_null_comparison
    if (weight == null || height == null || weight <= 0 || height <= 0) {
      print("Invalid input, please try again!\n");
      continue; // Restart the loop for invalid input
    }

// Calculate BMI using the formula: BMI = weight / (height * height)
    double BMI = weight / (height * height);
    // Round the BMI to two decimal places for better readability
    double roundedMBI = double.parse(BMI.toStringAsFixed(2));
// Display the BMI value and provide health recommendations
    print("\nYour BMI is equal to $roundedMBI");

    //states
    if (BMI < 18.5) {
      print(
          "Your BMI indicates that you are underweight.\n Consider consulting with a healthcare provider or nutritionist to develop a balanced diet plan that meets your energy and nutrient needs.\n Include nutrient-dense foods like lean proteins, healthy fats,\n and whole grains in your meals to gain weight healthily.");
    } else if (BMI >= 18.5 && BMI < 25) {
      print(
          "Your BMI falls within the normal range.\n Keep up the good work by maintaining a balanced diet and engaging in regular physical activity.\n Focus on a lifestyle that includes a variety of nutrient-rich foods, hydration, and adequate sleep to support your overall health.");
    } else if (BMI >= 25 && BMI < 30) {
      print(
          "Your BMI suggests you are in the overweight category.\n It may be beneficial to adopt a healthier lifestyle by reducing calorie-dense foods, increasing physical activity, and monitoring portion sizes.\n Aim for gradual weight loss through sustainable habits to reduce the risk of chronic diseases.");
    } else {
      print(
          "Your BMI indicates obesity,\n which can increase the risk of various health issues.\n Consider seeking advice from a healthcare provider to create a personalized plan that includes a balanced diet and regular exercise.\n Small, consistent changes can lead to significant health improvements over time.");
    }
    // Ask the user if they want to calculate BMI again
    print("\nDo you want to calculate BMI again? (yes/no)");
    String? response = stdin.readLineSync()?.toLowerCase();

    // Break the loop if the user chooses not to continue
    if (response != 'yes') {
      print("Thank you for using the BMI Calculator. Goodbye!");
      break;
    }
  }
}
