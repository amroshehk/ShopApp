import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layouts/shop/cubit.dart';
import 'package:shop_app/modules/search/states.dart';

import '../../shared/components/components.dart';
import 'cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => ShopCubit(),
        ),
      ],
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultTextFormField(
                        controller: searchController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'enter text to search';
                          }

                          return null;
                        },
                        onFieldSubmitted: (String text) {
                          SearchCubit.get(context).search(text);
                        },
                        labelText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        context: context),
                    const SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchLoadingState)
                      const LinearProgressIndicator(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (BuildContext context, index) =>
                              buildProductItem(
                            SearchCubit.get(context).model?.data!.data?[index],
                            context,
                            isOldPrice: false,
                          ),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount: SearchCubit.get(context)
                              .model!
                              .data!
                              .data!
                              .length,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
