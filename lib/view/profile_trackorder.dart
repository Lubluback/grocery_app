
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_application/custom_widgets/custom_appbar.dart';

class ProfileTrackorder extends StatefulWidget {
  ProfileTrackorder({super.key});

  @override
  State<ProfileTrackorder> createState() => _ProfileTrackorderState();
}

class _ProfileTrackorderState extends State<ProfileTrackorder> {
  List<Step> stepList() => [
        const Step(
            title: Text('Order Placed'),
            content: Center(
              child: Text('Account'),
            )),
        const Step(
            title: Text('Order Confirmed'),
            content: Center(
              child: Text('Address'),
            )),
        const Step(
            title: Text('Order Packed'),
            content: Center(
              child: Text('Confirm'),
            )),
        Step(
            title: Text('Out for Delivery'),
            content: Center(
              child: Text('Confirm'),
            )),
        Step(
            title: Text('Order Delivered'),
            content: Center(
              child: Text('Confirm'),
            )),
      ];
  int _activeCurrentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          title: Text("My Order",
              style: GoogleFonts.poppins(
                color: const Color(0xff4F7B39),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ))),
      body: Column(
        children: [
          ListTile(
            title: Text("data"),
            subtitle: Text("data"),
            trailing: Text("data"),
          ),
          Expanded(
            child: Stepper(
              type: StepperType.vertical,
              currentStep: _activeCurrentStep,
              steps: stepList(),

              // onStepContinue takes us to the next step
              onStepContinue: () {
                if (_activeCurrentStep < (stepList().length)) {
                  setState(() {
                    _activeCurrentStep += 1;
                  });
                }
              },

              // onStepCancel takes us to the previous step
              onStepCancel: () {
                if (_activeCurrentStep == 0) {
                  return;
                }

                setState(() {
                  _activeCurrentStep -= 1;
                });
              },

              // onStepTap allows to directly click on the particular step we want
              onStepTapped: (int index) {
                setState(() {
                  _activeCurrentStep = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
