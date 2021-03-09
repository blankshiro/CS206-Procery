class Inventory {
  String title;
  String description;
  String image;
  int expiry;

  Inventory(this.title, this.description, this.image, this.expiry);
}

List<Inventory> getExpiring() {
  return <Inventory>[
    Inventory("Milk", "1000ml", "assets/images/milk.png", 6),
    Inventory("Butter", "250g", "assets/images/milk.png", 8),
    Inventory("Oil", "100ml", "assets/images/milk.png", 9),
    Inventory("Sugar", "200g", "assets/images/milk.png", 11),
    Inventory("Chocolate Chip", "300g", "assets/images/milk.png", 15),
    Inventory("Baking Powder", "100g", "assets/images/milk.png", 18),
    // Inventory("Eggs", "x6", "assets/images/eggs.png", 6),
  ];
}
