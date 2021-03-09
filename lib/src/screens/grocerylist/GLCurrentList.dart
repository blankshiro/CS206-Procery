class CurrentList {
  String title;
  String date;
  double progressValue;

  CurrentList(this.title, this.date, this.progressValue);
}

List<CurrentList> getCurrentList() {
  return <CurrentList>[
    CurrentList("All in One List", "22/3/21", 0.3),
    CurrentList("Family Food List", "22/3/21", 0.8),
    CurrentList("Spicy List", "22/3/21", 0.7),
    CurrentList("Every Weekend Fill List", "22/3/21", 0.5),
    CurrentList("Japanese Cuisine List", "22/3/21", 0.2),
  ];
}
