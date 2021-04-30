import 'package:dart_appwrite/dart_appwrite.dart';

main(List<String> args) async {
  //create required collections
  // “99 little bugs in the code. 99 little bugs in the code. Take one down, patch it around. 127 little bugs in the code …”
  Client client = Client()
      .setEndpoint("https://demo.appwrite.io/v1")
      .setProject('607b7f4a080c8')
      .setKey(
          '9e54ff666c7d6c79fa31e1dfc30ac2399bffbd42121170b0deaa5113102a1fa510ccde39cf3ebc102fe3b893c900e7c53ec7676c59f0be6c9f69b004172daff785f8a8d57cc0fda0657c674cb13d1d5ba0591239c9e2216ede1b5bbc52778eb19871e69201f07184f63d335eca6a070e2106ea74916eaff712608b595055b64e');
  Database db = Database(client);
  final res = await db.createCollection(
    name: 'Water intake',
    read: ['*'],
    write: ['*'],
    rules: [
      {
        "label": "Amount",
        "key": "amount",
        "type": "numeric",
        "required": true,
        "default": '',
        "array": false,
      },
      {
        "label": "Date",
        "key": "date",
        "type": "numeric",
        "required": true,
        "default": '',
        "array": false,
      },
      {
        "label": "User",
        "key": "user_id",
        "type": "text",
        "required": true,
        "default": '',
        "array": false,
      },
    ],
  );
  print("water intake collection created id is: ${res.data['\$id']}");
}
