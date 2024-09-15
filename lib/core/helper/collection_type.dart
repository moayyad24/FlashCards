enum CollectionType {
  sets,
  folder,
}

CollectionType getType(int n) {
  if (n == 0) {
    return CollectionType.sets;
  } else {
    return CollectionType.folder;
  }
}
