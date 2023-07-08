import 'package:cloud_firestore/cloud_firestore.dart';

void createAcara(
    {required String desc,
    required int price,
    required String time,
    required String categories,
    required int kontakHP,
    required String lokasi,
    required String nama,
    required String penanggungJawab,
    required String tanggal}) {
  FirebaseFirestore.instance
      .collection('acara')
      .add({
        'Deskripsi': desc,
        'Harga': price,
        'Jam': time,
        'Kategori': categories,
        'Konta': kontakHP,
        'Lokasi': lokasi,
        'Nama': nama,
        'PenanggungJawab': penanggungJawab,
        'Tanggal': tanggal,
      })
      .then((value) => print('Membuat acara berhasil'))
      .catchError((error) => print('Gagal untuk membuat  acara: $error'));
}

void getAcara() {
  FirebaseFirestore.instance
      .collection('acara')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      print(doc['Nama']);
    });
  });
}
