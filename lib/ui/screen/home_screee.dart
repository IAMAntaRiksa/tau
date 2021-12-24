import 'package:cached_network_image/cached_network_image.dart';
import 'package:crud_api_with_bloc/data/model/list_model_person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:crud_api_with_bloc/bloc/person_bloc.dart';
import 'package:crud_api_with_bloc/ui/screen/home_add_edit_screen.dart';
import 'package:crud_api_with_bloc/ui/widget/widget_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("crud Api"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const HomeAddEditScreen(
                      newPerson: true,
                    )),
          );
        },
        label: const Icon(Icons.add),
      ),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    context.read<PersonBloc>().add(GetDataPersonEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonBloc, PersonState>(
      builder: (BuildContext context, state) {
        if (state is PersonLoading) {
          return WidgetState.loading(context);
        } else if (state is PersonLoadingError) {
          return WidgetState.errorLoading(context);
        } else if (state is PersonEmpatyState) {
          return WidgetState.notFound(context);
        } else if (state is PersonLoadingSucces) {
          return ItemList(personItem: state.person);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ItemList extends StatelessWidget {
  final ListModelPerson? personItem;
  const ItemList({
    Key? key,
    required this.personItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: personItem?.data.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(19),
                    child: CachedNetworkImage(
                      imageUrl: (personItem?.data[index].avatar).toString(),
                    ),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '${personItem?.data[index].firsName} ${personItem?.data[index].firsName}'),
                  Text((personItem?.data[index].email).toString())
                ],
              )
            ],
          );
        });
  }
}

// class ItemList extends StatefulWidget {
//   final ListModelPerson? personData;
//   const ItemList({
//     Key? key,
//     required this.personData,
//   }) : super(key: key);

//   @override
//   State<ItemList> createState() => _ItemListState();
// }

// class _ItemListState extends State<ItemList> {
//   final ScrollController _scrollController = ScrollController();
//   _scrollListener() {
//     if (_scrollController.position.pixels ==
//         _scrollController.position.maxScrollExtent) {
//       print('data');
//     }
//   }

//   @override
//   void initState() {
//     _scrollController.addListener(_scrollListener);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _scrollController;
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       scrollDirection: Axis.vertical,
//       controller: _scrollController,
//       itemCount: widget.personData?.data.length,
//       itemBuilder: (_, index) {
//         return Card(
//           child: Row(
//             children: [
//               Container(
//                 width: 120,
//                 height: 120,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.rectangle,
//                   image: DecorationImage(
//                     image: CachedNetworkImageProvider(
//                       widget.personData?.data[index].avatar ?? '',
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 20),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                       "${widget.personData?.data[index].firsName ?? ''} ${widget.personData?.data[index].lastName ?? ''}"),
//                   const SizedBox(height: 10),
//                   Text(widget.personData?.data[index].email ?? ''),
//                 ],
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
