void main() {
  List nameList = ['ikram', 'jahidul', 'habib', 'zahid', 'sharmin'];

  nameList.add('forhad');

  nameList.removeAt(0);

  print(nameList.length);

  for (int i = 0; i < nameList.length; i = i + 1) {
    print(nameList[i]);
  }
}
