class ItemList {
  String title;
  int quantity;

  ItemList(this.title, this.quantity);
}

List<ItemList> getItemList() {
  return <ItemList>[
    ItemList("flour", 500),
    ItemList("egg", 3),
    ItemList("sugar", 250),
    ItemList("sugar", 250),
    ItemList("sugar", 250),
    ItemList("sugar", 250),
    ItemList("sugar", 250),
    ItemList("sugar", 250),
    ItemList("sugar", 250),
  ];
}
