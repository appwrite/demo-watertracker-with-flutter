import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';

Client client = Client(endPoint: "https://demo.appwrite.io/v1")
    .setProject('607b7f4a080c8')
    .setKey(
        "9e54ff666c7d6c79fa31e1dfc30ac2399bffbd42121170b0deaa5113102a1fa510ccde39cf3ebc102fe3b893c900e7c53ec7676c59f0be6c9f69b004172daff785f8a8d57cc0fda0657c674cb13d1d5ba0591239c9e2216ede1b5bbc52778eb19871e69201f07184f63d335eca6a070e2106ea74916eaff712608b595055b64e");
Database db = Database(client);
void main() async {
  //create entries collection
  Collection collection;
  try {
    collection = await getCollection('entries');
  } on AppwriteException catch (e) {
    print(e.message);
  }
  if (collection != null) {
    await createCollection();
  } else {
    print("Collection Entries Already exists");
  }
}

createCollection() async {
  final collectionId = 'entries';
  final res = await db.createCollection(
    collectionId: collectionId,
    name: 'Entries',
    permission: 'document',
    read: ['role:member'],
    write: ['role:member'],
  );
  await db.createStringAttribute(
      collectionId: collectionId, key: 'user', size: 36, xrequired: true);
  await db.createIntegerAttribute(
      collectionId: collectionId, key: 'date', xrequired: true);
  await db.createIntegerAttribute(
      collectionId: collectionId, key: 'amount', xrequired: true);
  print(res.toMap());
  print("Collection Entries created");
}

Future<Collection> getCollection(String collectionId) async {
  try {
    final res = await db.getCollection(collectionId: collectionId);
    return res;
  } on AppwriteException catch (e) {
    print(e);
    return null;
  }
}
