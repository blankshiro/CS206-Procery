class Dashboard {
  String title;
  String description;
  String image;
  int calories;

  Dashboard(this.title, this.description, this.image, this.calories);
}

List<Dashboard> getExpiring() {
  return <Dashboard>[
    Dashboard("Eggs", "x6", "assets/images/eggs.png", 0),
    Dashboard("Cake 2", "So good", "assets/images/cake_2.png", 200)
  ];
}
