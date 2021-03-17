import 'package:Procery/src/screens/grocerylist/GLItemPage.dart';
import 'package:Procery/src/screens/grocerylist/GLPastPage.dart';
import 'package:Procery/src/screens/grocerylist/GLCurrentList.dart';
import 'package:Procery/src/screens/grocerylist/GLEditPage.dart';
import 'package:Procery/src/screens/grocerylist/GLPastList.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../models/GroceryList.dart';
import '../../services/GroceryListModel.dart';
import '../../models/Purchase.dart';
import '../../services/PurchaseModel.dart';


import '../../shared/styles.dart';
import 'package:Procery/src/shared/styles.dart';
import 'package:Procery/src/shared/colors.dart';
import 'package:Procery/src/shared/fryo_icons.dart';
import 'package:flutter/cupertino.dart';




class GLCurrentPage extends StatefulWidget {
  @override
  _GLCurrentPageState createState() => _GLCurrentPageState();
}

class _GLCurrentPageState extends State<GLCurrentPage> {
  int _value = 1;

  Widget getChildWidget() => childWidgets[selectedIndex];

  Map<int, Widget> map =
      new Map(); // Cupertino Segmented Control takes children in form of Map.
  List<Widget>
      childWidgets; //The Widgets that has to be loaded when a tab is selected.
  int selectedIndex = 0;

  GroceryListModel groceryListModel;
  @override
  void initState() {
    super.initState();
    loadCupertinoTabs(); //Method to add Tabs to the Segmented Control.
    // loadChildWidgets(); //Method to add the Children as user selected.
  }

  void loadCupertinoTabs() {
    map = new Map();

    for (int i = 0; i < 2; i++) {
      String tabText = "";
      if (i == 0) {
        tabText = "Current";
      } else if (i == 1) {
        tabText = "Past";
      } //putIfAbsent takes a key and a function callback that has return a value to that key.
// In our example, since the Map is of type <int,Widget> we have to return widget.
      map.putIfAbsent(
          i,
          () => Container(
              width: 200,
              child: Text(
                tabText,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              )));
    }
  }


