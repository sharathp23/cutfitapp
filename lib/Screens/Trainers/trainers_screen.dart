import 'package:flutter/material.dart';

class Trainer {
  final String name;
  final String specialty;
  final String profileImageUrl;
  final String experience;
  final String education;
  final String certifications;
  final String contactInfo;
  final double rating;

  Trainer({
    required this.name,
    required this.specialty,
    required this.profileImageUrl,
    required this.experience,
    required this.education,
    required this.certifications,
    required this.contactInfo,
    required this.rating,
  });
}

class TrainersScreen extends StatelessWidget {
  final List<Trainer> trainers = [
    Trainer(
      name: 'John Doe',
      specialty: 'Strength and Conditioning',
      profileImageUrl: 'https://picsum.photos/100',
      experience: '10 years',
      education: 'Bachelor of Science in Exercise Science',
      certifications: 'ACSM Certified Personal Trainer, CPR/AED Certified',
      contactInfo: 'johndoe@gmail.com',
      rating: 4.5,
    ),
    Trainer(
      name: 'Jane Smith',
      specialty: 'Yoga',
      profileImageUrl: 'https://picsum.photos/101',
      experience: '5 years',
      education: '200-Hour Registered Yoga Teacher',
      certifications: 'RYT-200, CPR/AED Certified',
      contactInfo: 'janesmith@gmail.com',
      rating: 4.8,
    ),
    Trainer(
      name: 'Bob Johnson',
      specialty: 'Endurance Training',
      profileImageUrl: 'https://picsum.photos/102',
      experience: '7 years',
      education: 'Master of Science in Kinesiology',
      certifications: 'NSCA Certified Strength and Conditioning Specialist, CPR/AED Certified',
      contactInfo: 'bobjohnson@gmail.com',
      rating: 4.2,
    ),
    Trainer(
      name: 'Sarah Lee',
      specialty: 'Pilates',
      profileImageUrl: 'https://picsum.photos/103',
      experience: '3 years',
      education: '500-Hour Comprehensive Pilates Instructor',
      certifications: 'PMA Certified Pilates Teacher, CPR/AED Certified',
      contactInfo: 'sarahlee@gmail.com',
      rating: 4.7,
    ),
    Trainer(
      name: 'Alice Lee',
      specialty: 'Pilates',
      profileImageUrl: 'https://picsum.photos/104',
      experience: '8 years',
      education: 'Pilates Method Alliance Certification',
      certifications: 'Certified Pilates Instructor',
      contactInfo: 'alicelee@gmail.com',
      rating: 4.9,
    ),
    Trainer(
      name: 'James Brown',
      specialty: 'Cardio',
      profileImageUrl: 'https://picsum.photos/105',
      experience: '4 years',
      education: 'Master of Science in Exercise Physiology',
      certifications: 'American College of Sports Medicine Certified Exercise Physiologist',
      rating: 4.7,
      contactInfo: 'jamesbrown@gmail.com',
    ),
    Trainer(
      name: 'Emma Wilson',
      specialty: 'Dance Fitness',
      profileImageUrl: 'https://picsum.photos/106',
      experience: '6 years',
      education: 'Bachelor of Fine Arts in Dance',
      certifications: 'Certified Dance Fitness Instructor',
      rating: 4.8,
      contactInfo: 'emmawilson@gmail.com',
    ),
    Trainer(
      name: 'Michael Davis',
      specialty: 'Functional Training',
      profileImageUrl: 'https://picsum.photos/107',
      experience: '8 years',
      education: 'Bachelor of Science in Health and Human Performance',
      certifications: 'National Strength and Conditioning Association Certified Personal Trainer',
      rating: 4.9,
      contactInfo: 'michaeldavis@gmail.com',
    ),
    Trainer(
      name: 'Samantha Lee',
      specialty: 'Barre',
      profileImageUrl: 'https://picsum.photos/108',
      experience: '7 years',
      education: 'Barre Intensity Certification',
      certifications: 'Certified Barre Instructor',
      rating: 4.8,
      contactInfo: 'samanthalee@gmail.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trainers'),
      ),
      body: ListView.builder(
        itemCount: trainers.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(trainers[index].profileImageUrl),
            ),
            title: Text(trainers[index].name),
            subtitle: Text(trainers[index].specialty),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainerDetailsScreen(trainer: trainers[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TrainerDetailsScreen extends StatelessWidget {
  final Trainer trainer;

  TrainerDetailsScreen({required this.trainer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trainer.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200, // replace with actual image height
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(trainer.profileImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              '${trainer.name}, ${trainer.specialty}',
style: TextStyle(
fontSize: 24,
fontWeight: FontWeight.bold,
),
),
SizedBox(height: 16),
// Display the trainer's experience, education, and certifications
ListTile(
leading: Icon(Icons.work),
title: Text('Experience'),
subtitle: Text(trainer.experience),
),
ListTile(
leading: Icon(Icons.school),
title: Text('Education'),
subtitle: Text(trainer.education),
),
ListTile(
leading: Icon(Icons.card_membership),
title: Text('Certifications'),
subtitle: Text(trainer.certifications),
),
SizedBox(height: 16),
// Display the trainer's rating
Row(
children: [
Icon(Icons.star, color: Colors.amber),
SizedBox(width: 8),
Text('${trainer.rating}'),
],
),
SizedBox(height: 16),
// TODO: Implement a way to book a session with the trainer
],
),
),
);
}
}
             
