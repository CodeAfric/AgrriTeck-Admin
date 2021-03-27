import 'data-models.dart';

class ListGenerator {
  static List<Diseases> diseasesData() {
    List<Diseases> data = [
      Diseases(
          diseaseId: "D10001",
          name: "Powdery Mildew",
          causes: [],
          treatment: [],
          signs: [],
          preventiveM: [],
          images: [
            "assets/images/plant2.jpg",
          ],
          description:
              "Powdery mildew leaves a telltale white dusty coating on leaves, stems and flowers. Caused by a fungus, it affects a number of plants, including lilacs, apples, grapes, cucumbers, peas, phlox, daisies and roses."),
      Diseases(
          diseaseId: "D10002",
          causes: [],
          treatment: [],
          signs: [],
          preventiveM: [],
          name: "Downy Mildew",
          images: ["assets/images/DSC_0194-e1399462629842.jpg"],
          description:
              " Downy mildew is caused by fungus-like organisms and affects many ornamentals and edibles, such as impatiens, pansies, columbine, grapevines, lettuce and cole crops such as broccoli and cauliflower. Often occurring during wet weather, downy mildew causes the upper portion of leaves to discolor, while the bottoms develop white or gray mold."
              "\nSome desktop Softwares are: Static web application,Dynamic web application,E-commerce,Portal web app,Content management system."),
      Diseases(
          causes: [],
          diseaseId: "D10003",
          treatment: [],
          signs: [],
          preventiveM: [],
          name: "Fungal leaf spot",
          images: [
            "assets/images/plant2.jpg",
          ],
          description:
              "Powdery mildew leaves a telltale white dusty coating on leaves, stems and flowers. Caused by a fungus, it affects a number of plants, including lilacs, apples, grapes, cucumbers, peas, phlox, daisies and roses."),
      Diseases(
          causes: [],
          diseaseId: "D10004",
          treatment: [],
          signs: [],
          preventiveM: [],
          name: "Coral spot",
          images: [
            "assets/images/DSC_0194-e1399462629842.jpg",
          ],
          description:
              "Powdery mildew leaves a telltale white dusty coating on leaves, stems and flowers. Caused by a fungus, it affects a number of plants, including lilacs, apples, grapes, cucumbers, peas, phlox, daisies and roses."),
      Diseases(
          causes: [],
          diseaseId: "D10005",
          treatment: [],
          signs: [],
          preventiveM: [],
          name: "Grey mould",
          images: [
            "assets/images/plant2.jpg",
          ],
          description:
              "Powdery mildew leaves a telltale white dusty coating on leaves, stems and flowers. Caused by a fungus, it affects a number of plants, including lilacs, apples, grapes, cucumbers, peas, phlox, daisies and roses."),
    ];
    return data;
  }

  static List<Farmers> farmerList() {
    List<Farmers> data = [
      Farmers(
          farmerId: "10001",
          img: "assets/images/farmer1.jpg",
          name: "Elorm Amantefi",
          location: "Adansi Fomena",
          numFarms: 4,
          age: 46,
          farmSize: 15.7,
          specialized: "Cocoa Farming",
          telephone: "0248569654"),
      Farmers(
          farmerId: "10002",
          img: "assets/images/farmer2.jpg",
          name: "Kofi Appiah",
          location: "Old Edubiase",
          age: 36,
          specialized: "Maize Farming",
          farmSize: 11,
          numFarms: 6,
          telephone: "0248569654"),
      Farmers(
          farmerId: "10003",
          img: "assets/images/farmer3.jpg",
          name: "Elvis Sarfo Antwi",
          location: "Kwabre Kenyasi",
          numFarms: 11,
          specialized: "Vegetable Farming",
          age: 42,
          farmSize: 12.5,
          telephone: "0248569654"),
      Farmers(
          farmerId: "10004",
          img: "assets/images/farmer4.jpg",
          name: "Nyamaah Frimpong Emmanuel",
          location: "Atonsu Monaco",
          numFarms: 9,
          specialized: "Plantain Farming",
          age: 47,
          farmSize: 9.8,
          telephone: "0248569654"),
      Farmers(
          farmerId: "10005",
          img: "assets/images/farmer5.jpg",
          name: "Akua Frema",
          location: "Meduma",
          numFarms: 1,
          farmSize: 4.2,
          specialized: "Cocoa Farming",
          age: 52,
          telephone: "0248569654"),
      Farmers(
          farmerId: "10006",
          img: "assets/images/farmer6.jpg",
          name: "Obideaba Isaac",
          location: "Adansi Dompoasi",
          numFarms: 8,
          age: 37,
          farmSize: 4,
          specialized: "Maize Farming",
          telephone: "0248569654"),
      Farmers(
          farmerId: "10007",
          img: "assets/images/farmer7.jpg",
          name: "Joyce Blessing",
          location: "Old Akrofuom",
          numFarms: 5,
          specialized: "General Farming",
          farmSize: 12.3,
          age: 55,
          telephone: "0248569654"),
      Farmers(
          farmerId: "10008",
          img: "assets/images/farmer8.jpg",
          name: "Frank Castle",
          location: "Duampompo",
          numFarms: 9,
          specialized: "Vegetable Farming",
          age: 32,
          farmSize: 9,
          telephone: "0248569654"),
      Farmers(
          farmerId: "10009",
          img: "assets/images/farmer9.jpg",
          name: "Kofi Appiah",
          location: "Ampunyase",
          numFarms: 3,
          age: 35,
          specialized: "General Farming",
          farmSize: 6,
          telephone: "0248569654"),
      Farmers(
          farmerId: "10010",
          img: "assets/images/farmer10.jpeg",
          name: "Frimpong Sampson",
          location: "Adukoraba",
          numFarms: 5,
          specialized: "Cashew Farming",
          age: 46,
          farmSize: 23,
          telephone: "0248569654"),
      Farmers(
          farmerId: "10011",
          img: "assets/images/farmer11.jpg",
          name: "Ama Nkunim",
          location: "Old Ayaase",
          numFarms: 2,
          specialized: "Cashew Farming",
          age: 39,
          farmSize: 13,
          telephone: "0248569654"),
    ];
    return data;
  }

