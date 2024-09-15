enum Type {
  sets,
  folder,
}

Type getType(int n) {
  if (n == 0) {
    return Type.sets;
  } else {
    return Type.folder;
  }
}
