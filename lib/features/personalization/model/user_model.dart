import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  // -- Helper Function to get the Full Name
  String get fullName => '$firstName $lastName';

  // -- Helper Function to format the Phone Number
  String get formatPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  // -- Static function to split full name into first and last name.
  static List<String> nameParts(String fullName) => fullName.split(' ');

  // -- Static function to generate a username from the full name.
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';
    String cemalCaseUsername = '$firstName$lastName';
    String userWithPrefix = 'cwt_$cemalCaseUsername';

    return userWithPrefix;
  }

  // -- Static function to create an empty UserModel
  static UserModel empty() => UserModel(id: '', firstName: '', lastName: '', username: '', email: '', phoneNumber: '', profilePicture: '');

  // -- Convert UserModel to JSON, Structure for storing data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'First Name': firstName,
      'Last Name': lastName,
      'Username': username,
      'Email': email,
      'Phone Number': phoneNumber,
      'Profile Picture': profilePicture,
    };
  }

  // -- Convert JSON to UserModel
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          firstName: data['FirstName'] ?? '',
          lastName: data['LastName'] ?? '',
          username: data['Username'] ?? '',
          email: data['Email'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',
          profilePicture: data['ProfilePicture'] ?? ''
      );
    }
    else {
      return UserModel.empty();
    }
  }

}
