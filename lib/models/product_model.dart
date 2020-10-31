class Product {
  String imageUrl;
  String name;
  double price;
  String description;
  int productId;
  Product({
    this.imageUrl,
    this.name,
    this.price,
    this.description,
    this.productId,
  });
}

final List<Product> products = [
  Product(
    imageUrl: 'images/mxmaster.jpg',
    name: 'Logitech MX Master 2S',
    price: 79.95,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    productId: null,
  ),
  Product(
    imageUrl: 'images/blueyeti.jpg',
    name: 'Blue Yeti USB Microphone',
    price: 109.99,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    productId: null,
  ),
  Product(
    imageUrl: 'images/macbookpro.jpg',
    name: 'MacBook Pro 13-inch (2019)',
    price: 1199.99,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    productId: null,
  ),
  Product(
    imageUrl: 'images/keyboard.jpg',
    name: 'Apple Magic Keyboard',
    price: 88.99,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    productId: null,
  ),
  Product(
    imageUrl: 'images/jbl.jpg',
    name: 'JBL Bluetooth Speaker',
    price: 99.95,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    productId: null,
  ),
];

final List<Product> books = [
  Product(
    imageUrl: 'images/thirddoor.jpg',
    name: 'The Third Door',
    price: 18.49,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    productId: null,
  ),
  Product(
    imageUrl: 'images/crushingit.jpg',
    name: 'Crushing It',
    price: 18.98,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    productId: null,
  ),
  Product(
    imageUrl: 'images/powerofhabit.jpg',
    name: 'The Power of Habit',
    price: 10.20,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    productId: null,
  ),
];
final List<Product> vegetables = [
  Product(
    imageUrl: 'images/carrot.jpg',
    name: 'Carrot',
    price: 10.20,
    description: 'Fresh Carrot 1kg',
    productId: null,
  ),
  Product(
    imageUrl: 'images/beetroot.jpg',
    name: 'Beetroot',
    price: 10.20,
    description: 'Fresh Beetroot 1kg',
    productId: null,
  ),
  Product(
    imageUrl: 'images/beetroot.jpg',
    name: 'Tomatoes',
    price: 10.20,
    description: 'Fresh Beetroot 1kg',
    productId: null,
  ),
  Product(
    imageUrl: 'images/beetroot.jpg',
    name: 'potatoes',
    price: 10.20,
    description: 'Fresh Beetroot 1kg',
    productId: null,
  ),
  Product(
    imageUrl: 'images/beetroot.jpg',
    name: 'onions',
    price: 10.20,
    description: 'Fresh onions 1kg',
    productId: null,
  ),
];
List<Product> cart = [];
