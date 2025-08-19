import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservate/presentation/authentication/cubit/authentication/authentication_cubit.dart';
import 'package:reservate/presentation/booking/booking_page.dart';
import 'package:reservate/presentation/home/widgets/amenity_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLoggedOut) {
          Navigator.of(context).pushReplacementNamed('/sign_in');
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Building Amenities"),
            actions: [
              IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  context.read<AuthenticationCubit>().logout();
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to your building",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  "Book and manage your amenity reservations",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
                const SizedBox(height: 24),
                AmenityCard(
                  id: 1,
                  name: 'Pileta',
                  description: 'Piscina climatizada en el 5to piso.',
                  icon: Icons.pool,
                  isAvailable: false,
                  nextSlot: '18:00 hs',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const BookingPage()),
                    );
                  },
                ),
                AmenityCard(
                  id: 1,
                  name: 'SUM',
                  description: 'Espacio comun para festejos.',
                  icon: Icons.house,
                  isAvailable: false,
                  nextSlot: '18:00 hs',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const BookingPage()),
                    );
                  },
                ),
                AmenityCard(
                  id: 1,
                  name: 'CoWorking',
                  description: 'Espacio comun para trabajar remotamente.',
                  icon: Icons.work,
                  isAvailable: false,
                  nextSlot: '18:00 hs',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const BookingPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
