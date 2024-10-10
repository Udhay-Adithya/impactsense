class User {
  String? username;
  List<Contact>? contacts;
}

class Contact {
  final String name;
  final String relationship;
  final String mobileNumber;

  Contact(
      {required this.name,
      required this.relationship,
      required this.mobileNumber});
}
