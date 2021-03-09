class PastList {
  String title;

  PastList(this.title);
}

List<PastList> getPastList() {
  return <PastList>[
    PastList("Dessert List"),
    PastList("CAKE ONLYS List"),
    PastList("Sweet goodies List"),
  ];
}
