import 'dart:io';

import 'package:allparmad/pages/get_data_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'dashboard.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedValue = 'Entertainment';
  final _formKey = GlobalKey<FormState>();
  File? selectedImage;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context, 
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  Future<void> imagePicker() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, 
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
              iconSize: 30,
            ),
            const Text(
              'Back',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create Event',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC4C4C4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(double.infinity, 200),
                  ),
                  onPressed: () {
                    imagePicker();
                  },
                  child: selectedImage == null
                    ? const Icon(
                        Icons.add_a_photo,
                        size: 100,
                      )
                    : Image.file(
                        selectedImage!,
                        fit: BoxFit.cover,
                      ),
                ),
                SizedBox(height: 20),

                const Text(
                  'Nama Acara',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Hari Pancasila',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF2178FA),
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon diisi judul Acara';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                const Text(
                  'Deskripsi Acara',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'isi Deskripsi Acara...',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF2178FA),
                        width: 3,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon diisi deskripsi acara';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                const Text(
                  'Tanggal Acara',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: const Text('Pilih tanggal'),
                    ),
                    Text(
                      DateFormat('EEEE, dd MMMM yyyy').format(selectedDate),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                const Text(
                  'Jam Acara',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => _selectTime(context),
                      child: const Text('Pilih jam'),
                    ),
                    Text(
                      selectedTime.format(context),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                const Text(
                  'Harga Acara',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Rp10.000',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF2178FA),
                        width: 2,
                      ),
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon diisi harga acara';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                const Text(
                  'Kategori Acara',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  child: DropdownButton(
                    value: selectedValue,
                    items: const [
                      DropdownMenuItem(child: Text('Entertainment'), value: 'Entertainment'),
                      DropdownMenuItem(child: Text('Education'), value: 'Education'),
                      DropdownMenuItem(child: Text('General'), value: 'General'),
                      DropdownMenuItem(child: Text('Music'), value: 'Music'),
                      DropdownMenuItem(child: Text('Health'), value: 'Health'),
                      DropdownMenuItem(child: Text('Science'), value: 'Science'),
                      DropdownMenuItem(child: Text('Sports'), value: 'Sports'),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                const Text(
                  'Lokasi Acara',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Universitas Paramadina',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF2178FA),
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon diisi lokasi acara';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                const Text(
                  'Penanggung Jawab Acara - PIC',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Pak Budi',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF2178FA),
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon diisi nama penanggung jawab acara';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                const Text(
                  'Kontak Penanggung Jawab Acara - PIC',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: '081234567890',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF2178FA),
                        width: 2,
                      ),
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon diisi kontak penanggung jawab acara';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                const Text(
                  'Email Penanggung Jawab Acara - PIC',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Budi@mail.com',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF2178FA),
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon diisi email penanggung jawab acara';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2178FA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: const Text('Create Event'),
                          content: const Text('Are you sure you want to create this event?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigator.pop(context);
                                createAcara(
                                  desc: 'Hari Pancasila adalah hari dimana kita memperingati hari lahirnya Pancasila',
                                  price: 10000,
                                  time: '10:00',
                                  categories: 'Education',
                                  kontakHP: 081234567890,
                                  lokasi: 'Universitas Paramadina',
                                  nama: 'Hari Pancasila',
                                  penanggungJawab: 'Pak Budi',
                                  tanggal: '2021-06-01',
                                );
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Icon(
                                        Icons.check_circle,
                                        color: Color(0xFF1D92E1),
                                        size: 120,
                                      ),
                                      actionsAlignment: MainAxisAlignment.center,
                                      content: const Text(
                                        'Event Created Succesfully', 
                                        textAlign: TextAlign.center, 
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: const Color(0xFF2178FA),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            minimumSize: const Size(double.infinity, 40),
                                          ),
                                          onPressed: () {
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(builder: (context) => const Dashboard()),
                                              (Route<dynamic> route) => false,
                                            );
                                          },
                                          child: const Text('Back to Dashboard'),
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text('Create'),
                            ),
                          ],
                        );
                      },
                    );
                    } 
                  },
                  child: const Text('Create Event'),
                ),
                SizedBox(height: 20),
              ],
            )
          ),
        ),
      ),
    );
  }
}