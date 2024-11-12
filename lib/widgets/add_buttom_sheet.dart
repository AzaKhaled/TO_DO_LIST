import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:to_do_list/cubit/add_note/add_note_cubit.dart';
import 'package:to_do_list/widgets/Constant.dart';
import 'package:to_do_list/widgets/add_note_form_state.dart';
import 'package:to_do_list/widgets/custom_buttom.dart';
import 'package:to_do_list/widgets/custom_text_filed.dart';

class ShowTaskButtomSheet extends StatelessWidget {
  const ShowTaskButtomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimarybacground,
        child: Center(
          child: Stack(
            children: [
              Positioned(
                top: -50,
                left: -50,
                child: Container(
                  width: 190,
                  height: 190,
                  decoration: BoxDecoration(
                    color: kColortext.withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: -100,
                left: 50,
                child: Container(
                  width: 190,
                  height: 190,
                  decoration: BoxDecoration(
                    color: kColortext.withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: 140,
                left: 20,
                right: 20,
                child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: kPrimarybacground,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: BlocConsumer<AddNoteCubit, AddNoteState>(
                              listener: (context, state) {
                                if (state is AddNoteFailure) {
                                  print('error faild');
                                }
                                if (state is AddNoteSucces) {
                                  Navigator.pop(context);
                                }
                              },
                              builder: (context, state) {
                                return ModalProgressHUD(
                                  inAsyncCall:
                                      state is AddNoteLoading ? true : false,
                                  child:const AddNoteForm(),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
