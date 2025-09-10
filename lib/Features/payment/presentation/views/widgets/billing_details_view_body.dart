import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/cart/data/models/cart_model.dart';
import 'package:store_powered_ai/Features/payment/presentation/manger/cubits/address_cubit/address_cubit.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/payment_method_view.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/widgets/custom_billing_text_field.dart';
import 'package:store_powered_ai/core/widgets/custom_button.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/widgets/custom_drop_down_billing.dart';

class BillingDetailsViewBody extends StatefulWidget {
  const BillingDetailsViewBody({super.key, required this.cartModel});
  final CartModel cartModel;
  @override
  State<BillingDetailsViewBody> createState() => _BillingDetailsViewBodyState();
}

class _BillingDetailsViewBodyState extends State<BillingDetailsViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String email = '';
  String country = '';
  String city = '';
  String stateSelected = '';
  String streetAddress = '';
  String zipCode = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomBillingTextField(
              formName: 'First Name *',
              hintText: 'Ex. Reem',
              onChanged: (value) {
                firstName = value; // تخزين القيمة المدخلة
              },
            ),
            CustomBillingTextField(
              formName: 'Last Name *',
              hintText: 'Ex. Elabd',
              onChanged: (value) {
                lastName = value; // تخزين القيمة المدخلة
              },
            ),
            CustomBillingTextField(
              formName: 'Phone *',
              hintText: 'Enter Phone Number',
              onChanged: (value) {
                phoneNumber = value;
              },
            ),
            CustomBillingTextField(
              formName: 'Email *',
              hintText: 'Enter Email Address',
              onChanged: (value) {
                email = value;
              },
            ),
            CustomDropDownBilling(
              listName: const [
                "Egypt",
                "USA",
                "UK",
                "France",
                "UAE",
                "Saudi Arabia",
                "Germany",
                "Turkey",
                "Italy",
                "Spain",
                "Canada",
                "Qatar",
              ],
              formName: 'Country *',
              hintText: 'Select Country',
              onChanged: (value) {
                setState(() {
                  country = value!;
                });
              },
            ),
            CustomDropDownBilling(
              listName: const [
                "Cairo",
                "Giza",
                "Alexandria",
                "Mansoura",
                "Tanta",
                "Zagazig",
                "New York",
                "Los Angeles",
                "Houston",
                "London",
                "Paris",
                "Dubai",
                "Riyadh",
                "Berlin",
                "Istanbul",
                "Milan",
                "Barcelona",
                "Toronto",
                "Doha",
              ],
              formName: 'City *',
              hintText: 'Select City',
              onChanged: (value) {
                setState(() {
                  city = value!;
                });
              },
            ),
            CustomDropDownBilling(
              listName: const [
                "Cairo",
                "Giza",
                "Alexandria",
                "Dakahlia",
                "Gharbia",
                "Sharqia",
                "NY",
                "California",
                "Texas",
                "England",
                "Île-de-France",
                "Dubai",
                "Riyadh Province",
                "Berlin",
                "Istanbul",
                "Lombardy",
                "Catalonia",
                "Ontario",
                "Doha",
              ],
              formName: 'State *',
              hintText: 'Select State',
              onChanged: (value) {
                setState(() {
                  stateSelected = value!;
                });
              },
            ),
            CustomBillingTextField(
              formName: 'Street Address *',
              hintText: 'Enter Street Address',
              onChanged: (value) {
                streetAddress = value;
              },
            ),
            CustomBillingTextField(
              formName: 'Zip Code *',
              hintText: 'Enter Zip Code',
              onChanged: (value) {
                zipCode = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 15,
              ),
              child: BlocConsumer<AddressCubit, AddressState>(
                listener: (context, state) {
                  if (state is AddressSuccess) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PaymentMethodView(
                        addressId: state.address.id,
                        currency: country,
                        cartModel: widget.cartModel,
                      );
                    }));
                  } else if (state is AddressFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Failed, Try Again: ${state.error}')),
                    );
                  }
                },
                builder: (context, state) {
                  final isLoading = state is AddressLoading;
                  return CustomButton(
                    text: 'Continue to Payment',
                    onPressed: isLoading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<AddressCubit>(context)
                                  .submitAddress(
                                firstName: firstName,
                                lastName: lastName,
                                phoneNumber: phoneNumber,
                                email: email,
                                country: country,
                                city: city,
                                state: stateSelected,
                                streetAddress: streetAddress,
                                zipCode: zipCode,
                              );
                            }
                          },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
