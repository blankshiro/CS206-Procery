class CurrentList {
  String title;

  CurrentList(this.title);
}

List<CurrentList> getCurrentList() {
  return <CurrentList>[
    CurrentList("All in One List"),
    CurrentList("Family Food List"),
    CurrentList("Spicy List"),
    CurrentList("Every Weekend Fill List"),
    CurrentList("Japanese Cuisine List"),
  ];
}
