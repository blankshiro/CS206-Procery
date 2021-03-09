class ItemList {
  String title;

  ItemList(this.title);
}

List<ItemList> getItemList() {
  return <ItemList>[
    ItemList("flour"),
    ItemList("egg"),
    ItemList("sugar"),
  ];
}
