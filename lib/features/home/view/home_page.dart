import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/core/injector/injector.dart';
import 'package:pokemon_challenge/features/home/bloc/home_bloc.dart';
import 'package:pokemon_challenge/features/home/bloc/home_events.dart';
import 'package:pokemon_challenge/features/home/bloc/home_state.dart';
import 'package:pokemon_challenge/features/home/widgets/pokemons_list.dart';
import 'package:pokemon_challenge/features/home/widgets/search_pokemon_text_field.dart';
import 'package:pokemon_challenge/features/widgets/custom_app_bar.dart';
import 'package:pokemon_challenge/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key}) : homePageBloc = Injector.instance<HomePageBloc>() {
    homePageBloc.add(FetchPokemonsEvent(0));
  }

  final HomePageBloc homePageBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => homePageBloc,
      child: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.homeAppBarTitle,
        key: ValueKey("appBar"),
      ),
      body: Column(
        children: [
          SearchPokemonTextField(
              searchController: _searchController, l10n: l10n),
          Expanded(
            child: BlocBuilder<HomePageBloc, HomePageState>(
              builder: (context, state) {
                if (state is HomePageInitial) {
                  return Center(
                      child: const CircularProgressIndicator(
                    color: Colors.red,
                  ));
                } else if (state is HomePageLoaded) {
                  return PokemonsList(
                    state: state,
                  );
                } else if (state is HomePageError) {
                  return Text(state.message);
                } else {
                  return Text("Error desconocido");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
