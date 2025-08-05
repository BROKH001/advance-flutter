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

  String get fullName => '$firstName $lastName';

  String get formatPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(String fullName) => fullName.split(' ');

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';
    String cemalCaseUsername = '$firstName$lastName';
    String userWithPrefix = 'cwt_$cemalCaseUsername';

    return userWithPrefix;
  }

  static UserModel empty() => UserModel(id: '', firstName: '', lastName: '', username: '', email: '', phoneNumber: '', profilePicture: '');

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

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          firstName: data['First Name'] ?? '',
          lastName: data['Last Name'] ?? '',
          username: data['Username'] ?? '',
          email: data['Email'] ?? '',
          phoneNumber: data['Phone Number'] ?? '',
          profilePicture: data['Profile Picture'] ?? ''
      );
    }
    else {
      return UserModel.empty();
    }
  }

}
