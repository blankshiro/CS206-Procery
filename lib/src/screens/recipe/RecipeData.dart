class Recipe {
  String title;
  String description;
  String image;
  int calories;

  Recipe(this.title, this.description, this.image, this.calories);
}

List<Recipe> getRecipes() {
  return <Recipe>[
    Recipe(
        "Cake 1", "So irresistibly delicious", "assets/images/cake_1.png", 250),
    Recipe("Cake 2", "So good", "assets/images/cake_2.png", 200),
    Recipe("Cake 3", "So much wow", "assets/images/cake_3.jpg", 150),
    Recipe("Cake 4", "So irresistible", "assets/images/cake_4.jpg", 190),
    Recipe("Cake 5", "So tasty", "assets/images/cake_5.jpg", 250),
  ];
}
