import 'package:flutter/material.dart';

class Reviews extends StatelessWidget {
  Reviews({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: <Widget>[
          UserReviewTile(
            hostelName: 'ENGINEERS HOSTEL',
            review: 'Great place to stay! Clean and friendly environment.',
            rating: 5,
          ),
          UserReviewTile(
            hostelName: 'TANK HILL',
            review: 'Good facilities and convenient location.',
            rating: 4,
          ),
          UserReviewTile(
            hostelName: 'TRIPLE B',
            review: 'Nice atmosphere, but can be a bit noisy at times.',
            rating: 3,
          ),
          UserReviewTile(
            hostelName: 'TASO HOSTEL',
            review: 'Comfortable stay with helpful staff.',
            rating: 4,
          ),
          UserReviewTile(
            hostelName: 'MUST HALLS',
            review: 'Excellent amenities and spacious rooms.',
            rating: 5,
          ),
          UserReviewTile(
            hostelName: 'KASH HOSTEL',
            review: 'Enjoyed my time here, would recommend!',
            rating: 4,
          ),
          UserReviewTile(
            hostelName: 'BOOMA HOSTEL',
            review: 'Affordable and clean accommodations.',
            rating: 3,
          ),
          UserReviewTile(
            hostelName: 'CORPUS CHRIST',
            review: 'Quiet and peaceful place to stay.',
            rating: 5,
          ),
        ],
      ),
    );
  }
}

class UserReviewTile extends StatelessWidget {
  final String hostelName;
  final String review;
  final int rating;

  const UserReviewTile({
    required this.hostelName,
    required this.review,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(hostelName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: List.generate(
                5,
                    (index) => Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(review),
          ],
        ),
      ),
    );
  }
}
