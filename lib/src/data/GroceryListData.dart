// Data definitions
import '../models/Purchase.dart';
import '../models/GroceryList.dart';

// Sample Data
import '../data/PurchaseData.dart';

DateTime today = DateTime.now();
List<Purchase> sampleListPurchases = getSampleListPurchase();

GroceryList groceryList1 = new GroceryList()
  ..name = "Groceries for Meal Plan"
  ..deadLine = today.add(Duration(days: 3))
  ..purchases = []
  ..type = 0
  ..id = 0;


GroceryList groceryList2 = new GroceryList()
  ..name = "My Sample List"
  ..deadLine = today.add(Duration(days: 5))
  ..purchases = sampleListPurchases
  ..type = 1
  ..id = 1;

List<GroceryList> getGroceryList() {
  return [groceryList1, groceryList2];
}
