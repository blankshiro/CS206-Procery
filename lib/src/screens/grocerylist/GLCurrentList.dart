class CurrentList {
  String title;
  String date;
  double progressValue;

  CurrentList(this.title, this.date, this.progressValue);
}

List<CurrentList> getCurrentList() {
  return <CurrentList>[
    CurrentList("All in One List", "22/3/21", 0.3),
    CurrentList("Family Food List", "21/3/21", 0.8),
    CurrentList("Spicy List", "11/4/21", 0.7),
    CurrentList("Every Weekend Fill List", "4/5/21", 0.5),
    CurrentList("Japanese Cuisine List", "1/6/21", 0.2),
  ];
}
