class Diseases {
  final String name, description;
  final List images;
  final List causes,signs,treatment,preventiveM;
  final List<Map<String,dynamic>>comment;

  Diseases({this.name, this.description, this.images, this.causes, this.signs, this.treatment, this.preventiveM, this.comment});
}
class Farmers {
  final String name, location, telephone,farmerId;
  final int numFarms;
  final String img;
  final double farmSize;
  final int age;
  final String specialized;
  Farmers(
      {this.farmerId, this.name, this.location, this.telephone, this.numFarms, this.img, this.age, this.farmSize, this.specialized});
}
class Farms {
  final String farmerId,farmId,description;
  final List<Map<String,dynamic>> farmState;
  final List images, cropType;
  final double farmSize;
  final String location;
  final List<Map<String,dynamic>>comment;

  Farms({this.farmerId,this.farmId,this.description,  this.farmState, this.images, this.cropType,
      this.farmSize, this.location, this.comment});
}