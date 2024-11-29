import 'dart:io';

void main() {
  // List to store student data
  List<Map<String, dynamic>> students = [];

  while (true) {
    print("Enter student's name:");
    String studentName = stdin.readLineSync()!;

    // Subjects and scores
    List<String> subjects = ['Math', 'Science', 'English'];
    List<double> scores = [];

    for (String subject in subjects) {
      while (true) {
        print("Enter score for $subject (0-100):");
        String? input = stdin.readLineSync();

        // Handle invalid inputs gracefully with error messages.

        if (input != null && input.isNotEmpty) {
          try {
            double score = double.parse(input);
            if (score >= 0 && score <= 100) {
              scores.add(score);
              break; // Valid input, exit the loop
            } else {
              print("Score must be between 0 and 100. Try again.");
            }
          } catch (e) {
            print("Invalid input. Please enter a valid number.");
          }
        } else {
          print("Input cannot be empty. Try again.");
        }
      }
    }

    // Calculate total and average
    double totalScore = scores.reduce((a, b) => a + b);
    double averageScore = totalScore / scores.length;

    // Assign grade based on average
    String grade;
    if (averageScore >= 90) {
      grade = 'A';
    } else if (averageScore >= 80) {
      grade = 'B';
    } else if (averageScore >= 70) {
      grade = 'C';
    } else if (averageScore >= 60) {
      grade = 'D';
    } else {
      grade = 'F';
    }

    // Store student's data
    students.add({
      'name': studentName,
      'scores': scores,
      'total': totalScore,
      'average': averageScore,
      'grade': grade,
    });

    // Print student's report
    print("\n--- Student Report ---");
    print("Name: $studentName");
    for (int i = 0; i < subjects.length; i++) {
      print("${subjects[i]} Score: ${scores[i]}");
    }
    print("Total Score: $totalScore");
    print("Average Score: ${averageScore.toStringAsFixed(2)}");
    print("Grade: $grade");

    // Ask if the user wants to add another student
    print("\nDo you want to add another student? (yes/no):");
    String response = stdin.readLineSync()!.toLowerCase();
    if (response != 'yes') {
      break;
    }
  }

  // Print a summary of all students
  print("\n--- Summary of All Students ---");
  for (var student in students) {
    print("\nName: ${student['name']}");
    print("Scores: ${student['scores']}");
    print("Total Score: ${student['total']}");
    print("Average Score: ${student['average'].toStringAsFixed(2)}");
    print("Grade: ${student['grade']}");
  }
}
