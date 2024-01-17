import 'package:flutter/material.dart';
import 'package:pokemon_challenge/l10n/l10n.dart';

class PokemonListTile extends StatelessWidget {
  final String pokemonName;
  final VoidCallback onTap;
  final String? imageUrl;

  const PokemonListTile(
      {Key? key, required this.pokemonName, required this.onTap, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    // Use a default image if imageUrl is null
    final imageWidget = imageUrl != null
        ? Image.network(
            imageUrl!,
            width: 50,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              // Fallback if the network image fails to load
              return Image.asset('assets/images/poke_ball.png', width: 30);
            },
          )
        : Image.asset('assets/images/poke_ball.png', width: 30);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          leading: imageWidget,
          title: Text(
            pokemonName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors
                  .red.shade100, // Light red background color for the container
              borderRadius:
                  BorderRadius.circular(4), // Adjust the border radius here
            ),
            child: Text(
              l10n.seeDetails,
              style: TextStyle(
                color: Colors.black, // Text color
              ),
            ),
          ),
        ),
      ),
    );
  }
}