  static List<Market> marketData() {
    List<Market> data = [
      Market(
          productName: "Fresh Tomatoes",
          measure: "Box",
          productId: "P10001",
          timeStamp: "21st Mar,2021 - 12:12 Pm",
          quantity: 5,
          price: 600,
          productDescription:
              "Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the  or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).Cabbage weights generally range from 500 to 1,000 grams (1 to 2 lb). Smooth-leafed, firm-headed green cabbages are the most common, with smooth-leafed purple cabbages and crinkle-leafed savoy cabbages of both colours being rarer. Under conditions of long sunny days, such as those found at high northern latitudes in summer, cabbages can grow quite large. As of 2012, the heaviest cabbage was 62.71 kilograms (138.25 lb). Cabbage heads are generally picked during the first year of the plant's life cycle, but plants intended for seed are allowed to grow a second year and must be kept separate from other cole crops to prevent cross-pollination. Cabbage is prone to several nutrient deficiencies, as well as to multiple pests, and bacterial and fungal diseases.Cabbage was most likely domesticated somewhere in Europe before 1000 BC, although savoys were not developed until the 16th century AD. By the Middle Ages, cabbage had become a prominent part of European cuisine. They can be prepared many different ways for eating; they can be pickled, fermented (for dishes such as sauerkraut), steamed, stewed, sautéed, braised, or eaten raw. Cabbage is a good source of vitamin K, vitamin C and dietary fiber. World production of cabbage and other brassicas for 2018 was 69 million tonnes, with China accounting for 48% of the total.",
          farmer: {
            'name': "Kofi Appiah",
            'farmerId': "F10001",
            'Location': "Old Adokwai",
            'phone': "+233248485308",
            'gender': "Male",
            'img': "assets/images/farmer1.jpg",
          },
          images: [
            "assets/images/tomatoes1.jpg",
            "assets/images/tomatoes2.jpg",
            "assets/images/tomatoes3.jpg"
          ]),
      Market(
          productName: "Pepper For Sales",
          measure: "Basket",
          productId: "P10001",
          timeStamp: "21st Mar,2021 - 12:12 Pm",
          quantity: 1,
          price: 50,
          productDescription:
          "Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the  or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).Cabbage weights generally range from 500 to 1,000 grams (1 to 2 lb). Smooth-leafed, firm-headed green cabbages are the most common, with smooth-leafed purple cabbages and crinkle-leafed savoy cabbages of both colours being rarer. Under conditions of long sunny days, such as those found at high northern latitudes in summer, cabbages can grow quite large. As of 2012, the heaviest cabbage was 62.71 kilograms (138.25 lb). Cabbage heads are generally picked during the first year of the plant's life cycle, but plants intended for seed are allowed to grow a second year and must be kept separate from other cole crops to prevent cross-pollination. Cabbage is prone to several nutrient deficiencies, as well as to multiple pests, and bacterial and fungal diseases.Cabbage was most likely domesticated somewhere in Europe before 1000 BC, although savoys were not developed until the 16th century AD. By the Middle Ages, cabbage had become a prominent part of European cuisine. They can be prepared many different ways for eating; they can be pickled, fermented (for dishes such as sauerkraut), steamed, stewed, sautéed, braised, or eaten raw. Cabbage is a good source of vitamin K, vitamin C and dietary fiber. World production of cabbage and other brassicas for 2018 was 69 million tonnes, with China accounting for 48% of the total.",
          farmer: {
            'name': "Kofi Appiah",
            'farmerId': "F10001",
            'Location': "Old Adokwai",
            'phone': "+233248485308",
            'gender': "Male",
            'img': "assets/images/farmer1.jpg",
          },
          images: [
            "assets/images/cabbage3.jpg",
            "assets/images/cabbage1.jpg",
            "assets/images/cabbage2.jpg"
          ]),
      Market(
          productName: "Fresh Tomatoes",
          measure: "Box",
          productId: "P10001",
          timeStamp: "21st Mar, 2021 - 12:12 Pm",
          quantity: 5,
          price: 600,
          productDescription:
          "Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the  or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).Cabbage weights generally range from 500 to 1,000 grams (1 to 2 lb). Smooth-leafed, firm-headed green cabbages are the most common, with smooth-leafed purple cabbages and crinkle-leafed savoy cabbages of both colours being rarer. Under conditions of long sunny days, such as those found at high northern latitudes in summer, cabbages can grow quite large. As of 2012, the heaviest cabbage was 62.71 kilograms (138.25 lb). Cabbage heads are generally picked during the first year of the plant's life cycle, but plants intended for seed are allowed to grow a second year and must be kept separate from other cole crops to prevent cross-pollination. Cabbage is prone to several nutrient deficiencies, as well as to multiple pests, and bacterial and fungal diseases.Cabbage was most likely domesticated somewhere in Europe before 1000 BC, although savoys were not developed until the 16th century AD. By the Middle Ages, cabbage had become a prominent part of European cuisine. They can be prepared many different ways for eating; they can be pickled, fermented (for dishes such as sauerkraut), steamed, stewed, sautéed, braised, or eaten raw. Cabbage is a good source of vitamin K, vitamin C and dietary fiber. World production of cabbage and other brassicas for 2018 was 69 million tonnes, with China accounting for 48% of the total.",
          farmer: {
            'name': "Kofi Appiah",
            'farmerId': "F10001",
            'Location': "Old Adokwai",
            'phone': "+233248485308",
            'gender': "Male",
            'img': "assets/images/farmer1.jpg",
          },
          images: [
            "assets/images/tomatoes2.jpg",
            "assets/images/tomatoes1.jpg",
            "assets/images/tomatoes3.jpg"
          ]),
      Market(
          productName: "Fresh Tomatoes",
          measure: "Box",
          productId: "P10001",
          timeStamp: "21st Mar, 2021 - 12:12 Pm",
          quantity: 3,
          price: 200,
          productDescription:
          "Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the  or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).Cabbage weights generally range from 500 to 1,000 grams (1 to 2 lb). Smooth-leafed, firm-headed green cabbages are the most common, with smooth-leafed purple cabbages and crinkle-leafed savoy cabbages of both colours being rarer. Under conditions of long sunny days, such as those found at high northern latitudes in summer, cabbages can grow quite large. As of 2012, the heaviest cabbage was 62.71 kilograms (138.25 lb). Cabbage heads are generally picked during the first year of the plant's life cycle, but plants intended for seed are allowed to grow a second year and must be kept separate from other cole crops to prevent cross-pollination. Cabbage is prone to several nutrient deficiencies, as well as to multiple pests, and bacterial and fungal diseases.Cabbage was most likely domesticated somewhere in Europe before 1000 BC, although savoys were not developed until the 16th century AD. By the Middle Ages, cabbage had become a prominent part of European cuisine. They can be prepared many different ways for eating; they can be pickled, fermented (for dishes such as sauerkraut), steamed, stewed, sautéed, braised, or eaten raw. Cabbage is a good source of vitamin K, vitamin C and dietary fiber. World production of cabbage and other brassicas for 2018 was 69 million tonnes, with China accounting for 48% of the total.",
          farmer: {
            'name': "Kofi Appiah",
            'farmerId': "F10001",
            'Location': "Old Adokwai",
            'phone': "+233248485308",
            'gender': "Male",
            'img': "assets/images/farmer1.jpg",
          },
          images: [
            "assets/images/tomatoes1.jpg",
            "assets/images/tomatoes2.jpg",
            "assets/images/tomatoes3.jpg"
          ]),
      Market(
          productName: "Cabbages",
          measure: "Bags",
          productId: "P10001",
          timeStamp: "21st Mar, 2021 - 12:12 Pm",
          quantity: 5,
          price: 600,
          productDescription:
          "Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the  or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).Cabbage weights generally range from 500 to 1,000 grams (1 to 2 lb). Smooth-leafed, firm-headed green cabbages are the most common, with smooth-leafed purple cabbages and crinkle-leafed savoy cabbages of both colours being rarer. Under conditions of long sunny days, such as those found at high northern latitudes in summer, cabbages can grow quite large. As of 2012, the heaviest cabbage was 62.71 kilograms (138.25 lb). Cabbage heads are generally picked during the first year of the plant's life cycle, but plants intended for seed are allowed to grow a second year and must be kept separate from other cole crops to prevent cross-pollination. Cabbage is prone to several nutrient deficiencies, as well as to multiple pests, and bacterial and fungal diseases.Cabbage was most likely domesticated somewhere in Europe before 1000 BC, although savoys were not developed until the 16th century AD. By the Middle Ages, cabbage had become a prominent part of European cuisine. They can be prepared many different ways for eating; they can be pickled, fermented (for dishes such as sauerkraut), steamed, stewed, sautéed, braised, or eaten raw. Cabbage is a good source of vitamin K, vitamin C and dietary fiber. World production of cabbage and other brassicas for 2018 was 69 million tonnes, with China accounting for 48% of the total.",
          farmer: {
            'name': "Kofi Appiah",
            'farmerId': "F10001",
            'Location': "Old Adokwai",
            'phone': "+233248485308",
            'gender': "Male",
            'img': "assets/images/farmer1.jpg",
          },
          images: [
            "assets/images/cabbage1.jpg",
            "assets/images/cabbage2.jpg",
            "assets/images/cabbage3.jpg"
          ]),
      Market(
          productName: "Healthy Pepper",
          measure: "Basket",
          productId: "P10001",
          timeStamp: "21st Mar, 2021 - 12:12 Pm",
          quantity: 3,
          price: 100,
          productDescription:
          "Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the  or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).Cabbage weights generally range from 500 to 1,000 grams (1 to 2 lb). Smooth-leafed, firm-headed green cabbages are the most common, with smooth-leafed purple cabbages and crinkle-leafed savoy cabbages of both colours being rarer. Under conditions of long sunny days, such as those found at high northern latitudes in summer, cabbages can grow quite large. As of 2012, the heaviest cabbage was 62.71 kilograms (138.25 lb). Cabbage heads are generally picked during the first year of the plant's life cycle, but plants intended for seed are allowed to grow a second year and must be kept separate from other cole crops to prevent cross-pollination. Cabbage is prone to several nutrient deficiencies, as well as to multiple pests, and bacterial and fungal diseases.Cabbage was most likely domesticated somewhere in Europe before 1000 BC, although savoys were not developed until the 16th century AD. By the Middle Ages, cabbage had become a prominent part of European cuisine. They can be prepared many different ways for eating; they can be pickled, fermented (for dishes such as sauerkraut), steamed, stewed, sautéed, braised, or eaten raw. Cabbage is a good source of vitamin K, vitamin C and dietary fiber. World production of cabbage and other brassicas for 2018 was 69 million tonnes, with China accounting for 48% of the total.",
          farmer: {
            'name': "Kofi Appiah",
            'farmerId': "F10001",
            'Location': "Old Adokwai",
            'phone': "+233248485308",
            'gender': "Male",
            'img': "assets/images/farmer1.jpg",
          },
          images: [
            "assets/images/pepper1.jpg",
            "assets/images/pepper2.jpg",
            "assets/images/pepper3.jpg"
          ]),
      Market(
          productName: "Fresh Tomatoes",
          measure: "Box",
          productId: "P10001",
          timeStamp: "21st Mar,2021 - 12:12 Pm",
          quantity: 5,
          price: 600,
          productDescription:
          "Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the  or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).Cabbage weights generally range from 500 to 1,000 grams (1 to 2 lb). Smooth-leafed, firm-headed green cabbages are the most common, with smooth-leafed purple cabbages and crinkle-leafed savoy cabbages of both colours being rarer. Under conditions of long sunny days, such as those found at high northern latitudes in summer, cabbages can grow quite large. As of 2012, the heaviest cabbage was 62.71 kilograms (138.25 lb). Cabbage heads are generally picked during the first year of the plant's life cycle, but plants intended for seed are allowed to grow a second year and must be kept separate from other cole crops to prevent cross-pollination. Cabbage is prone to several nutrient deficiencies, as well as to multiple pests, and bacterial and fungal diseases.Cabbage was most likely domesticated somewhere in Europe before 1000 BC, although savoys were not developed until the 16th century AD. By the Middle Ages, cabbage had become a prominent part of European cuisine. They can be prepared many different ways for eating; they can be pickled, fermented (for dishes such as sauerkraut), steamed, stewed, sautéed, braised, or eaten raw. Cabbage is a good source of vitamin K, vitamin C and dietary fiber. World production of cabbage and other brassicas for 2018 was 69 million tonnes, with China accounting for 48% of the total.",
          farmer: {
            'name': "Kofi Appiah",
            'farmerId': "F10001",
            'Location': "Old Adokwai",
            'phone': "+233248485308",
            'gender': "Male",
            'img': "assets/images/farmer1.jpg",
          },
          images: [
            "assets/images/tomatoes1.jpg",
            "assets/images/tomatoes2.jpg",
            "assets/images/tomatoes3.jpg"
          ]),
      Market(
          productName: "Pepper For Sales",
          measure: "Basket",
          productId: "P10001",
          timeStamp: "21st Mar,2021 - 12:12 Pm",
          quantity: 1,
          price: 50,
          productDescription:
          "Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the  or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).Cabbage weights generally range from 500 to 1,000 grams (1 to 2 lb). Smooth-leafed, firm-headed green cabbages are the most common, with smooth-leafed purple cabbages and crinkle-leafed savoy cabbages of both colours being rarer. Under conditions of long sunny days, such as those found at high northern latitudes in summer, cabbages can grow quite large. As of 2012, the heaviest cabbage was 62.71 kilograms (138.25 lb). Cabbage heads are generally picked during the first year of the plant's life cycle, but plants intended for seed are allowed to grow a second year and must be kept separate from other cole crops to prevent cross-pollination. Cabbage is prone to several nutrient deficiencies, as well as to multiple pests, and bacterial and fungal diseases.Cabbage was most likely domesticated somewhere in Europe before 1000 BC, although savoys were not developed until the 16th century AD. By the Middle Ages, cabbage had become a prominent part of European cuisine. They can be prepared many different ways for eating; they can be pickled, fermented (for dishes such as sauerkraut), steamed, stewed, sautéed, braised, or eaten raw. Cabbage is a good source of vitamin K, vitamin C and dietary fiber. World production of cabbage and other brassicas for 2018 was 69 million tonnes, with China accounting for 48% of the total.",
          farmer: {
            'name': "Kofi Appiah",
            'farmerId': "F10001",
            'Location': "Old Adokwai",
            'phone': "+233248485308",
            'gender': "Male",
            'img': "assets/images/farmer1.jpg",
          },
          images: [
            "assets/images/cabbage3.jpg",
            "assets/images/cabbage1.jpg",
            "assets/images/cabbage2.jpg"
          ]),
      Market(
          productName: "Fresh Tomatoes",
          measure: "Box",
          productId: "P10001",
          timeStamp: "21st Mar, 2021 - 12:12 Pm",
          quantity: 5,
          price: 600,
          productDescription:
          "Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the  or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).Cabbage weights generally range from 500 to 1,000 grams (1 to 2 lb). Smooth-leafed, firm-headed green cabbages are the most common, with smooth-leafed purple cabbages and crinkle-leafed savoy cabbages of both colours being rarer. Under conditions of long sunny days, such as those found at high northern latitudes in summer, cabbages can grow quite large. As of 2012, the heaviest cabbage was 62.71 kilograms (138.25 lb). Cabbage heads are generally picked during the first year of the plant's life cycle, but plants intended for seed are allowed to grow a second year and must be kept separate from other cole crops to prevent cross-pollination. Cabbage is prone to several nutrient deficiencies, as well as to multiple pests, and bacterial and fungal diseases.Cabbage was most likely domesticated somewhere in Europe before 1000 BC, although savoys were not developed until the 16th century AD. By the Middle Ages, cabbage had become a prominent part of European cuisine. They can be prepared many different ways for eating; they can be pickled, fermented (for dishes such as sauerkraut), steamed, stewed, sautéed, braised, or eaten raw. Cabbage is a good source of vitamin K, vitamin C and dietary fiber. World production of cabbage and other brassicas for 2018 was 69 million tonnes, with China accounting for 48% of the total.",
          farmer: {
            'name': "Kofi Appiah",
            'farmerId': "F10001",
            'Location': "Old Adokwai",
            'phone': "+233248485308",
            'gender': "Male",
            'img': "assets/images/farmer1.jpg",
          },
          images: [
            "assets/images/tomatoes2.jpg",
            "assets/images/tomatoes1.jpg",
            "assets/images/tomatoes3.jpg"
          ]),
      Market(
          productName: "Fresh Tomatoes",
          measure: "Box",
          productId: "P10001",
          timeStamp: "21st Mar, 2021 - 12:12 Pm",
          quantity: 3,
          price: 200,
          productDescription:
          "Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the  or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).Cabbage weights generally range from 500 to 1,000 grams (1 to 2 lb). Smooth-leafed, firm-headed green cabbages are the most common, with smooth-leafed purple cabbages and crinkle-leafed savoy cabbages of both colours being rarer. Under conditions of long sunny days, such as those found at high northern latitudes in summer, cabbages can grow quite large. As of 2012, the heaviest cabbage was 62.71 kilograms (138.25 lb). Cabbage heads are generally picked during the first year of the plant's life cycle, but plants intended for seed are allowed to grow a second year and must be kept separate from other cole crops to prevent cross-pollination. Cabbage is prone to several nutrient deficiencies, as well as to multiple pests, and bacterial and fungal diseases.Cabbage was most likely domesticated somewhere in Europe before 1000 BC, although savoys were not developed until the 16th century AD. By the Middle Ages, cabbage had become a prominent part of European cuisine. They can be prepared many different ways for eating; they can be pickled, fermented (for dishes such as sauerkraut), steamed, stewed, sautéed, braised, or eaten raw. Cabbage is a good source of vitamin K, vitamin C and dietary fiber. World production of cabbage and other brassicas for 2018 was 69 million tonnes, with China accounting for 48% of the total.",
          farmer: {
            'name': "Kofi Appiah",
            'farmerId': "F10001",
            'Location': "Old Adokwai",
            'phone': "+233248485308",
            'gender': "Male",
            'img': "assets/images/farmer1.jpg",
          },
          images: [
            "assets/images/tomatoes1.jpg",
            "assets/images/tomatoes2.jpg",
            "assets/images/tomatoes3.jpg"
          ]),
      Market(
          productName: "Cabbages",
          measure: "Bags",
          productId: "P10001",
          timeStamp: "21st Mar, 2021 - 12:12 Pm",
          quantity: 5,
          price: 600,
          productDescription:
          "Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the  or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).Cabbage weights generally range from 500 to 1,000 grams (1 to 2 lb). Smooth-leafed, firm-headed green cabbages are the most common, with smooth-leafed purple cabbages and crinkle-leafed savoy cabbages of both colours being rarer. Under conditions of long sunny days, such as those found at high northern latitudes in summer, cabbages can grow quite large. As of 2012, the heaviest cabbage was 62.71 kilograms (138.25 lb). Cabbage heads are generally picked during the first year of the plant's life cycle, but plants intended for seed are allowed to grow a second year and must be kept separate from other cole crops to prevent cross-pollination. Cabbage is prone to several nutrient deficiencies, as well as to multiple pests, and bacterial and fungal diseases.Cabbage was most likely domesticated somewhere in Europe before 1000 BC, although savoys were not developed until the 16th century AD. By the Middle Ages, cabbage had become a prominent part of European cuisine. They can be prepared many different ways for eating; they can be pickled, fermented (for dishes such as sauerkraut), steamed, stewed, sautéed, braised, or eaten raw. Cabbage is a good source of vitamin K, vitamin C and dietary fiber. World production of cabbage and other brassicas for 2018 was 69 million tonnes, with China accounting for 48% of the total.",
          farmer: {
            'name': "Kofi Appiah",
            'farmerId': "F10001",
            'Location': "Old Adokwai",
            'phone': "+233248485308",
            'gender': "Male",
            'img': "assets/images/farmer1.jpg",
          },
          images: [
            "assets/images/cabbage1.jpg",
            "assets/images/cabbage2.jpg",
            "assets/images/cabbage3.jpg"
          ]),
      Market(
          productName: "Healthy Pepper",
          measure: "Basket",
          productId: "P10001",
          timeStamp: "21st Mar, 2021 - 12:12 Pm",
          quantity: 3,
          price: 100,
          productDescription:
          "Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the  or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).Cabbage weights generally range from 500 to 1,000 grams (1 to 2 lb). Smooth-leafed, firm-headed green cabbages are the most common, with smooth-leafed purple cabbages and crinkle-leafed savoy cabbages of both colours being rarer. Under conditions of long sunny days, such as those found at high northern latitudes in summer, cabbages can grow quite large. As of 2012, the heaviest cabbage was 62.71 kilograms (138.25 lb). Cabbage heads are generally picked during the first year of the plant's life cycle, but plants intended for seed are allowed to grow a second year and must be kept separate from other cole crops to prevent cross-pollination. Cabbage is prone to several nutrient deficiencies, as well as to multiple pests, and bacterial and fungal diseases.Cabbage was most likely domesticated somewhere in Europe before 1000 BC, although savoys were not developed until the 16th century AD. By the Middle Ages, cabbage had become a prominent part of European cuisine. They can be prepared many different ways for eating; they can be pickled, fermented (for dishes such as sauerkraut), steamed, stewed, sautéed, braised, or eaten raw. Cabbage is a good source of vitamin K, vitamin C and dietary fiber. World production of cabbage and other brassicas for 2018 was 69 million tonnes, with China accounting for 48% of the total.",
          farmer: {
            'name': "Kofi Appiah",
            'farmerId': "F10001",
            'Location': "Old Adokwai",
            'phone': "+233248485308",
            'gender': "Male",
            'img': "assets/images/farmer1.jpg",
          },
          images: [
            "assets/images/pepper1.jpg",
            "assets/images/pepper2.jpg",
            "assets/images/pepper3.jpg"
          ])
    ];
    return data;
  }

