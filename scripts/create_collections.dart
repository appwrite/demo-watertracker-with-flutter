import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';

Client client = Client(endPoint: "https://demo.appwrite.io/v1")
    .setProject('607b7f4a080c8')
    .setKey(
        "f3a2ee0a40d4ae49e629bf96e4af6dba0343c16a69bf3dca5a123530da1f104ead1057cf33f2a4e21813d3e89a7bfd75de634c82da55925726f3b905fb9b16d60d39b80b0d09c6542c893586644640a111acbf8cf3803549fb30e1d8acfdde3f41afd2ddbd045891fc0ffb45120a54864c65886b8dd6f71e5eddc3e4f4fe510d");
Database db = Database(client);
final collectionId = 'intakes';
void main() async {
  //create entries collection
  Collection collection;
  try {
    collection = await getCollection(collectionId);
  } on AppwriteException catch (e) {
    print(e.message);
  }
  if (collection == null) {
    await createCollection();
  } else {
    print("Collection Entries Already exists");
  }
}

createCollection() async {
  final res = await db.createCollection(
    collectionId: collectionId,
    name: 'Intakes',
    permission: 'document',
    read: ['role:member'],
    write: ['role:member'],
  );
  await db.createStringAttribute(
      collectionId: collectionId, key: 'userId', size: 36, xrequired: true);
  await db.createIntegerAttribute(
      collectionId: collectionId, key: 'date', xrequired: true);
  await db.createIntegerAttribute(
      collectionId: collectionId, key: 'amount', xrequired: true);
  await Future.delayed(Duration(seconds: 5));
  await db.createIndex(
      key: 'date_index',
      attributes: ['date'],
      collectionId: collectionId,
      type: 'key',
      orders: ['asc']);
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
