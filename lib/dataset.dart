import 'package:flutter/material.dart';

class Categories {
  String name;
  String image;
  Color color;
  Categories(this.name, this.image, this.color);
}

List<Categories> doctorTypes = [
  Categories("Heart", "assets/heart.png", Colors.red),
  Categories("Dental", "assets/dental.png", Colors.blue),
  Categories("Bone", "assets/bone.png", Colors.deepPurple)
];

class Doctor {
  String name;
  String image;
  String specialisation;
  String rating;
  Doctor(this.name, this.image, this.specialisation, this.rating);
}

List<Doctor> doctorList = [
  Doctor(
      "Dr. Haylie Siphron",
      "https://randomuser.me/api/portraits/med/women/75.jpg",
      "Denatologists",
      "540"),
  Doctor(
      "Dr. Cooper Harry",
      "https://randomuser.me/api/portraits/med/men/5.jpg",
      "Pediatricians",
      "532"),
  Doctor("Dr. Helen Sid", "https://randomuser.me/api/portraits/med/women/7.jpg",
      "Orthologist", "635"),
  Doctor(
      "Dr. Rajesh Rathi",
      "https://randomuser.me/api/portraits/med/men/64.jpg",
      "Cardiologist",
      "473")
];