  @override
  Widget build(BuildContext context) {
    print("Refreshing Grocery List Main - State");
    List<GroceryList> groceryListList = context.watch<GroceryListModel>().grocerylistList;
    List<Purchase> purchaseList = context.watch<PurchaseModel>().purchaseList;
    print("GroceryListList length: " + groceryListList.length.toString());
    groceryListModel = Provider.of<GroceryListModel>(context, listen: false);
    PurchaseModel purchaseModel = Provider.of<PurchaseModel>(context, listen: false);

    loadChildWidgets(groceryListList);

    return Scaffold(
      backgroundColor: Colors.green[200],
      resizeToAvoidBottomInset: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //1. Header
            Container(
              padding: EdgeInsets.all(10),
              child: buildTextTitleVariation1('My Grocery Lists'),
            ),
            //3. Search Bar
            buildSearchBar(),
            //SCROLLING HERE
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  child: Column(
                    children: [
                      //2. Current and Past buttons
                      // buildCurrentAndPastButton(),
                      buildCupertinoTab(),
                      //4. Sort by filter
                      buildFilter(),
                      //5. Name and quantity headers
                      buildNameAndQuantityHeader(),
                      //NUMBER 5
                      Container(
                        color: Colors.grey[50],
                        child: getChildWidget(),
                      ),
                      // buildCurrentListTab(),
                    ],
                  ),
                ),
              ),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GLEditPage()),
          );
        },
        child: Text('edit'),
        backgroundColor: Colors.greenAccent[700],
      ),
    );
  }

  Container buildCupertinoTab() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: CupertinoSegmentedControl(
        onValueChanged: (value) {
//Callback function executed when user changes the Tabs
          setState(() {
            selectedIndex = value;
          });
        },
        groupValue: selectedIndex, //The current selected Index or key
        selectedColor: Colors
            .greenAccent[700], //Color that applies to selecte key or index
        pressedColor: Colors
            .red, //The color that applies when the user clicks or taps on a tab
        unselectedColor: Colors
            .grey, // The color that applies to the unselected tabs or inactive tabs
        children: map, //The tabs which are assigned in the form of map
        padding: EdgeInsets.all(10),
        borderColor: Colors.white,
      ),
    );
  }

  ////////////////////////////////
  //SEPARATE WIDGETS
  ////////////////////////////////

  Container buildNameAndQuantityHeader() {
    return Container(
      color: Colors.grey[50],
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 1,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Name',
                style: h5,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: 1,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Deadline',
                style: h5,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildFilter() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
      color: Colors.grey[50],
      child: Row(children: [
        Container(
          color: Colors.grey[50],
          child: Text(
            'Sort by: ',
            style: h5,
          ),
        ),
        Container(
          color: Colors.grey[50],
          padding: EdgeInsets.only(left: 10),
          child: DropdownButton(
            value: _value,
            items: [
              DropdownMenuItem(
                child: Text("Most Groceries", style: priceText),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text("Incoming Datelines", style: priceText),
                value: 2,
              ),
              DropdownMenuItem(
                child: Text("Highest Progress", style: priceText),
                value: 3,
              ),
            ],
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ),
      ]),
    );
  }

  Container buildSearchBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(fontSize: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: EdgeInsets.only(
            left: 30,
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 24.0, left: 16.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }

  // Seems like this functiom is not used, can delete? - WJ
  Container buildCurrentAndPastButton() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 100.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: Colors.greenAccent[700],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
            child: FlatButton(
              onPressed: () {},
              child: Text(
                'Current',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
              width: 100.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GLPastPage()),
                  );
                },
                child: Text(
                  'Past',
                  style: priceText,
                  textAlign: TextAlign.center,
                ),
              )),
        ],
      ),
    );
  }

  ////////////////////////////////
  ///GROCERY CURRENT LISTING PART
  ////////////////////////////////
  void loadChildWidgets(List<GroceryList> groceryListList) {
    childWidgets = [];

    List<GroceryList> _toDisplay = List.from(groceryListList);
    List<GroceryList> activeLists = _toDisplay.where((i) => i.active == 1).toList();
    List<GroceryList> inactiveLists = _toDisplay.where((i) => i.active == 0).toList();

    computeCompletionPercentage(activeLists);
    computeCompletionPercentage(inactiveLists);

    childWidgets.add(buildCurrentListTab(activeLists));
    childWidgets.add(buildCurrentListTab(inactiveLists));
  }

  void computeCompletionPercentage(List<GroceryList> groceryListList){
    for(int i = 0; i < groceryListList.length; i++){
      GroceryList currentList = groceryListList[i];
      if(currentList.purchases.length == 0){
        currentList.completionPercent = 0;
        continue;
      }
      double purchasedCount = 0.0;
      for(int j = 0; j < currentList.purchases.length; j++){
        if(currentList.purchases[j].purchased == 1){
          purchasedCount += 1;
        }
      }
      currentList.completionPercent = purchasedCount / currentList.purchases.length ;
      if(currentList.completionPercent < 1.0){
      }
    }
  }

  Container buildCurrentListTab(List<GroceryList> groceryListList) {
    return Container(
      color: Colors.grey[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: buildCurrentLists(groceryListList),
      ),
    );
  }

  List<Widget> buildCurrentLists(List<GroceryList> groceryListList) {
    List<Widget> currentList = [];
    List<GroceryList> toDisplay = List.from(groceryListList);

    for (var i = 0; i < toDisplay.length; i++) {
      // show if the grocery not bought yet
      currentList.add(buildCurrentList(toDisplay[i]));
    }
    return currentList;
  }

  Widget buildCurrentList(GroceryList currentList) {
    return GestureDetector(
      onTap: () {},
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: buildGLCurrentList(currentList),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    width: 1,
                  ),
                ),
                Expanded(
                  flex: 16,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: LinearProgressIndicator(
                      minHeight: 10,
                      backgroundColor: Colors.grey[300],
                      valueColor:
                          new AlwaysStoppedAnimation(Colors.greenAccent[700]),
                      value: currentList.completionPercent,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    width: 2,
                  ),
                ),
              ],
            ),
            Divider(
              height: 10,
              thickness: 1,
              color: Colors.grey[300],
              indent: 5,
              endIndent: 5,
            ),
          ]),
    );
  }

  buildGLCurrentList(GroceryList currentList) {
    bool _checked = currentList.active == 0;
    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Checkbox(
                value: _checked,
                onChanged: (bool check) {
                  setState(() {
                    _checked = !_checked;
                    flipListActiveState(currentList);
                  });
                },
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GLItemPage(groceryList: currentList,)),
                  );
                },
                child: Text(
                  currentList.name,
                  style: priceText,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Text(
                DateFormat('MM - dd').format(currentList.deadLine), //intl package
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void flipListActiveState(GroceryList currentList){
    List<GroceryList> groceryListList = groceryListModel.grocerylistList;
    int glIndex = -1;
    for(int i = 0; i < groceryListList.length; i++){
      if(groceryListList[i].id == currentList.id){
        glIndex = i;
        break;
      }
    }

    GroceryList toUpdate = groceryListList[glIndex];
    toUpdate.active = (toUpdate.active + 1) % 2; // Force it to alternate between 0 & 1
    groceryListModel.updateItem(glIndex, toUpdate);

  }
////////////////////////////////
  ///GROCERY CURRENT LISTING PART
////////////////////////////////

  /**
  Container buildPastListTab(List<GroceryList> groceryListList) {
    return Container(
      color: Colors.grey[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: buildPastLists(groceryListList),
      ),
    );
  }

  List<Widget> buildPastLists() {
    List<Widget> pastList = [];
    List<GroceryList> _toDisplay = List.from(groceryListList);
    List<GroceryList> toDisplay = _toDisplay.where((i) => i.active).toList();

    for (var i = 0; i < getPastList().length; i++) {
      // show if the grocery not bought yet
      pastList.add(buildPastList(getPastList()[i]));
    }
    return pastList;
  }

  Widget buildPastList(PastList pastList) {
    return GestureDetector(
      onTap: () {},
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: buildGLPastList(pastList),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    width: 1,
                  ),
                ),
                Expanded(
                  flex: 16,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: LinearProgressIndicator(
                      minHeight: 10,
                      backgroundColor: Colors.grey[300],
                      valueColor:
                          new AlwaysStoppedAnimation(Colors.greenAccent[700]),
                      value: pastList.progressValue,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    width: 2,
                  ),
                ),
              ],
            ),
            Divider(
              height: 10,
              thickness: 1,
              color: Colors.grey[300],
              indent: 5,
              endIndent: 5,
            ),
          ]),
    );
  }

  buildGLPastList(PastList pastList) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Checkbox(
                value: _checked,
                onChanged: (bool value) {
                  setState(() {
                    _checked = value;
                  });
                },
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GLItemPage()),
                  );
                },
                child: Text(
                  pastList.title,
                  style: priceText,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Text(
                pastList.date,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

      **/
}
