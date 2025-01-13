import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/compotnets.dart';
import 'package:news_app/cubit.dart';
import 'package:news_app/states.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var searchList = NewsCubit.get(context).searchList;
        var searchText = NewsCubit.get(context).searchText;

        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Search';
                    }
                    return null;
                  },
                  initialValue: searchText,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    labelText: 'Search',
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    prefixIcon: const Icon(Icons.search),
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                ),
                const SizedBox(height: 10),
                if (state is GetSearchLoadingState)
                  const LinearProgressIndicator(
                    color: Colors.blue,
                    borderRadius: BorderRadiusDirectional.all(
                      Radius.circular(15),
                    ),
                  ),
                if (state is GetSearchSuccessState && searchList.isNotEmpty)
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => newItem(
                        item: searchList[index],
                        context: context,
                      ),
                      separatorBuilder: (context, index) => seperaterBuilder(),
                      itemCount: searchList.length,
                    ),
                  ),
                if (state is GetSearchSuccessState && searchList.isEmpty)
                  Center(
                    child: Text(
                      'No Results',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                if (state is GetSearchFailState)
                  Center(
                    child: Text(
                      'Error occurred',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
