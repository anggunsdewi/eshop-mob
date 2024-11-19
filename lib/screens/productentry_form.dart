import 'package:flutter/material.dart';
import 'package:freshnbloom/widgets/left_drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'dart:convert';
import 'package:freshnbloom/screens/productentry_form.dart';
import 'package:freshnbloom/screens/menu.dart';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  int _stock = 0;
  double _rating = 0;
  String _image = "";
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk Kamu Hari ini',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                     hintText: "Produk",
                      labelText: "Nama Produk",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                   onChanged: (String? value) {
                      setState(() {
                        _name = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Nama produk tidak boleh kosong!";
                      }
                      if (value.length < 3) {
                        return "Nama produk harus memiliki minimal 3 karakter!";
                      }
                      if (value.length > 50) {
                        return "Nama produk tidak boleh lebih dari 50 karakter!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Jumlah produk",
                      labelText: "Jumlah produk tersedia",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                      onChanged: (String? value) {
                        setState(() {
                          _stock = int.tryParse(value!) ?? 0;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Jumlah produk tidak boleh kosong!";
                        }
                        if (int.tryParse(value) == null) {
                          return "Jumlah produk harus berupa angka!";
                        }
                        else if (int.tryParse(value)! <= 0) {
                          return "Produk tidak boleh kurang dari 0!";
                        }
                        return null;
                      },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Description",
                      labelText: "Desciption",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                      onChanged: (String? value) {
                        setState(() {
                          _description = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Description tidak boleh kosong!";
                        }
                        if (value.length < 3) {
                          return "Description harus memiliki minimal 3 karakter!";
                        }
                        if (value.length > 200) {
                          return "Description tidak boleh lebih dari 200 karakter!";
                        }
                        return null;
                      },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.primary),
                      ),
                  onPressed: () async {
    if (_formKey.currentState!.validate()) {
        // Kirim ke Django dan tunggu respons
        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        final response = await request.postJson(
               "http://127.0.0.1:8000/create-flutter/",
                jsonEncode(<String, String>{
                    'name': _name,
                    'price': _price.toString(),
                    'description': _description,
                    'stock': _stock.toString(),
                    'rating': _rating.toString(),
                    'image': _image,
                // TODO: Sesuaikan field data sesuai dengan aplikasimu
                }),
            );
            if (context.mounted) {
                if (response['status'] == 'success') {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                    content: Text("Produk baru berhasil disimpan!"),
                    ));
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                        content:
                            Text("Terdapat kesalahan, silakan coba lagi."),
                    ));
                }
            }
        }
    }, 
              child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}