class PastList {
  String title;
  String date;

  PastList(this.title, this.date);
}

List<PastList> getPastList() {
  return <PastList>[
    PastList("Dessert List", "24/3/21"),
    PastList("CAKE ONLYS List", "24/3/21"),
    PastList("Sweet goodies List", "24/3/21"),
  ];
}
