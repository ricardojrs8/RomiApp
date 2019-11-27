class Plant {
  final String imageUrl;
  final String name;
  final String category;
  final int price;
  final String size;
  final String description;

  Plant({
    this.imageUrl,
    this.name,
    this.category,
    this.price,
    this.size,
    this.description,
  });
}

final List<Plant> plants = [
  Plant(
    imageUrl: 'images/plant5.jpg',
    name: 'CALIZA',
    category: 'Roca',
    price: 25,
    size: 'Small',
    description:
        'La caliza es una roca sedimentaria compuesta en un 90% por Carbonato de Calcio (CaCO3), especialmente Calcita y Aragonita. En su versión más pura es de color blanco, pero mezclada con arcilla, hematita, óxido de hierro y cuarzo, adquiere tonalidades diferentes como marfil, marrón y gris azulado, entre otras. Su dureza es de 3 en la escala de Mohs. Produce efervescencia en ácido clorhídrico.',
  ),
  Plant(
    imageUrl: 'images/plant7.jpg',
    name: 'Granito',
    category: 'Roca',
    price: 30,
    size: 'Medium',
    description:
        'Es una roca plutónica con cuarzo, plagioclasa y feldespatos alcalinos como componentes claros. En general es una roca muy común, pero aflora solo en lugares especiales. Es una roca leucocrática con cristales de tamaño medio hasta grande. Principalmente contiene como minerales claras: feldespatos alcalinos (microlina o ortóclasa), cuarzo y plagioclasa.',
  ),
  Plant(
    imageUrl: 'images/plant6.jpg',
    name: 'Mármol',
    category: 'Roca',
    price: 42,
    size: 'Large',
    description:
        'El mármol es una roca metamórfica de textura maciza, formada por rocas calizas o dolomitas que, sometidas a altas temperaturas, sufren un proceso de recristalización. Puede encontrarse naturalmente en masas estratiformes o irregulares, según su origen. Es conocido y destinado a diversos usos desde el período geológico Silúrico, de la era Paleozoica, hace 443 millones de años.',
  ),
];
