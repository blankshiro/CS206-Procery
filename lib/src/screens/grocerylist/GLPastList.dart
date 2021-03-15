class PastList {
  String title;
  String date;
  double progressValue;

  PastList(this.title, this.date, this.progressValue);
}

List<PastList> getPastList() {
  return <PastList>[
    PastList("Dessert List", "24/3/21", 0.9),
    PastList("CAKE ONLYS List", "24/3/21", 1),
    PastList("Sweet goodies List", "24/3/21", 1),
  ];
}
