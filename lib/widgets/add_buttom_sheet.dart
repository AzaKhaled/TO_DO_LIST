import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: kPrimarybacground,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const SingleChildScrollView(child: AddNoteForm()),
                      ),
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
