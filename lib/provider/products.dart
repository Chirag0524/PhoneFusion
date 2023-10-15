import 'package:flutter/material.dart';
import 'package:PhoneFusion/models/product.dart';

class Products with ChangeNotifier{
  final List<Product> _products =[
  Product(
  id: 'Samsung1',
  title: 'Samsung S20',
  description: 'The Samsung Galaxy S20 is a flagship smartphone that was released in February 2020. It features a 6.2-inch Dynamic AMOLED display with a high resolution and vibrant colors. The phone is powered by either the Qualcomm Snapdragon 865 or Samsungs Exynos 990 chipset, depending on the region.',
  price: 49990,
  imageUrl:'https://www.mistershopking.com/8716/samsung-galaxy-s20-g980f-8gb-128gb-dual-sim-grey-brand-operatore-italia.jpg',
  brand: 'Samsung',
  productCategoryName: 'Phones',
  quantity: 10,
  isPopular:true),
  Product(
  id: 'Samsung2',
  title: 'Samsung S10',
  description: 'The Samsung Galaxy S10 is a premium smartphone that was released in March 2019. It was part of Samsungs flagship Galaxy S series.The Galaxy S10 features a 6.1-inch Dynamic AMOLED display. ',
  price: 19999,
  imageUrl:'https://i.ebayimg.com/images/g/mgoAAOSwRA9dcVqV/s-l400.jpg',
  brand: 'Samsung',
  productCategoryName: 'Phones',
  quantity: 5,
  isPopular:false),
  Product(
  id: 'Oneplus1',
  title: 'Oneplus 8 Pro',
  description: 'The OnePlus 8 Pro is a premium Android smartphone that was released in April 2020 by OnePlus.The OnePlus 8 Pro features a 6.78-inch Fluid AMOLED display with a high Quad HD+ resolution and a 120Hz refresh rate.The phone supports 5G connectivity, allowing for faster download and browsing speeds where 5G networks are available.The phone is powered by the Qualcomm Snapdragon 865 chipset, providing excellent performance for demanding tasks, gaming, and multitasking.It comes with a sizable 4,510mAh battery, which offers strong battery life and supports Warp Charge 30T fast charging, as well as Warp Charge 30 Wireless for wireless charging.',
  price: 54999,
  imageUrl:'https://i5.walmartimages.com/asr/cf27cc77-bfe1-4734-b22c-e573d1992057.86fe7b82a949e55899b8ea899ba403e1.jpeg',
  brand: 'Oneplus',
  productCategoryName: 'Phones',
  quantity: 3,
  isPopular:false),
    Product(
        id: 'Oneplus2',
        title: 'Oneplus 11 ',
        description: 'The OnePlus 8 Pro is a premium Android smartphone that was released in April 2020 by OnePlus.The OnePlus 8 Pro features a 6.78-inch Fluid AMOLED display with a high Quad HD+ resolution and a 120Hz refresh rate.The phone supports 5G connectivity, allowing for faster download and browsing speeds where 5G networks are available.The phone is powered by the Qualcomm Snapdragon 865 chipset, providing excellent performance for demanding tasks, gaming, and multitasking.It comes with a sizable 4,510mAh battery, which offers strong battery life and supports Warp Charge 30T fast charging, as well as Warp Charge 30 Wireless for wireless charging.',
        price: 57599,
        imageUrl:'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/y/w/u/11-5g-b0bqjmrxqv-oneplus-original-imagmugybrzcf9qj.jpeg?q=70',
        brand: 'Oneplus',
        productCategoryName: 'Phones',
        quantity: 3,
        isPopular:false),
  Product(
  id: 'Iphone1',
  title: 'Iphone 14 Pro Max',
  description: 'A 6.7-inch OLED display with 120Hz ProMotion refresh rate and a pill-shaped notch.A 48MP ProRAW camera with Action mode and 4K Cinematic mode.Crash Detection and Emergency SOS via satellite for safety',
  price: 129999,
  imageUrl:'https://www.iphone-droid.net/spec/wp-content/uploads/2022/09/iPhone-14-Pro-Max-Deep-Purple-1024x1024.jpg',
  brand: 'Apple',
  productCategoryName: 'Phones',
  quantity: 5,
  isPopular:true),
    Product(
        id: 'Iphone2',
        title: 'Iphone 15',
        description: 'A 6.7-inch OLED display with 120Hz ProMotion refresh rate and a pill-shaped notch.A 48MP ProRAW camera with Action mode and 4K Cinematic mode.Crash Detection and Emergency SOS via satellite for safety',
        price: 69999,
        imageUrl:'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/f/l/g/-original-imagtc5frtz9j7tb.jpeg?q=70',
        brand: 'Apple',
        productCategoryName: 'Phones',
        quantity: 5,
        isPopular:true),
    Product(
        id: 'Realme1',
        title: 'Realme 11 Pro+ 5g',
        description: 'A 6.7-inch OLED display with 120Hz ProMotion refresh rate and a pill-shaped notch.A 48MP ProRAW camera with Action mode and 4K Cinematic mode.Crash Detection and Emergency SOS via satellite for safety',
        price: 25999,
        imageUrl:'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/t/k/m/11-pro-5g-rmx3741-realme-original-imagq6asfa6hg5eu.jpeg?q=70',
        brand: 'Realme',
        productCategoryName: 'Phones',
        quantity: 5,
        isPopular:true),
    Product(
        id: 'Samsung3',
        title: 'Samsung Galaxy Z Fold4 5G',
        description: 'The Samsung Galaxy S10 is a premium smartphone that was released in March 2019. It was part of Samsungs flagship Galaxy S series.The Galaxy S10 features a 6.1-inch Dynamic AMOLED display. ',
        price: 99999,
        imageUrl:'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/f/n/h/-original-imagh7nzh2gcdj2x.jpeg?q=70',
        brand: 'Samsung',
        productCategoryName: 'Phones',
        quantity: 3,
        isPopular:false),
    Product(
        id: 'SamsungB1',
        title: 'Samsung Buds Pro',
        description: 'Best-sounding earbuds yet.Convenient and reliable noise cancellation.IPX7 waterproof and suitable for exercising.Carrying case is compatible with wireless charging.Aerodynamic design and snug inner-ear fit',
        price: 9999,
        imageUrl:'https://static.bhphoto.com/images/images500x500/samsung_sm_r190nzvalta_r190_galaxy_buds_pro_1628174140_1654546.jpg',
        brand: 'Samsung',
        productCategoryName: 'Headsets',
        quantity: 2,
        isPopular:false),
    Product(
        id: 'AppleB1',
        title: 'Apple Buds Pro',
        description: 'Dual beamforming microphones.Inward-facing microphone.Skin-detect sensor.Motion-detecting accelerometer.Speech-detecting accelerometer',
        price: 24999,
        imageUrl:'https://i.pinimg.com/736x/9f/0a/c8/9f0ac8b936d62227a859fb1a9dcfcb98.jpg',
        brand: 'Apple',
        productCategoryName: 'Headsets',
        quantity: 5,
        isPopular:true),
    Product(
        id: 'OneplusB1',
        title: 'OnePlus Nord Buds 2',
        description: 'Dual beamforming microphones.Inward-facing microphone.Skin-detect sensor.Motion-detecting accelerometer.Speech-detecting accelerometer',
        price: 2499,
        imageUrl:'https://rukminim2.flixcart.com/image/416/416/xif0q/headphone/0/v/m/nord-buds-2-oneplus-original-imagnwf7sgjetqwg.jpeg?q=70',
        brand: 'Oneplus',
        productCategoryName: 'Headsets',
        quantity: 2,
        isPopular:false),
    Product(
        id: 'RealmeB1',
        title: 'Realme Buds Wireless 3 ',
        description: 'Dual beamforming microphones.Inward-facing microphone.Skin-detect sensor.Motion-detecting accelerometer.Speech-detecting accelerometer',
        price: 1699,
        imageUrl:'https://rukminim2.flixcart.com/image/416/416/xif0q/headphone/t/4/p/-original-imagrddw8rpjwfag.jpeg?q=70',
        brand: 'Realme',
        productCategoryName: 'Headsets',
        quantity: 2,
        isPopular:false),
    Product(
        id: 'OneplusPB1',
        title: 'Oneplus Power Bank',
        description: '10000mAh Power and supports 18w fast charging for oneplus devices.',
        price: 999,
        imageUrl:'https://www.technobugg.com/wp-content/uploads/2020/10/op.png',
        brand: 'Oneplus',
        productCategoryName: 'Power Banks',
        quantity: 5,
        isPopular:false),
    Product(
        id: 'RealmePB1',
        title: 'Realme Power Bank',
        description: '10000mAh Power and supports 18w fast charging for oneplus devices.',
        price: 1999,
        imageUrl:'https://rukminim2.flixcart.com/image/416/416/xif0q/power-bank/u/w/e/-original-imagtsa4netcckfy.jpeg?q=70',
        brand: 'Realme',
        productCategoryName: 'Power Banks',
        quantity: 2,
        isPopular:false),
    Product(
        id: 'MiPB1',
        title: 'Mi 3i 20000 mAh Power Bank',
        description: '20000mAh Power and supports 18w fast charging for oneplus devices.',
        price: 1949,
        imageUrl:'https://rukminim2.flixcart.com/image/416/416/kfcv6vk0/power-bank/r/f/5/power-bank-20000-plm18zm-mi-original-imafvtc7x9zgrzbz.jpeg?q=70',
        brand: 'Mi',
        productCategoryName: 'Power Banks',
        quantity: 3,
        isPopular:false),
    Product(
        id: 'BoatPB1',
        title: 'boAt 10000 mAh Power Bank',
        description: '10000mAh Power and supports 22.5w fast charging for oneplus devices.',
        price: 999,
        imageUrl:'https://rukminim2.flixcart.com/image/416/416/xif0q/power-bank/4/b/n/-original-imagrnfxqemb9hen.jpeg?q=70',
        brand: 'Boat',
        productCategoryName: 'Power Banks',
        quantity: 3,
        isPopular:false),
    Product(
        id: 'CC1',
        title: 'Samsung Charger and Cable',
        description: '20W charger and Type-C to Type-A cable',
        price: 1499,
        imageUrl:'https://i5.walmartimages.com/asr/724c454e-825c-463b-9043-77b203eab4e8.4bdc6597a51ecf647977dcb42c706302.jpeg',
        brand: 'Samsung',
        productCategoryName: 'Cables & Chargers',
        quantity: 5,
        isPopular:false),
    Product(
        id: 'CC2',
        title: 'Apple 20W',
        description: 'USB-C Power Charging Adapter for iPhone, iPad & AirPods(White)',
        price: 1699,
        imageUrl:'https://rukminim2.flixcart.com/image/416/416/xif0q/battery-charger/u/b/p/-original-imagqjh6gg35h7hz.jpeg?q=70',
        brand: 'Apple',
        productCategoryName: 'Cables & Chargers',
        quantity: 4,
        isPopular:false),
    Product(
        id: 'CC3',
        title: 'Boat 18W',
        description: '18W Power WCD QC3A Charger combo (Type C - Cable Included) (White, Cable Included)',
        price: 399,
        imageUrl:'https://rukminim2.flixcart.com/image/416/416/kdoup3k0/battery-charger/r/q/b/boat-wcd-qc3a-with-type-c-cable-original-imafugptqajqhm7r.jpeg?q=70',
        brand: 'Boat',
        productCategoryName: 'Cables & Chargers',
        quantity: 4,
        isPopular:false),
    Product(
        id: 'C&C1',
        title: 'Oneplus 8 Pro Avengers Cover ',
        description: 'Hard Plastic Cover and fully protected from edges',
        price: 499,
        imageUrl:'https://images.bewakoof.com/t540/avengers-trio-oneplus-8-pro-mobile-cover-avl-oneplus-8-pro-mobile-covers-305569-1606287113.jpg',
        brand: 'Oneplus',
        productCategoryName: 'Cases & Covers',
        quantity: 5,
        isPopular:false),
    Product(
        id: 'C&C2',
        title: 'Iphone 13 Back Cover ',
        description: 'Transparent Magsafe Back Cover for Apple iPhone 13 - Stylish, durable, and functional. Transparent case with strong magnetic lock and built-in magnets for easy wireless charging. Protects against spills, shocks, and scratches. Precise openings for full device access. Scratch-resistant acrylic back showcases iPhones style.',
        price: 296,
        imageUrl:'https://rukminim2.flixcart.com/image/416/416/xif0q/cases-covers/o/u/b/-original-imagsz34mjw5prxg.jpeg?q=70',
        brand: 'Apple',
        productCategoryName: 'Cases & Covers',
        quantity: 3,
        isPopular:false),
    Product(
        id: 'C&C3',
        title: 'Samsung S22 Multiolor back cover ',
        description: '100% brand new high quality soft Silicone Cases.* Ultra Thin Soft TPU Case Cover Protective Shell Skins.* Anti-dust /anti-impact/Shock-absorption, Lightweight, comfortable , special design ,* easy access to all buttons, controls & ports without having to remove the case* Protect your phone from dust fingerprints, dents , scratches and bumps, * Provides maximum protection from scratches and scrapes.',
        price: 249,
        imageUrl:'https://rukminim2.flixcart.com/image/416/416/xif0q/shopsy-cases-covers/e/i/d/2-sam-s22-1036-xyz-back-cover-7printzone-original-imagjvg6wrfcpbsx.jpeg?q=70',
        brand: 'Samsung',
        productCategoryName: 'Cases & Covers',
        quantity: 4,
        isPopular:false),
    Product(
        id: 'C&C4',
        title: 'Oneplus 11 Back Cover ',
        description: 'Glass Phone Covers are the most protective, sleek and fun cases ever for your OnePlus 11. These cover feature a glass back and it looks super cool, slim and stylish. OnePlus 11 Glass back case is 100% compatible with wireless charging without the necessity of removing the case.',
        price: 499,
        imageUrl:'https://rukminim2.flixcart.com/image/416/416/xif0q/cases-covers/e/f/p/-original-imagsrpyghjhhzen.jpeg?q=70',
        brand: 'Oneplus',
        productCategoryName: 'Cases & Covers',
        quantity: 2,
        isPopular:false),
    Product(
        id: 'SP1',
        title: 'Samsung S20 FE Screen Guard',
        description: 'Cover whole screen and certified drop test.',
        price: 199,
        imageUrl:'https://wonderfulengineering.com/wp-content/uploads/2020/12/10-Best-Screen-Protectors-For-Samsung-Galaxy-S20-FE-7.jpg',
        brand: 'Samsung',
        productCategoryName: 'Screen Protectors',
        quantity: 5,
        isPopular:false),
    Product(
        id: 'MH1',
        title: 'Portonics Mobile Holder',
        description: 'Mobie Holder with better grip and statbility',
        price: 499,
        imageUrl:'https://n3.sdlcdn.com/imgs/b/8/b/Artis-Mobile-Car-Mount-Holder-SDL519965630-1-2d3e2.jpg',
        brand: 'Portonics',
        productCategoryName: 'Mobile Holders & more',
        quantity: 5,
        isPopular:false),
    Product(
        id: 'SW1',
        title: 'Samsung Galaxy Watch 6',
        description: 'Mobie Holder with better grip and statbility',
        price: 39999,
        imageUrl:'https://rukminim2.flixcart.com/image/416/416/xif0q/smartwatch/b/i/w/-original-imagsbw7vumjwfg9.jpeg?q=70',
        brand: 'Samsung',
        productCategoryName: 'Smart Watch',
        quantity: 5,
        isPopular:true),
    Product(
        id: 'SW2',
        title: 'Apple Watch 7',
        description: 'Mobie Holder with better grip and statbility',
        price: 69999,
        imageUrl:'https://rukminim2.flixcart.com/image/416/416/ku8pbbk0/smartwatch/m/5/h/ios-mkhy3hn-a-apple-yes-original-imag7eqy5cjhkq2h.jpeg?q=70',
        brand: 'Apple',
        productCategoryName: 'Smart Watch',
        quantity: 3,
        isPopular:true),
    Product(
        id: 'SW3',
        title: 'Oneplus Nord Watch',
        description: 'Mobie Holder with better grip and statbility',
        price: 11999,
        imageUrl:'https://rukminim2.flixcart.com/image/416/416/xif0q/smartwatch/y/d/q/45-2-opbbe221-android-ios-oneplus-yes-original-imagnqhu7zxdfy7v.jpeg?q=70',
        brand: 'Oneplus',
        productCategoryName: 'Smart Watch',
        quantity: 3,
        isPopular:false),
    Product(
        id: 'SW4',
        title: 'Realme Watch S',
        description: 'Mobie Holder with better grip and statbility',
        price: 4199,
        imageUrl:'https://rukminim2.flixcart.com/image/416/416/ki7qw7k0/smartwatch/e/p/b/rma207-android-realme-original-imafy2fxtuzghm5m.jpeg?q=70',
        brand: 'Realme',
        productCategoryName: 'Smart Watch',
        quantity: 3,
        isPopular:false),
  ];

  List<Product> get products{
    return [..._products];
  }

  List<Product> get popularProducts{
    return _products.where((element) => element.isPopular!).toList();
}
  Product findById(String productId){
    return _products.firstWhere((element) => element.id==productId);
  }
  List<Product> findByCategory(String categoryName) {
    List<Product> _categoryList = _products
        .where((element) =>
        element.productCategoryName!
            .toLowerCase()
            .contains(categoryName.toLowerCase()))
        .toList();
    return _categoryList;
  }
  List<Product> findByBrand(String brandName) {
    List<Product> _categoryList = _products
        .where((element) =>
        element.brand!
            .toLowerCase()
            .contains(brandName.toLowerCase()))
        .toList();
    return _categoryList;
  }
  List<Product> searchQuery(String searchText) {
    List<Product> _searchList = _products
        .where((element) =>
        element.brand!
            .toLowerCase()
            .contains(searchText.toLowerCase()))
        .toList();
    return _searchList;
  }


}