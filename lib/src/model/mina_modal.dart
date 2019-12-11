class Mina {
  final String imageUrl;
  final String name;
  final String category;
  final int price;
  final String size;
  final String description;

  Mina({
    this.imageUrl,
    this.name,
    this.category,
    this.price,
    this.size,
    this.description,
  });
}

final List<Mina> mina = [
  Mina(
    imageUrl: 'images/mina8.jpg',
    name: 'Petaquilla',
    category: 'Mina',
    price: 25,
    size: 'Small',
    description:
        'Petaquilla es un cerro que está ubicado en el distrito de Donoso, provincia de Colón, Panamá.1​ Petaquilla está clasificado como: Orográfico (Colina o cerro de una altura menor a 300 metros), y que por razones de mejor accesibilidad es motivo de que haya quienes erróneamente lo sitúen en la provincia de Coclé, distrito de La Pintada.',
  ),
  Mina(
    imageUrl: 'images/mina3.jpg',
    name: 'Cerro Colarado',
    category: 'Mina',
    price: 30,
    size: 'Medium',
    description:
        'Cerro Colorado tiene un yacimiento de tipo pórfido (Roca compacta y por una sustancia amorfa, de color oscuro y con cristales de feldespato y cuarzo.) con 1,400 millones de toneladas de reserva de roca mineralizada, con una ley promedio de explotación de 0.78 por ciento. ',
  ),
  Mina(
    imageUrl: 'images/plant6.jpg',
    name: 'Cerro Quema',
    category: 'Mina',
    price: 42,
    size: 'Large',
    description:
        'El origen del Proyecto Cerro Quema se remonta a finales de la década de los ochenta. Desde hace tres años, la empresa MCQSA se encarga de la exploración, evaluación, desarrollo y explotación de depósitos minerales de manera responsable, respetando el medio ambiente y apoyando a las comunidades en donde desarrollamos nuestros proyectos',
  ),
];