  static List<Farms> farmsData() {
    return [
      Farms(
          farmId: "F10001",
          farmerId: "10001",
          farmSize: 20.6,
          cropType: ["Cabbage", "Green Pepper", "Watermelon"],
          images: [
            "assets/plants/crop1.png",
            "assets/plants/crop2.jpg",
            "assets/plants/crop3.jpg",
            "assets/plants/crop4.jpg"
          ],
          location: "Kwesi Mintim",
          description:
              "The public is providing more than 1m per minute in global farm subsidies, much of which is driving the climate crisis and destruction of wildlife, according to a new report.",
          farmState: [
            {
              'stamp': "20/02/21",
              'state': "Land Clearing",
              'input': "Cutlass, Herbicides"
            },
            {'stamp': "03/03/21", 'state': "Planting"},
            {
              'stamp': "14/04/21",
              'state': "First Fertilizer",
              'input': "N:P:K 15,15,15"
            },
            {
              'stamp': "20/05/21",
              'state': "Second Fertilizer",
              'input': "Asasewura Fertilizer"
            },
            {
              'stamp': "10/06/21",
              'state': "Harvesting",
              'input': "Combine Harvester"
            }
          ]),
      Farms(
          farmId: "F10002",
          farmerId: "10001",
          farmSize: 11.6,
          cropType: ["Cabbage", "Pepper"],
          images: [
            "assets/plants/crop3.jpg",
            "assets/plants/crop7.jpg",
            "assets/plants/crop6.jpg",
            "assets/plants/crop4.jpg"
          ],
          location: "Kwaku Kurom",
          description:
              "The public is providing more than 1m per minute in global farm subsidies, much of which is driving the climate crisis and destruction of wildlife, according to a new report.",
          farmState: [
            {
              'stamp': "20/02/21",
              'state': "Land Clearing",
              'input': "Cutlass, Herbicides"
            },
            {'stamp': "03/03/21", 'state': "Planting"},
            {
              'stamp': "14/04/21",
              'state': "First Fertilizer",
              'input': "N:P:K 15,15,15"
            },
            {
              'stamp': "20/05/21",
              'state': "Second Fertilizer",
              'input': "Asasewura Fertilizer"
            },
            {
              'stamp': "10/06/21",
              'state': "Harvesting",
              'input': "Combine Harvester"
            }
          ]),
      Farms(
          farmId: "F10003",
          farmerId: "10003",
          farmSize: 4,
          cropType: ["Watermelon"],
          images: [
            "assets/plants/crop4.jpg",
            "assets/plants/crop5.jpg",
            "assets/plants/crop3.jpg",
            "assets/plants/crop4.jpg"
          ],
          location: " Old Ayaase",
          description:
              "The public is providing more than 1m per minute in global farm subsidies, much of which is driving the climate crisis and destruction of wildlife, according to a new report.",
          farmState: [
            {
              'stamp': "20/02/21",
              'state': "Land Clearing",
              'input': "Cutlass, Herbicides"
            },
            {'stamp': "03/03/21", 'state': "Planting"},
            {
              'stamp': "14/04/21",
              'state': "First Fertilizer",
              'input': "N:P:K 15,15,15"
            },
            {
              'stamp': "20/05/21",
              'state': "Second Fertilizer",
              'input': "Asasewura Fertilizer"
            },
            {
              'stamp': "10/06/21",
              'state': "Harvesting",
              'input': "Combine Harvester"
            }
          ]),
      Farms(
          farmId: "F10004",
          farmerId: "10001",
          farmSize: 11.0,
          cropType: ["Cabbage"],
          images: [
            "assets/plants/crop1.png",
            "assets/plants/crop2.jpg",
            "assets/plants/crop3.jpg",
            "assets/plants/crop4.jpg"
          ],
          location: "Dunkyea",
          description: "",
          farmState: [
            {
              'stamp': "20/02/21",
              'state': "Land Clearing",
              'input': "Cutlass, Herbicides"
            },
            {'stamp': "03/03/21", 'state': "Planting"},
            {
              'stamp': "14/04/21",
              'state': "First Fertilizer",
              'input': "N:P:K 15,15,15"
            },
            {
              'stamp': "20/05/21",
              'state': "Second Fertilizer",
              'input': "Asasewura Fertilizer"
            },
            {
              'stamp': "10/06/21",
              'state': "Harvesting",
              'input': "Combine Harvester"
            }
          ]),
      Farms(
          farmId: "F10005",
          farmerId: "10006",
          farmSize: 14.6,
          cropType: ["Rice"],
          images: [
            "assets/plants/crop7.jpg",
            "assets/plants/crop1.jpg",
            "assets/plants/crop3.jpg",
            "assets/plants/crop4.jpg"
          ],
          location: "Manso",
          description:
              "The public is providing more than 1m per minute in global farm subsidies, much of which is driving the climate crisis and destruction of wildlife, according to a new report.",
          farmState: [
            {
              'stamp': "20/02/21",
              'state': "Land Clearing",
              'input': "Cutlass, Herbicides"
            },
            {'stamp': "03/03/21", 'state': "Planting"},
            {
              'stamp': "14/04/21",
              'state': "First Fertilizer",
              'input': "N:P:K 15,15,15"
            },
            {
              'stamp': "20/05/21",
              'state': "Second Fertilizer",
              'input': "Asasewura Fertilizer"
            },
            {
              'stamp': "10/06/21",
              'state': "Harvesting",
              'input': "Combine Harvester"
            }
          ]),
      Farms(
          farmId: "F10006",
          farmerId: "10009",
          farmSize: 3,
          cropType: ["Green Pepper", "Carrot"],
          images: [
            "assets/plants/crop4.jpg",
            "assets/plants/crop3.jpg",
            "assets/plants/crop6.jpg",
            "assets/plants/crop7.jpg"
          ],
          location: "Dada Mu",
          description:
              "The public is providing more than 1m per minute in global farm subsidies, much of which is driving the climate crisis and destruction of wildlife, according to a new report.",
          farmState: [
            {
              'stamp': "20/02/21",
              'state': "Land Clearing",
              'input': "Cutlass, Herbicides"
            },
            {'stamp': "03/03/21", 'state': "Planting"},
            {
              'stamp': "14/04/21",
              'state': "First Fertilizer",
              'input': "N:P:K 15,15,15"
            },
            {
              'stamp': "20/05/21",
              'state': "Second Fertilizer",
              'input': "Asasewura Fertilizer"
            },
            {
              'stamp': "10/06/21",
              'state': "Harvesting",
              'input': "Combine Harvester"
            }
          ]),
      Farms(
          farmId: "F10007",
          farmerId: "10010",
          farmSize: 7.6,
          cropType: ["Carrot"],
          images: [
            "assets/plants/crop4.jpg",
            "assets/plants/crop2.jpg",
            "assets/plants/crop3.jpg",
            "assets/plants/crop5.jpg"
          ],
          location: "Akrokeri",
          description:
              "The public is providing more than 1m per minute in global farm subsidies, much of which is driving the climate crisis and destruction of wildlife, according to a new report.",
          farmState: [
            {
              'stamp': "20/02/21",
              'state': "Land Clearing",
              'input': "Cutlass, Herbicides"
            },
            {'stamp': "03/03/21", 'state': "Planting"},
            {
              'stamp': "14/04/21",
              'state': "First Fertilizer",
              'input': "N:P:K 15,15,15"
            },
            {
              'stamp': "20/05/21",
              'state': "Second Fertilizer",
              'input': "Asasewura Fertilizer"
            },
            {
              'stamp': "10/06/21",
              'state': "Harvesting",
              'input': "Combine Harvester"
            }
          ]),
      Farms(
          farmId: "F10008",
          farmerId: "10011",
          farmSize: 5,
          cropType: ["Maize"],
          images: [
            "assets/plants/crop6.jpg",
            "assets/plants/crop2.jpg",
            "assets/plants/crop3.jpg",
            "assets/plants/crop1.png"
          ],
          location: "Ahensan",
          description:
              "The public is providing more than 1m per minute in global farm subsidies, much of which is driving the climate crisis and destruction of wildlife, according to a new report.",
          farmState: [
            {
              'stamp': "20/02/21",
              'state': "Land Clearing",
              'input': "Cutlass, Herbicides"
            },
            {'stamp': "03/03/21", 'state': "Planting"},
            {
              'stamp': "14/04/21",
              'state': "First Fertilizer",
              'input': "N:P:K 15,15,15"
            },
            {
              'stamp': "20/05/21",
              'state': "Second Fertilizer",
              'input': "Asasewura Fertilizer"
            },
            {
              'stamp': "10/06/21",
              'state': "Harvesting",
              'input': "Combine Harvester"
            }
          ]),
      Farms(
          farmId: "F10009",
          farmerId: "10005",
          farmSize: 9.2,
          cropType: ["Cabbage", "Green Pepper", "Watermelon"],
          images: [
            "assets/plants/crop1.png",
            "assets/plants/crop2.jpg",
            "assets/plants/crop3.jpg",
            "assets/plants/crop1.png"
          ],
          location: "Ahensan",
          description:
              "The public is providing more than 1m per minute in global farm subsidies, much of which is driving the climate crisis and destruction of wildlife, according to a new report.",
          farmState: [
            {
              'stamp': "20/02/21",
              'state': "Land Clearing",
              'input': "Cutlass, Herbicides"
            },
            {'stamp': "03/03/21", 'state': "Planting"},
            {
              'stamp': "14/04/21",
              'state': "First Fertilizer",
              'input': "N:P:K 15,15,15"
            },
            {
              'stamp': "20/05/21",
              'state': "Second Fertilizer",
              'input': "Asasewura Fertilizer"
            },
            {
              'stamp': "10/06/21",
              'state': "Harvesting",
              'input': "Combine Harvester"
            }
          ]),
      Farms(
          farmId: "F10010",
          farmerId: "10007",
          farmSize: 2,
          cropType: ["Carrot"],
          images: [
            "assets/plants/crop4.jpg",
            "assets/plants/crop2.jpg",
            "assets/plants/crop3.jpg",
            "assets/plants/crop1.png"
          ],
          location: "Ahensan",
          description:
              "The public is providing more than 1m per minute in global farm subsidies, much of which is driving the climate crisis and destruction of wildlife, according to a new report.",
          farmState: [
            {
              'stamp': "20/02/21",
              'state': "Land Clearing",
              'input': "Cutlass, Herbicides"
            },
            {'stamp': "03/03/21", 'state': "Planting"},
            {
              'stamp': "14/04/21",
              'state': "First Fertilizer",
              'input': "N:P:K 15,15,15"
            },
            {
              'stamp': "20/05/21",
              'state': "Second Fertilizer",
              'input': "Asasewura Fertilizer"
            },
            {
              'stamp': "10/06/21",
              'state': "Harvesting",
              'input': "Combine Harvester"
            }
          ]),
      Farms(
          farmId: "F10011",
          farmerId: "10005",
          farmSize: 3,
          cropType: ["Cabbage", "Green Pepper", "Watermelon"],
          images: [
            "assets/plants/crop3.jpg",
            "assets/plants/crop1.png",
            "assets/plants/crop3.jpg",
            "assets/plants/crop4.jpg"
          ],
          location: "Ahensan",
          description:
              "The public is providing more than 1m per minute in global farm subsidies, much of which is driving the climate crisis and destruction of wildlife, according to a new report.",
          farmState: [
            {
              'stamp': "20/02/21",
              'state': "Land Clearing",
              'input': "Cutlass, Herbicides"
            },
            {'stamp': "03/03/21", 'state': "Planting"},
            {
              'stamp': "14/04/21",
              'state': "First Fertilizer",
              'input': "N:P:K 15,15,15"
            },
            {
              'stamp': "20/05/21",
              'state': "Second Fertilizer",
              'input': "Asasewura Fertilizer"
            },
            {
              'stamp': "10/06/21",
              'state': "Harvesting",
              'input': "Combine Harvester"
            }
          ])
    ];
  }

