import 'package:flutter/material.dart';

class EventDetailsPage extends StatelessWidget {
  final int eventId;
  const EventDetailsPage({Key? key, required this.eventId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Row(
            children: const [
              Flexible(
                child: Text(
                  "title",
                  maxLines: 2,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 24,
              )
            ],
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
            color: Colors.blue,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                color: Colors.grey.shade200,
                height: 2,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                      "https://seatgeek.com/images/performers-landscape/black-stone-cherry-d59298/9032/huge.jpg",
                      fit: BoxFit.contain),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "type",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ));
  }
}
