import 'package:cars/app_config/app_navigations.dart';
import 'package:cars/app_config/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/userslist/user_list_bloc.dart';
import '../models/users.dart';

class HomeUiPage extends StatelessWidget {
  UserListBloc? userListBloc;
  HomeUiPage({Key? key, this.userListBloc}) : super(key: key);

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  Widget buildUserTile(context,User user){
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: (){
            userListBloc!.add(DeleteUser(user: user));
          }, icon: Icon(Icons.delete,color: Colors.red,size: 30,)),
          IconButton(onPressed: (){
            int id = user.id;
            name.text = user.name;
            email.text = user.email;
            showBottomSheet(id: id,context: context,isEdit: true);
          }, icon: Icon(Icons.edit,color: Colors.green,size: 30,)),
        ],
      ),
    );
  }

  buildTextField(TextEditingController controller,String hint){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
       controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  void showBottomSheet({required BuildContext context,bool isEdit = false,required int id}){
   showModalBottomSheet(context: context,
       isScrollControlled: true,
       builder: (context){
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            buildTextField(name,"Enter Name"),
            buildTextField(email,"Enter Email"),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                final user = User(id: id,
                name: name.text,
                email: email.text
                );

                if(isEdit){
                  userListBloc!.add(UpdateUser(user: user));
                }else{
                  userListBloc!.add(AddUser(user: user));
                }
                Navigator.of(context).pop();
              },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),

                  child: Text(isEdit?"Update" : "Add User",style: TextStyle(color: Colors.white,fontSize: 16),)),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    userListBloc = context.read<UserListBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Curd Using bloc"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: (){
          final state = userListBloc!.state;
          final id = state.users.length;
          name.text = "";
          email.text = "";
          showBottomSheet(id: id,context: context,isEdit: false);
        },
        child: const Text("Add User"),
      ),
      body: BlocBuilder<UserListBloc,UserListState>(
        builder: (context,state){
          if(state is UserListUpdated && state.users.isNotEmpty){
            final users = state.users;
            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context,index){
              final user = users[index];
              return buildUserTile(context,user);
            });
          }else{
            return const SizedBox(
              width: double.infinity,
              child: Center(
                child: Text("No users found"),
              ),
            );
          }
        },
      ),

    );
  }
}
