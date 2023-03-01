import '../GlobalWidgets/rating.dart';

class TvModel {
  List<String>? images;
  Map<String, dynamic>? productDetails;
  String? image;
  String? name;

  int? price;
  RatingButton? rating;
  TvModel(
      {this.image,
      this.name,
      this.price,
      this.rating,
      this.images,
      this.productDetails});
}

List<TvModel> tvModel = [
  TvModel(
    image:
        'https://img.freepik.com/premium-photo/modern-blue-refrigerator-white-background_476612-8845.jpg?w=900',
    name: 'Samsung 55 Inches  ',
    productDetails: {
      'Brand': 'Samsung',
      'Display Size': '55 Inches',
      'Panel': 'HDR 10+',
      'Display Technology': 'LED',
      'Resolution': "3850 × 2160 pixels",
    },
    price: 599,
    rating: const RatingButton(rating: 5),
    images: [
      'https://img.freepik.com/free-photo/interactive-pink-screen-wall-gallery_53876-95933.jpg?w=900&t=st=1677433844~exp=1677434444~hmac=b79946302469ef5b85a25bd4f44db2f6f6a0d030cf34099055f713ab645f641d',
      'https://img.freepik.com/free-psd/realistic-television-presentation_1310-15.jpg?w=740&t=st=1677433921~exp=1677434521~hmac=5cf28cfceefb1b3640459f64d86caf7ff7a9b2cf1f6b5c5bf716d11c18bb583f',
      'https://img.freepik.com/premium-photo/modern-wide-screen-tv-monitor-showing-beautiful-landscape-isolated-white_495423-35012.jpg?w=826',
      'https://img.freepik.com/premium-psd/smart-tv-mockup-isolated-3d-rendering_322208-226.jpg?w=900'
    ],
  ),
  TvModel(
    image:
        'https://img.freepik.com/premium-photo/modern-blue-refrigerator-white-background_476612-8845.jpg?w=900',
    name: 'Samsung 55 Inches 4k Neo Series Ultra HD Smart LED TV',
    productDetails: {
      'Brand': 'Samsung',
      'Display Size': '55 Inches',
      'Panel': 'HDR 10+',
      'Display Technology': 'LED',
      'Resolution': "3850 × 2160 pixels",
    },
    images: [
      'https://img.freepik.com/free-photo/interactive-pink-screen-wall-gallery_53876-95933.jpg?w=900&t=st=1677433844~exp=1677434444~hmac=b79946302469ef5b85a25bd4f44db2f6f6a0d030cf34099055f713ab645f641d',
      'https://img.freepik.com/free-psd/realistic-television-presentation_1310-15.jpg?w=740&t=st=1677433921~exp=1677434521~hmac=5cf28cfceefb1b3640459f64d86caf7ff7a9b2cf1f6b5c5bf716d11c18bb583f',
      'https://img.freepik.com/premium-photo/modern-wide-screen-tv-monitor-showing-beautiful-landscape-isolated-white_495423-35012.jpg?w=826',
      'https://img.freepik.com/premium-psd/smart-tv-mockup-isolated-3d-rendering_322208-226.jpg?w=900'
    ],
    price: 599,
    rating: const RatingButton(rating: 4),
  ),
  TvModel(
    image:
        'https://img.freepik.com/premium-photo/modern-blue-refrigerator-white-background_476612-8845.jpg?w=900',
    name: 'Samsung 55 Inches 4k Neo Series Ultra HD Smart LED TV',
    price: 599,
    productDetails: {
      'Brand': 'Samsung',
      'Display Size': '55 Inches',
      'Panel': 'HDR 10+',
      'Display Technology': 'LED',
      'Resolution': "3850 × 2160 pixels",
    },
    images: [
      'https://img.freepik.com/free-photo/interactive-pink-screen-wall-gallery_53876-95933.jpg?w=900&t=st=1677433844~exp=1677434444~hmac=b79946302469ef5b85a25bd4f44db2f6f6a0d030cf34099055f713ab645f641d',
      'https://img.freepik.com/free-psd/realistic-television-presentation_1310-15.jpg?w=740&t=st=1677433921~exp=1677434521~hmac=5cf28cfceefb1b3640459f64d86caf7ff7a9b2cf1f6b5c5bf716d11c18bb583f',
      'https://img.freepik.com/premium-photo/modern-wide-screen-tv-monitor-showing-beautiful-landscape-isolated-white_495423-35012.jpg?w=826',
      'https://img.freepik.com/premium-psd/smart-tv-mockup-isolated-3d-rendering_322208-226.jpg?w=900'
    ],
    rating: const RatingButton(rating: 3),
  ),
  TvModel(
    image:
        'https://img.freepik.com/premium-photo/tv-set-with-curved-screen-isolated_172429-992.jpg?w=740',
    name: 'Oracle Led 55 Inches 4k Neo Series Ultra HD Smart LED TV',
    price: 599,
    images: [
      'https://img.freepik.com/free-photo/interactive-pink-screen-wall-gallery_53876-95933.jpg?w=900&t=st=1677433844~exp=1677434444~hmac=b79946302469ef5b85a25bd4f44db2f6f6a0d030cf34099055f713ab645f641d',
      'https://img.freepik.com/free-psd/realistic-television-presentation_1310-15.jpg?w=740&t=st=1677433921~exp=1677434521~hmac=5cf28cfceefb1b3640459f64d86caf7ff7a9b2cf1f6b5c5bf716d11c18bb583f',
      'https://img.freepik.com/premium-photo/modern-wide-screen-tv-monitor-showing-beautiful-landscape-isolated-white_495423-35012.jpg?w=826',
      'https://img.freepik.com/premium-psd/smart-tv-mockup-isolated-3d-rendering_322208-226.jpg?w=900'
    ],
    productDetails: {
      'Brand': 'Samsung',
      'Display Size': '55 Inches',
      'Panel': 'HDR 10+',
      'Display Technology': 'LED',
      'Resolution': "3850 × 2160 pixels",
    },
    rating: const RatingButton(rating: 3),
  ),
];
