class CollabList {
  String name;

  CollabList(this.name);
}

List<CollabList> getCollabList() {
  return <CollabList>[
    CollabList("Carrie"),
    CollabList("Mom"),
    CollabList("Dad"),
  ];
}
