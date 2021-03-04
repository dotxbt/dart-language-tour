import 'dart:io';

// hello function
void helloDart() {
  print('Hello, World!');
}

//
void variableDart() {
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
  print("Name : " +
      name +
      "\n" +
      "Year : " +
      year.toString() +
      "\n" +
      "Antenna Diameter : " +
      antennaDiameter.toString() +
      "\n" +
      "Fly by Objects : " +
      flybyObjects.toString() +
      "\n" +
      "Image : " +
      image.toString() +
      "\n");
}

// control flow statement
void controlFlow(var year) {
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (var object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }
}

// FUNCTION
void functionInDart() {
  print(fibonacci(20));
}

// recursive
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

// Class
class Mahasiswa {
  String name;
  int age;
  String nim;

  // contructor
  Mahasiswa(this.name, this.age, this.nim);

  // getter
  int get getAge => age;
  String get getName => name;
  String get getNim => nim;

  // setter
  void setName(name) {
    this.name = name;
  }

  void setAge(age) {
    this.age = age;
  }

  void setNim(nim) {
    this.nim = nim;
  }

  // method
  void printToScreen() {
    print("Name : " +
        name +
        "\n" +
        "NIM  : " +
        nim +
        "\n" +
        "Age  : " +
        age.toString());
  }
}

void classExample() {
  var objMhs = Mahasiswa("Sabituddin Bigbang", 18, "293898408305");
  objMhs.printToScreen();

  var objMaba = Maba("GueMaba", "8723942749872", 17, 2021);
  objMaba.printToScreen();
  objMaba.additionalInfo();

  var objMahaCuy = MahaCuy("XBT", 22, "98903824023", "Bumi Nusantara - Mars");
  objMahaCuy.setName("Jancukerz");
  objMahaCuy.setAge(30);
  objMahaCuy.setNim("1010101010");
  objMahaCuy.printToScreen();
}

// Mixins : multiple inheritance
mixin AddInfo {
  String asalDaerah = "Surabaya";
  void additionalInfo() {
    print('Asal Daerah: ' + asalDaerah);
  }
}

// inheritance
class Maba extends Mahasiswa with AddInfo {
  int tahunAngkatan;
  Maba(String name, String nim, int age, this.tahunAngkatan)
      : super(name, age, nim);

  @override
  void printToScreen() {
    super.printToScreen();
    print("Tahun Angkatan : " + tahunAngkatan.toString());
  }
}

// interface
class MahaCuy implements Mahasiswa {
  @override
  int age;

  @override
  String name;

  @override
  String nim;

  String alamat;

  MahaCuy(this.name, this.age, this.nim, this.alamat);

  @override
  int get getAge => this.age;

  @override
  String get getName => this.name;

  @override
  String get getNim => this.nim;

  @override
  void setAge(age) {
    this.age = int.parse(("99" + age.toString()));
  }

  @override
  void setName(name) {
    this.name = "EX : " + name;
  }

  @override
  void setNim(nim) {
    this.nim = "EX : " + nim;
  }

  @override
  void printToScreen() {
    print("Name : " +
        name +
        "\n" +
        "NIM  : " +
        nim +
        "\n" +
        "Age  : " +
        age.toString() +
        "\n" +
        "Alamat  : " +
        alamat);
  }
}

// Asynchronous
void asyncExample() {
  printWithDelay("Selamat Pagi", 5);
  printWithDelay("Hello 1", 1);
  printWithDelay("Hello 3", 3);
  printWithDelay("Hello 4", 4);
  printWithDelay("Hello 2", 2);

  var ob = ["contoh", "file2", "file3"];
  createDescriptions(ob);
}

Future<void> printWithDelay(String message, int detik) async {
  await Future.delayed(Duration(seconds: detik));
  print(message);
}

Future<void> createDescriptions(Iterable<String> objects) async {
  for (var object in objects) {
    try {
      var file = File('generated/$object.txt');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print('File for $object already exists. It was modified on $modified.');
        continue;
      }
      await file.create();
      await file.writeAsString('Start describing $object in this file.');
    } on IOException catch (e) {
      print('Cannot create description for $object: $e');
    }
  }
}

// exception
Future<void> exceptionExample() async {
  var flybyObjects = ["file1", "file2", "file3"];
  await createDescriptions(flybyObjects);
  try {
    for (var object in flybyObjects) {
      var description = await File('generated/$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    flybyObjects.clear();
  }
}