  static List<Comments> someComments() {
    return [
      //Comments(senderName, senderId, senderImage, message, postId, timeStamp, messageImages)
    ];
  }

  static List<Community> communityData() {
    return [
      Community(
        userImage: "assets/images/farmer1.jpg",
        images: [
          "assets/images/DSC_0194-e1399462629842.jpg",
          "assets/plants/crop2.jpg",
          "assets/images/DSC_0194-e1399462629842.jpg",
          "assets/plants/crop1.png"
        ],
        relatedCrop: "Cabbage",
        name: "Kofi Nti",
        location: "Kwaku Kurom",
        occupation: "Farmer",
        question: "What is wrong with my plants?",
        description:
            "My Cabbage Leaves has turn yellowish at matured stage as seen from the picture. I would like to find out what is happening to the plants.",
        date: "10th March 2021",
      ),
      Community(
        userImage: "assets/images/farmer1.jpg",
        images: [
          "assets/images/DSC_0194-e1399462629842.jpg",
          "assets/plants/crop2.jpg",
          "assets/images/DSC_0194-e1399462629842.jpg",
          "assets/plants/crop1.png"
        ],
        relatedCrop: "Beans",
        name: "Kofi Nti",
        location: "Kwaku Kurom",
        occupation: "Farmer",
        question: "What is wrong with my plants?",
        description:
            "My Cabbage Leaves has turn yellowish at matured stage as seen from the picture. I would like to find out what is happening to the plants.",
        date: "10th March 2021",
      ),
      Community(
        userImage: "assets/images/farmer1.jpg",
        images: [
          "assets/images/DSC_0194-e1399462629842.jpg",
          "assets/plants/crop2.jpg",
          "assets/images/DSC_0194-e1399462629842.jpg",
          "assets/plants/crop1.png"
        ],
        relatedCrop: "Cassava",
        name: "Kofi Nti",
        location: "Kwaku Kurom",
        occupation: "Farmer",
        question: "What is wrong with my plants?",
        description:
            "My Cabbage Leaves has turn yellowish at matured stage as seen from the picture. I would like to find out what is happening to the plants.",
        date: "10th March 2021",
      ),
      Community(
        userImage: "assets/images/farmer1.jpg",
        images: [
          "assets/images/DSC_0194-e1399462629842.jpg",
          "assets/plants/crop2.jpg",
          "assets/images/DSC_0194-e1399462629842.jpg",
          "assets/plants/crop1.png"
        ],
        relatedCrop: "Cocoa",
        name: "Kofi Nti",
        location: "Kwaku Kurom",
        occupation: "Farmer",
        question: "What is wrong with my plants?",
        description:
            "My Cabbage Leaves has turn yellowish at matured stage as seen from the picture. I would like to find out what is happening to the plants.",
        date: "10th March 2021",
      ),
      Community(
        userImage: "assets/images/farmer1.jpg",
        images: [
          "assets/images/DSC_0194-e1399462629842.jpg",
          "assets/plants/crop2.jpg",
          "assets/images/DSC_0194-e1399462629842.jpg",
          "assets/plants/crop1.png"
        ],
        relatedCrop: "Cabbage",
        name: "Kofi Nti",
        location: "Kwaku Kurom",
        occupation: "Farmer",
        question: "What is wrong with my plants?",
        description:
            "My Cabbage Leaves has turn yellowish at matured stage as seen from the picture. I would like to find out what is happening to the plants.",
        date: "10th March 2021",
      ),
      Community(
        userImage: "assets/images/farmer1.jpg",
        images: [
          "assets/images/DSC_0194-e1399462629842.jpg",
          "assets/plants/crop2.jpg",
          "assets/images/DSC_0194-e1399462629842.jpg",
          "assets/plants/crop1.png"
        ],
        relatedCrop: "Perper",
        name: "Kofi Nti",
        location: "Kwaku Kurom",
        occupation: "Farmer",
        question: "What is wrong with my plants?",
        description:
            "My Cabbage Leaves has turn yellowish at matured stage as seen from the picture. I would like to find out what is happening to the plants.",
        date: "10th March 2021",
      ),
      Community(
        userImage: "assets/images/farmer1.jpg",
        images: [
          "assets/images/DSC_0194-e1399462629842.jpg",
          "assets/plants/crop2.jpg",
          "assets/images/DSC_0194-e1399462629842.jpg",
          "assets/plants/crop1.png"
        ],
        relatedCrop: "Tomatoes",
        name: "Kofi Nti",
        location: "Kwaku Kurom",
        occupation: "Farmer",
        question: "What is wrong with my plants?",
        description:
            "My Cabbage Leaves has turn yellowish at matured stage as seen from the picture. I would like to find out what is happening to the plants.",
        date: "10th March 2021",
      ),
      Community(
        userImage: "assets/images/farmer1.jpg",
        images: [
          "assets/images/DSC_0194-e1399462629842.jpg",
          "assets/plants/crop2.jpg",
          "assets/images/DSC_0194-e1399462629842.jpg",
          "assets/plants/crop1.png"
        ],
        relatedCrop: "Cabbage",
        name: "Kofi Nti",
        location: "Kwaku Kurom",
        occupation: "Farmer",
        question: "What is wrong with my plants?",
        description:
            "My Cabbage Leaves has turn yellowish at matured stage as seen from the picture. I would like to find out what is happening to the plants.",
        date: "10th March 2021",
        //         comments: [
        //           {
        //           'id': "CM10001",
        //           'name': "Isaac Boateng",
        //           'message':
        //           "This disease is called brigting. please go to the disease list to read more abou it",
        //           'timeStamp': "10th March,2021 @ 10:15 AM",
        //           'senderId': "FM10002",
        //           'location': "Old Ayaase",
        //           'occupation': "Farmer",
        //           'senderImage': "assets/images/farmer6.jpg",
        //           },
        //           {
        //             'id': "CM10002",
        //             'name': "Frimpong Nyamaah",
        //             'message':
        //                 "This disease is called brigting. please go to the disease list to read more abou it",
        //             'timeStamp': "11th March,2021 @ 02:15 PM",
        //             'senderId': "FM10003",
        //             'location': "Dompoasi",
        //             'occupation': "Investor",
        //             'senderImage': "assets/images/farmer4.jpg",
        // },
        //           {
        //                     'id': "CM10003",
        //                     'name': "Frank Castle",
        //                     'message':
        //                         "This disease is called brigting. please go to the disease list to read more abou it",
        //                     'timeStamp': "18th March,2021 @ 09:15 AM",
        //                     'senderId': "FM10005",
        //                     'location': "Old Akrofuom",
        //                     'occupation': "Farmer",
        //                     'senderImage': "assets/images/farmer1.jpg",
        //         }
        //         ]
      )
    ];
  }
}
