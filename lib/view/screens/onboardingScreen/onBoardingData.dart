class Onboard {
  final String image, title, description;
  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> demo_data = [
  Onboard(
      image: 'lib/assets/images/person.png',
      title: 'Create Your\nPortfolio',
      description: 'No need to worry about\nMaking your website'),
  Onboard(
      image: 'lib/assets/images/magnet.png',
      title: 'Increase\nConnection',
      description: 'Add friends and\ncommunicate with them.'),
  Onboard(
      image: 'lib/assets/images/getConnected.png',
      title: 'Stay\nConnected',
      description: 'We\'d appreciate\nit if you could use the app\nproperly.'),
];
