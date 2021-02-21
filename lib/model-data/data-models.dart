class Diseases {
  final String name, description;
  final List<String> images;
  final List<String> causes,signs,treatment,preventiveM;
  final List<Map<String,dynamic>>comment;

  Diseases({this.name, this.description, this.images, this.causes, this.signs, this.treatment, this.preventiveM, this.comment});
}
class Farmers {
  final String name, location, telephone;
  final int numFarms;
  final String img;
  final double farmSize;
  final int age;
  final String specialized;
  Farmers(
      { this.name, this.location, this.telephone, this.numFarms, this.img, this.age, this.farmSize, this.specialized});
}