import 'package:Procery/src/screens/recipe/RecipeDetail.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../shared/styles.dart';
import '../../shared/colors.dart';
import '../../shared/Product.dart';
import '../../shared/partials.dart';

import './DashboardConstants.dart';

import '../../data/InventoryData.dart';
import './GroceryData.dart';
import './MealData.dart';

import '../../models/Inventory.dart';
import '../../services/InventoryModel.dart';
import '../../data/RecipeData.dart';
import '../recipe/RecipeExplore.dart';
import '../recipe/RecipeDetail.dart';

class ExpiringPage extends StatefulWidget {
  final String pageTitle;

  ExpiringPage({Key key, this.pageTitle}) : super(key: key);

  @override
  _ExpiringPageState createState() => _ExpiringPageState();
}

class _ExpiringPageState extends State<ExpiringPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Refreshing ExpiringPage State");
    final inventoryModel = context.watch<InventoryModel>();
    List<Inventory> inventoryList =
        context.watch<InventoryModel>().inventoryList;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 45, 0, 0),
              child: Text(
                "Manage",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                "Inventory",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Table(
              columnWidths: {
                0: FixedColumnWidth(25),
                1: FixedColumnWidth(165),
                2: FixedColumnWidth(87),
              },
              // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
              children: [
                TableRow(
                  children: [
                    Container(),
                    Container(
                      padding: EdgeInsets.only(left: 0),
                      child: Text("Name: "),
                      width: 128,
                    ),
                    Container(
                        padding: EdgeInsets.only(right: 0),
                        child: Text("Quantity: ")),
                    Container(
                      padding: EdgeInsets.only(right: 0),
                      child: Text("Expiring In: "),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              child: Column(
                children: buildExpirings(inventoryList, inventoryModel),
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
  //
  // void removeChecked(int i) {
  //   List<Inventory> groceryList = getExpiring();
  // }

  // List<Widget> buildExpirings(List<Inventory> inventoryList) {
  //   List<Widget> expiringList = [];
  //   for (var i = 0; i < getExpiring().length; i++) {
  //     expiringList.add(buildExpiring(getExpiring()[i], i));
  //   }
  //   return expiringList;
  // }
  List<Widget> buildExpirings(List<Inventory> inventoryList, inventoryModel) {
    List<Widget> expiringList = [];
    int displayLength = inventoryList.length;
    if (displayLength > 3) {
      displayLength = 3;
    }

    DateTime today = DateTime.now();
    List<Inventory> expirySorted = List.from(inventoryList);
    for (var i = 0; i < expirySorted.length; i++) {
      expirySorted[i].daysToExpiry = expirySorted[i].ingredient.expiryDays -
          today.difference(expirySorted[i].datePurchased).inDays;
    }

    expirySorted.sort((a, b) => a.daysToExpiry.compareTo(b.daysToExpiry));

    for (var i = 0; i < expirySorted.length; i++) {
      // just return the closest to expiry date item
      expiringList.add(buildExpiring(expirySorted[i], i, inventoryModel));
    }
    return expiringList;
  }

  Widget buildExpiring(Inventory inv, int i, InventoryModel inventoryModel) {
    void addInventory() {
      List<Inventory> inventoryList = inventoryModel.inventoryList;
      int index = 0;
      for (int i = 0; i < inventoryList.length; i++) {
        if (inventoryList[i].id == inv.id) {
          index = i;
          break;
        }
      }

      inv.quantity += 1;
      inventoryModel.updateItem(index, inv);
    }

    void reduceInventory() {
      List<Inventory> inventoryList = inventoryModel.inventoryList;
      int index = 0;
      for (int i = 0; i < inventoryList.length; i++) {
        if (inventoryList[i].id == inv.id) {
          index = i;
          break;
        }
      }

      inv.quantity -= 1;
      if (inv.quantity > 0) {
        inventoryModel.updateItem(index, inv);
      } else {
        inventoryModel.deleteItem(index);
      }
    }

    return Padding(
        padding: EdgeInsets.all(10),
        child: Table(
          // border: TableBorder.all(),
          columnWidths: {
            0: FixedColumnWidth(180),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
            3: FixedColumnWidth(40),
            4: FixedColumnWidth(40),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                TableCell(
                    child: Container(
                  padding: EdgeInsets.only(left: 15),
                  child: buildGroceryTitle(inv.ingredient.name),
                  width: 128,
                )),
                TableCell(
                    child: Container(
                        child: buildGrocerySubtitle(inv.quantity.toString()))),
                TableCell(
                  child: Container(
                    padding: EdgeInsets.only(left: 30),
                    child: buildExpiryDays(inv.daysToExpiry.toString()),
                  ),
                ),
                TableCell(
                  child: Container(
                    child: IconButton(
                      icon: Icon(Icons.remove),
                      iconSize: 30,
                      onPressed: () {
                        reduceInventory();
                      },
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    child: IconButton(
                      icon: Icon(Icons.add_rounded),
                      iconSize: 30,
                      onPressed: () {
                        addInventory();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
