import 'package:Procery/src/screens/BaseWidgets.dart';
import 'package:Procery/src/screens/grocerylist/GLItemPage.dart';
import 'package:Procery/src/screens/grocerylist/GLPastPage.dart';
import 'package:Procery/src/screens/grocerylist/GLEditPage.dart';

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
import 'package:flutter/cupertino.dart';

class GLCurrentPage extends StatefulWidget {
  @override
  _GLCurrentPageState createState() => _GLCurrentPageState();
}

class _GLCurrentPageState extends State<GLCurrentPage> {
  int _value = 1;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();

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

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    super.dispose();
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
    Provider.of<GroceryListModel>(context, listen: true).grocerylistList;
    List<Purchase> purchaseList = context.watch<PurchaseModel>().purchaseList;
    groceryListModel = Provider.of<GroceryListModel>(context, listen: false);
    List<GroceryList> groceryListList = groceryListModel.grocerylistList;
    print("GroceryListList length: " + groceryListList.length.toString());
    PurchaseModel purchaseModel =
        Provider.of<PurchaseModel>(context, listen: false);

    loadChildWidgets(groceryListList);

    return Scaffold(
      bottomNavigationBar: getBaseBottomNavBar(context, 2),
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 45, 0, 0),
              child: Text(
                "My",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Text(
                "Grocery List",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ),
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
                        color: Colors.grey[100],
                        child: getChildWidget(),
                      ),
                      //6. end white screen
                      Container(
                        width: 500,
                        height: 400,
                        color: Colors.grey[100],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
      floatingActionButton: Container(
        width: 45.0,
        height: 45.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              _showMyDialog();
            },
            child: Icon(
              Icons.add,
              size: 35,
            ),
            backgroundColor: Colors.greenAccent[700],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text(
              'Create a Grocery List',
              style: h4,
            ),
            content: Container(
                height: 240,
                child: Column(children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          child: Text(
                            'List Name: ',
                            style: priceText,
                          ),
                        ),
                        TextFormField(
                          controller: textController1,
                          autovalidateMode: AutovalidateMode.always,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please provide a list name';
                            }
                            return null;
                          },
                        ),
                        Container(
                          child: SizedBox(
                            height: 10,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(2),
                          child: Text(
                            'Deadline:',
                            style: priceText,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.all(2),
                                child: TextFormField(
                                  controller: textController2,
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter a date YYYY-MM-DD';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.all(15),
                                child: IconButton(
                                  onPressed: () => _selectDate(context),
                                  icon: Icon(Icons.calendar_today),
                                  iconSize: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.close),
                          iconSize: 30,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.check),
                          iconSize: 30,
                          onPressed: () {
                            createNewGroceryList(
                                textController1.text, textController2.text);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  )
                ])));
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    var formatter = new DateFormat('yyyy-MM-dd');
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        textController2.value =
            TextEditingValue(text: formatter.format(selectedDate).toString());
      });
  }

  createNewGroceryList(String name, String deadline) {
    int id = groceryListModel.grocerylistList.length;
    GroceryList toCreate = new GroceryList()
      ..name = name
      ..deadLine = DateTime.parse(deadline)
      ..purchases = []
      ..type = 1
      ..id = id;

    groceryListModel.addItem(toCreate);
  }

  Container buildCupertinoTab() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
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
        selectedColor:
            Colors.greenAccent[700], //Color that applies to select key or index
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
      color: Colors.grey[100],
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
      padding: EdgeInsets.fromLTRB(10, 0, 0, 15),
      color: Colors.grey[100],
      child: Row(children: [
        Container(
          color: Colors.grey[100],
          child: Text(
            'Sort by: ',
            style: h5,
          ),
        ),
        Container(
          color: Colors.grey[100],
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
      padding: EdgeInsets.fromLTRB(15, 8, 15, 25),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Colors.grey[100],
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

  ////////////////////////////////
  ///GROCERY CURRENT LISTING PART
  ////////////////////////////////
  void loadChildWidgets(List<GroceryList> groceryListList) {
    childWidgets = [];

    List<GroceryList> _toDisplay = List.from(groceryListList);
    List<GroceryList> activeLists =
        _toDisplay.where((i) => i.active == 1).toList();
    List<GroceryList> inactiveLists =
        _toDisplay.where((i) => i.active == 0).toList();

    computeCompletionPercentage(activeLists);
    computeCompletionPercentage(inactiveLists);

    childWidgets.add(buildCurrentListTab(activeLists));
    childWidgets.add(buildCurrentListTab(inactiveLists));
  }

  void computeCompletionPercentage(List<GroceryList> groceryListList) {
    for (int i = 0; i < groceryListList.length; i++) {
      GroceryList currentList = groceryListList[i];
      if (currentList.purchases.length == 0) {
        currentList.completionPercent = 0;
        continue;
      }
      double purchasedCount = 0.0;
      for (int j = 0; j < currentList.purchases.length; j++) {
        if (currentList.purchases[j].purchased == 1) {
          purchasedCount += 1;
        }
      }
      currentList.completionPercent =
          purchasedCount / currentList.purchases.length;
      if (currentList.completionPercent < 1.0) {}
    }
  }

  Container buildCurrentListTab(List<GroceryList> groceryListList) {
    return Container(
      color: Colors.grey[100],
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
                    MaterialPageRoute(
                        builder: (context) => GLItemPage(
                              groceryList: currentList,
                            )),
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
                DateFormat('MM - dd')
                    .format(currentList.deadLine), //intl package
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void flipListActiveState(GroceryList currentList) {
    groceryListModel.getItem();
    List<GroceryList> groceryListList = groceryListModel.grocerylistList;

    int glIndex = -1;
    for (int i = 0; i < groceryListList.length; i++) {
      if (groceryListList[i].id == currentList.id) {
        glIndex = i;
        break;
      }
    }
    GroceryList toUpdate = groceryListList[glIndex];
    toUpdate.active =
        (toUpdate.active + 1) % 2; // Force it to alternate between 0 & 1
    groceryListModel.updateItemByKey(currentList.id, toUpdate);
    groceryListModel.getItem();
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
