import 'package:city_weather/common/data/local_storage.dart';
import 'package:city_weather/feature/search/domain/notifier/search_list_provider.dart';
import 'package:city_weather/feature/search/domain/notifier/search_notifier.dart';
import 'package:city_weather/feature/search/presentation/widget/dropdown_list.dart';
import 'package:city_weather/feature/search/presentation/widget/list_widget.dart';
import 'package:city_weather/feature/search/presentation/widget/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final prefs = await ref.read(localStorageProvider).getStringList();
    if (prefs.isEmpty) {
      return;
    } else {
      setState(() {
        ref.read(searchListProvider.notifier).state.addAll(prefs.toList());
      });
    }
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userLocationList = ref.watch(searchListProvider);
    final searchState = ref.watch(searchNotifierProvider);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          myController.clear();
          ref.read(searchNotifierProvider.notifier).setInitSearch();
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/location.jpg"),
              opacity: -40,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    TextFieldInput(myController: myController, ref: ref),
                    Stack(
                      children: [
                        ListWidget(userLocationList: userLocationList),
                        searchState.maybeWhen(
                          orElse: () => const SizedBox(),
                          loading: () => const Center(
                              child: CircularProgressIndicator.adaptive()),
                          loaded: (searchResult) => DropDownList(
                            searchResult: searchResult,
                            userLocationList: userLocationList,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
