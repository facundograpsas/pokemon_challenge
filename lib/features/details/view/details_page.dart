import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/core/injector/injector.dart';
import 'package:pokemon_challenge/features/details/bloc/details_bloc.dart';
import 'package:pokemon_challenge/features/details/bloc/details_event.dart';
import 'package:pokemon_challenge/features/details/bloc/details_state.dart';
import 'package:pokemon_challenge/features/details/widgets/pokemon_details_card.dart';
import 'package:pokemon_challenge/l10n/l10n.dart';

class DetailsPage extends StatelessWidget {
  final String id;
  DetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final detailsPageBloc = Injector.instance<DetailsPageBloc>();
        detailsPageBloc.add(FetchPokemonDetailsEvent(id));
        return detailsPageBloc;
      },
      child: DetailsView(),
    );
  }
}

class DetailsView extends StatelessWidget {
  DetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              Text(
                l10n.homeAppBarTitle,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Image.asset(
                'assets/images/charmeleon.png',
                width: 50,
              )
            ],
          ),
          backgroundColor: Colors.red),
      body: BlocBuilder<DetailsPageBloc, DetailsPageState>(
        builder: (context, state) {
          if (state is DetailsPageLoading) {
            return Center(
                child: const CircularProgressIndicator(
              color: Colors.red,
            ));
          } else if (state is DetailsPageLoaded) {
            return PokemonDetailsCard(pokemon: state.pokemon!);
          } else if (state is DetailsPageError) {
            return Text(state.message);
          } else {
            return Text("Error desconocido");
          }
        },
      ),
    );
  }
}
