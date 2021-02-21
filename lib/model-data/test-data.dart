import 'data-models.dart';

class ListGenerator{

 static List<Diseases> diseasesData(){
    List<Diseases> data=[
      Diseases(
          name: "Powdery Mildew",
          images: ["assets/images/plant2.jpg",],
          description:
          "Powdery mildew leaves a telltale white dusty coating on leaves, stems and flowers. Caused by a fungus, it affects a number of plants, including lilacs, apples, grapes, cucumbers, peas, phlox, daisies and roses."),
      Diseases(
          name: "Downy Mildew",
          images: ["assets/images/DSC_0194-e1399462629842.jpg"],
          description:
          " Downy mildew is caused by fungus-like organisms and affects many ornamentals and edibles, such as impatiens, pansies, columbine, grapevines, lettuce and cole crops such as broccoli and cauliflower. Often occurring during wet weather, downy mildew causes the upper portion of leaves to discolor, while the bottoms develop white or gray mold."
              "\nSome desktop Softwares are: Static web application,Dynamic web application,E-commerce,Portal web app,Content management system."),
      Diseases(
          name: "Fungal leaf spot",
          images: ["assets/images/plant2.jpg",],
          description: "Powdery mildew leaves a telltale white dusty coating on leaves, stems and flowers. Caused by a fungus, it affects a number of plants, including lilacs, apples, grapes, cucumbers, peas, phlox, daisies and roses."),
      Diseases(
          name: "Coral spot",
          images: ["assets/images/DSC_0194-e1399462629842.jpg",],
          description: "Powdery mildew leaves a telltale white dusty coating on leaves, stems and flowers. Caused by a fungus, it affects a number of plants, including lilacs, apples, grapes, cucumbers, peas, phlox, daisies and roses."),
      Diseases(
          name: "Grey mould",
          images: [ "assets/images/plant2.jpg",],
          description: "Powdery mildew leaves a telltale white dusty coating on leaves, stems and flowers. Caused by a fungus, it affects a number of plants, including lilacs, apples, grapes, cucumbers, peas, phlox, daisies and roses."),
    ];
    return data;
  }

 static List<Farmers> farmerList(){
   List<Farmers> data=[
     Farmers(
         img:"assets/images/farmer1.jpg",
         name: "Elorm Amantefi",
         location: "Adansi Fomena",
         numFarms: 4,
         age: 46,
         farmSize: 15.7,
         specialized: "Cocoa Farming",
         telephone:"0248569654"),
     Farmers(
         img:"assets/images/farmer2.jpg",
         name: "Kofi Appiah",
         location: "Old Edubiase",
         age: 36,
         specialized: "Maize Farming",
         farmSize: 11,
         numFarms: 6,
         telephone:"0248569654"),
     Farmers(
         img:"assets/images/farmer3.jpg",
         name: "Elvis Sarfo Antwi",
         location: "Kwabre Kenyasi",
         numFarms: 11,
         specialized: "Vegetable Farming",
         age: 42,
         farmSize: 12.5,
         telephone:"0248569654"),
     Farmers(
         img:"assets/images/farmer4.jpg",
         name: "Nyamaah Frimpong Emmanuel",
         location: "Atonsu Monaco",
         numFarms: 9,
         specialized: "Plantain Farming",
         age: 47,
         farmSize: 9.8,
         telephone:"0248569654"),
     Farmers(
         img:"assets/images/farmer5.jpg",
         name: "Akua Frema",
         location: "Meduma",
         numFarms: 1,
         farmSize: 4.2,
         specialized: "Cocoa Farming",
         age: 52,
         telephone:"0248569654"),
     Farmers(
         img:"assets/images/farmer6.jpg",
         name: "Obideaba Isaac",
         location: "Adansi Dompoasi",
         numFarms: 8,
         age: 37,
         farmSize: 4,
         specialized: "Maize Farming",
         telephone:"0248569654"),
     Farmers(
         img:"assets/images/farmer7.jpg",
         name: "Joyce Blessing",
         location: "Old Akrofuom",
         numFarms: 5,
         specialized: "General Farming",
         farmSize: 12.3,
         age: 55,
         telephone:"0248569654"),
     Farmers(
         img:"assets/images/farmer8.jpg",
         name: "Frank Castle",
         location: "Duampompo",
         numFarms: 9,
         specialized: "Vegetable Farming",
         age: 32,
         farmSize: 9,
         telephone:"0248569654"),
     Farmers(
         img:"assets/images/farmer9.jpg",
         name: "Kofi Appiah",
         location: "Ampunyase",
         numFarms: 3,
         age: 35,
         specialized: "General Farming",
         farmSize: 6,
         telephone:"0248569654"),
     Farmers(
         img:"assets/images/farmer10.jpeg",
         name: "Frimpong Sampson",
         location: "Adukoraba",
         numFarms: 5,
         specialized: "Cashew Farming",
         age: 46,
         farmSize: 23,
         telephone:"0248569654"),
     Farmers(
         img:"assets/images/farmer11.jpg",
         name: "Ama Nkunim",
         location: "Old Ayaase",
         numFarms: 2,
         specialized: "Cashew Farming",
         age: 39,
         farmSize: 13,
         telephone:"0248569654"),
   ];
   return data;
 }
}