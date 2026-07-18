class ChatContact {
  final String id;
  final String name;
  final String profession;

  const ChatContact({
    required this.id,
    required this.name,
    required this.profession,
  });
}

const List<ChatContact> chatContacts = [
  ChatContact(
    id: "doctor1",
    name: "Dr. Arya",
    profession: "Doctor",
  ),
  ChatContact(
    id: "teacher1",
    name: "Meera",
    profession: "Teacher",
  ),
  ChatContact(
    id: "lawyer1",
    name: "Rahul",
    profession: "Lawyer",
  ),
  ChatContact(
    id: "engineer1",
    name: "Akhil",
    profession: "Engineer",
  ),
  ChatContact(
    id: "nurse1",
    name: "Anjali",
    profession: "Nurse",
  ),
];