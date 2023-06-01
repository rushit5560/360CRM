import 'dart:developer';

import 'package:crm_project/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../common_modules/common_textfield.dart';
import '../../../common_modules/common_textfield_header_module.dart';
import '../../../common_modules/custom_submit_button.dart';
import '../../../constants/colors.dart';
import '../../../controller/bill_manage_screen_controller.dart';
import '../../../models/bill_screen_model/active_payment_method_list_model.dart';
import '../../../models/bill_screen_model/active_payment_type_list_model.dart';
import '../../../models/bill_screen_model/item_list_model.dart';
import '../../../models/bill_screen_model/payment_list_model.dart';
import '../../../models/ledger_screen_model/active_category_type_list_model.dart';
import '../../../models/ledger_screen_model/active_company_list_model.dart';
import '../../../models/ledger_screen_model/active_property_model.dart';
import '../../../utils/decorations.dart';
import '../../../utils/messaging.dart';
import '../../../utils/validator.dart';

class BillCompanyDropDownModule extends StatelessWidget {
  BillCompanyDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<BillManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: AppMessage.companyLabel,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11.sp,
                color: AppColors.blackColor.withOpacity(0.6)),
            children: [
              TextSpan(
                text: " *",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11.sp,
                    color: AppColors.redColor),
              ),
            ],
          ),
        ).paddingOnly(bottom: 5),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField<CompanyData>(
            isExpanded: true,
            decoration: dropdownInputDecoration,
            hint: Text(
              AppMessage.selectCompanyLabel,
              style: const TextStyle(color: AppColors.appColors),
            ),
            // Not necessary for Option 1
            onChanged: (newValue) async {
              screenController.companyDataValue = newValue!;
              screenController.loadUI();
            },
            value: screenController.companyDataValue,
            items: screenController.companyList.map((value) {
              return DropdownMenuItem<CompanyData>(
                value: value,
                child: Text(value.companyName!),
              );
            }).toList(),
          ),
        ),
      ],
    ).paddingSymmetric(vertical: 10);
  }
}

class BillPropertyDropDownModule extends StatelessWidget {
  BillPropertyDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<BillManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: AppMessage.propertyLabel,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11.sp,
                color: AppColors.blackColor.withOpacity(0.6)),
          ),
        ).paddingOnly(bottom: 5),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField<PropertyData>(
            isExpanded: true,
            decoration: dropdownInputDecoration,
            hint: Text(
              AppMessage.selectPropertyLabel,
              style: const TextStyle(color: AppColors.appColors),
            ),
            value: screenController.propertyDataValue,
            onChanged: (newValue) async {
              screenController.propertyDataValue = newValue!;
              screenController.loadUI();
            },
            items: screenController.propertyList.map((value) {
              return DropdownMenuItem<PropertyData>(
                value: value,
                child: Text(value.propertyName!),
              );
            }).toList(),
          ),
        ),
      ],
    ).paddingSymmetric(vertical: 10);
  }
}

// class KeepAliveWrapper extends StatefulWidget {
//   final Widget child;
//
//   const KeepAliveWrapper({Key? key, required this.child}) : super(key: key);
//
//   @override
//   __KeepAliveWrapperState createState() => __KeepAliveWrapperState();
// }
//
// class __KeepAliveWrapperState extends State<KeepAliveWrapper>
//     with AutomaticKeepAliveClientMixin {
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return widget.child;
//   }
//
//   @override
//   bool get wantKeepAlive => true;
// }

class ItemListModule extends StatelessWidget {
  // GlobalKey<FormState> formKey;
  ItemListModule({Key? key, /*required this.formKey*/}) : super(key: key);
  final screenController = Get.find<BillManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListView.builder(
          itemCount: screenController.mainItemList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            ItemDetailsModel singleItem = screenController.mainItemList[i];
            return ItemListTile(
              index: i,
              singleItem: singleItem,
              billManageScreenController: screenController,

            );
            /*return ExpansionTile(
              title: Text('${i+1}'),
              children: [
                ItemListTile(
                  index: i,
                  singleItem: singleItem,
                  billManageScreenController: screenController,
                ),
              ],
            );*/
          },
        ),

        CustomSubmitButton(
          labelText: "Add Item",
          onPress: () {
            screenController.setMainItemListFunction();
            screenController.loadUI();
          },
        ).paddingSymmetric(horizontal: 30.w),
      ],
    );
  }
}

class ItemListTile extends StatelessWidget {
  int index;
  ItemDetailsModel singleItem;
  BillManageScreenController billManageScreenController;

  ItemListTile({
    Key? key,
    required this.index,
    required this.singleItem,
    required this.billManageScreenController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColors.appColors, width: 1.5),
      ),
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Active Checkbox module
              Expanded(
                child: Row(
                  children: [
                    CommonTextFieldHeaderModule(
                      header: AppMessage.active,
                      required: false,
                    ).paddingOnly(right: 10),
                    Checkbox(
                      value: singleItem.isActive,
                      onChanged: (value) {
                        singleItem.isActive = value!;
                        billManageScreenController.loadUI();
                      },
                      activeColor: AppColors.appColors,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ],
                ),
              ),

              // Close button module
              GestureDetector(
                onTap: () {
                  log('Close');
                  billManageScreenController.mainItemList.removeAt(index);
                  billManageScreenController.loadUI();
                },
                child: Icon(Icons.close_rounded,
                  color: AppColors.redColor,
                  size: 18.sp,
                ),
              ),
            ],
          ),

          // Qty & Item name Dropdown module
          Row(
            children: [
              Expanded(
                flex: 3,
                child: // Qty Module
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFieldHeaderModule(
                      header: AppMessage.qty,
                      required: true,
                    ),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: singleItem.qtyFieldController,
                      hintText: AppMessage.qty,
                      // labelText: 'Amount',
                      keyboardType: TextInputType.number,
                      validate: (value) =>
                          FieldValidation().validateEmpty(value, AppMessage.qty.toLowerCase()),
                      onChange: (value) {
                        if(singleItem.qtyFieldController.text != "" && singleItem.priceFieldController.text != "") {
                          singleItem.itemTotalFieldController.text = (int.parse(singleItem.qtyFieldController.text) * int .parse(singleItem.priceFieldController.text)).toString();
                          log('itemTotalFieldController : ${singleItem.itemTotalFieldController.text}');
                        } else {
                          singleItem.itemTotalFieldController.text = "0";
                        }
                      },
                    ),
                  ],
                ).paddingSymmetric(vertical: 10),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 7,
                child:// Item name module
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFieldHeaderModule(
                      header: AppMessage.itemNameLabel,
                      required: true,
                    ),
                    const SizedBox(height: 5),
                    DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<CategoryTypeData>(
                        isExpanded: true,
                        decoration: dropdownInputDecoration,
                        hint: Text(
                          AppMessage.selectPropertyLabel,
                          style: const TextStyle(color: AppColors.appColors),
                        ),
                        value: singleItem.categoryTypeDataValue,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if(value!.category == "Select Item Name") {
                            return "Please item name";
                          }
                          return null;
                        },
                        onChanged: (newValue) async {
                          singleItem.categoryTypeDataValue = newValue!;
                          // loadUI getting from controller
                          billManageScreenController.loadUI();
                        },
                        // Getting From Controller
                        items: billManageScreenController.itemNameList.map((value) {
                          return DropdownMenuItem<CategoryTypeData>(
                            value: value,
                            child: Text(value.category!),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ).paddingSymmetric(vertical: 10) ,
              ),
            ],
          ),


          // Description Module
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextFieldHeaderModule(
                header: AppMessage.description,
                required: true,
              ),
              const SizedBox(height: 5),
              TextFieldModule(
                fieldController: singleItem.descriptionFieldController,
                hintText: AppMessage.description,
                // labelText: 'Amount',
                keyboardType: TextInputType.text,
                validate: (value) =>
                    FieldValidation().validateEmpty(value, AppMessage.description.toLowerCase()),
              ),
            ],
          ).paddingSymmetric(vertical: 10),

          // Unit , Price, Total
          Row(
            children: [
              // Unit Module
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFieldHeaderModule(
                      header: AppMessage.unit,
                      required: true,
                    ),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: singleItem.unitFieldController,
                      hintText: AppMessage.unit,
                      // labelText: 'Amount',
                      keyboardType: TextInputType.number,
                      validate: (value) =>
                          FieldValidation().validateEmpty(value, AppMessage.unit.toLowerCase()),
                    ),
                  ],
                ).paddingSymmetric(vertical: 10),
              ),
              const SizedBox(width: 10),
              // Price Module
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFieldHeaderModule(
                      header: AppMessage.price,
                      required: true,
                    ),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: singleItem.priceFieldController,
                      hintText: AppMessage.price,
                      // labelText: 'Amount',
                      keyboardType: TextInputType.number,
                      validate: (value) =>
                          FieldValidation().validateEmpty(value, AppMessage.price.toLowerCase()),
                        onChange: (value) {
                          if(singleItem.qtyFieldController.text != "" && singleItem.priceFieldController.text != "") {
                            singleItem.itemTotalFieldController.text = (int.parse(singleItem.qtyFieldController.text) * int .parse(singleItem.priceFieldController.text)).toString();
                            log('itemTotalFieldController : ${singleItem.itemTotalFieldController.text}');
                          } else {
                            singleItem.itemTotalFieldController.text = "0";
                          }
                        }
                    ),
                  ],
                ).paddingSymmetric(vertical: 10),
              ),
              const SizedBox(width: 10),
              // Total Module
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFieldHeaderModule(
                      header: AppMessage.totalLabel,
                      required: false,
                    ),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: singleItem.itemTotalFieldController,
                      hintText: AppMessage.totalLabel,
                      // labelText: 'Amount',
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      validate: (value) =>
                          FieldValidation().validateEmpty(value, AppMessage.totalLabel.toLowerCase()),
                    ),
                  ],
                ).paddingSymmetric(vertical: 10),
              ),
            ],
          ),
        ],
      ).paddingAll(5),
    ).paddingSymmetric(vertical: 8, horizontal: 8);
  }
}



class PaymentListModule extends StatelessWidget {
  // GlobalKey<FormState> formKey;
  PaymentListModule({Key? key, /*required this.formKey*/}) : super(key: key);
  final screenController = Get.find<BillManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

        ListView.builder(
          itemCount: screenController.mainPaymentList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            PaymentListModel singleItem = screenController.mainPaymentList[i];
            return PaymentListTile(
              index: i,
              singleItem: singleItem,
              billManageScreenController: screenController,
            );
            /*return ExpansionTile(
              title: Text('${i+1}'),
              children: [
                PaymentListTile(
                  index: i,
                  singleItem: singleItem,
                  billManageScreenController: screenController,
                ),
              ],
            );*/
          },
        ),


        CustomSubmitButton(
          labelText: "Add Payment",
          onPress: () {
            screenController.setMainPaymentListFunction();
            screenController.loadUI();
          },
        ).paddingSymmetric(horizontal: 25.w),
      ],
    );
  }
}

class PaymentListTile extends StatelessWidget {
  int index;
  PaymentListModel singleItem;
  BillManageScreenController billManageScreenController;
  PaymentListTile({Key? key,
    required this.index,
    required this.singleItem,
    required this.billManageScreenController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColors.appColors, width: 1.5),
      ),
      child: Column(
        children: [

          // Close button module
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  log('Close');
                  billManageScreenController.mainPaymentList.removeAt(index);
                  billManageScreenController.loadUI();
                },
                child: Icon(Icons.close_rounded,
                  color: AppColors.redColor,
                  size: 18.sp,
                ),
              ),
            ],
          ),

          // Amount & Payment Date Module
          Row(
            children: [
              Expanded(
                // Amount Module
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFieldHeaderModule(
                      header: AppMessage.amountLabel,
                      required: true,
                    ),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: singleItem.amountFieldController,
                      hintText: AppMessage.amountLabel,
                      // labelText: 'Amount',
                      keyboardType: TextInputType.number,
                      validate: (value) =>
                          FieldValidation().validateEmpty(value, AppMessage.amountLabel.toLowerCase()),
                    ),
                  ],
                ).paddingSymmetric(vertical: 10),
              ),
              const SizedBox(width: 10),
              Expanded(
                // Select Payment Date module
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFieldHeaderModule(
                      header: AppMessage.paymentDateLabel,
                      required: true,
                    ),
                    const SizedBox(height: 5),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: AppColors.appColors, width: 1.5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                                DateFormatChanger().dateFormat(singleItem.paymentDate),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  // color: AppColors.greyColor,
                                ),
                              ).paddingOnly(left: 10)),
                          GestureDetector(
                            onTap: () async =>
                            await selectDate(
                              context: context,
                              initialDate: singleItem.paymentDate,
                              // index: index,
                            ),
                            child: SizedBox(
                              child: Center(
                                child: const Icon(Icons
                                    .calendar_today_outlined)
                                    .paddingAll(12),
                              ), //Text(AppMessage.chooseFile,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: AppColors.appColors),)).paddingAll(5)
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ).paddingSymmetric(vertical: 10) ,
              ),
            ],
          ),

          // Payment Type & Payment Method Module
          Row(
            children: [
              // Payment Type Module
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFieldHeaderModule(
                      header: AppMessage.paymentTypeLabel,
                      required: true,
                    ),
                    const SizedBox(height: 5),
                    DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<PaymentTypeData>(
                        isExpanded: true,
                        decoration: dropdownInputDecoration,
                        hint: const Text(
                          AppMessage.selectPaymentTypeLabel,
                          style: TextStyle(color: AppColors.appColors),
                        ),
                        validator: (value) {
                          if(value!.paymentTypes == "Select Payment Type") {
                            return "Select payment type";
                          }
                          return null;
                        },
                        value: singleItem.paymentTypeDataValue,
                        onChanged: (newValue) async {
                          singleItem.paymentTypeDataValue = newValue!;
                          // loadUI getting from controller
                          billManageScreenController.loadUI();
                        },
                        // Getting From Controller
                        items: billManageScreenController.paymentTypeList.map((value) {
                          return DropdownMenuItem<PaymentTypeData>(
                            value: value,
                            child: Text(value.paymentTypes!),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ).paddingSymmetric(vertical: 10),
              ),
              const SizedBox(width: 10),

              // Payment Method Module
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFieldHeaderModule(
                      header: AppMessage.paymentMethodLabel,
                      required: true,
                    ),
                    const SizedBox(height: 5),
                    DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<PaymentMethodData>(
                        isExpanded: true,
                        decoration: dropdownInputDecoration,
                        hint: const Text(
                          AppMessage.selectPaymentMethodLabel,
                          style: TextStyle(color: AppColors.appColors),
                        ),
                        validator: (value) {
                          if(value!.paymentMethods == "Select Payment Method") {
                            return "Select payment type";
                          }
                          return null;
                        },
                        value: singleItem.paymentMethodDataValue,
                        onChanged: (newValue) async {
                          singleItem.paymentMethodDataValue = newValue!;
                          // loadUI getting from controller
                          billManageScreenController.loadUI();
                        },
                        // Getting From Controller
                        items: billManageScreenController.paymentMethodList.map((value) {
                          return DropdownMenuItem<PaymentMethodData>(
                            value: value,
                            child: Text(value.paymentMethods!),
                          );
                        }).toList(),
                      ).paddingSymmetric(horizontal: 8),
                    ),
                  ],
                ).paddingSymmetric(vertical: 10),
              ),
            ],
          ),

          // Category Type Module
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextFieldHeaderModule(
                header: AppMessage.categoryTypeLabel,
                required: true,
              ),
              const SizedBox(height: 5),
              DropdownButtonHideUnderline(
                child: DropdownButtonFormField<CategoryTypeData>(
                  isExpanded: true,
                  decoration: dropdownInputDecoration,
                  hint: const Text(
                    AppMessage.categoryTypeLabel,
                    style: TextStyle(color: AppColors.appColors),
                  ),
                  value: singleItem.categoryTypeDataValue,
                  validator: (value) {
                    if(value!.category == "Select Category") {
                      return "Select category";
                    } return null;
                  },
                  onChanged: (newValue) async {
                    singleItem.categoryTypeDataValue = newValue!;
                    // loadUI getting from controller
                    billManageScreenController.loadUI();
                  },
                  // Getting From Controller
                  items: billManageScreenController.categoryTypeList.map((value) {
                    return DropdownMenuItem<CategoryTypeData>(
                      value: value,
                      child: Text(value.category!),
                    );
                  }).toList(),
                ),
              ),
            ],
          ).paddingSymmetric(vertical: 10),

          // Reference Module
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextFieldHeaderModule(
                header: AppMessage.referenceLabel,
                required: true,
              ),
              const SizedBox(height: 5),
              TextFieldModule(
                fieldController: singleItem.referenceFieldController,
                hintText: AppMessage.referenceLabel,
                // labelText: 'Amount',
                keyboardType: TextInputType.text,
                validate: (value) =>
                    FieldValidation().validateEmpty(value, AppMessage.referenceLabel.toLowerCase()),
              ),
            ],
          ).paddingSymmetric(vertical: 10),

        ],
      ).paddingAll(5),
    ).paddingSymmetric(vertical: 8, horizontal: 8);
  }


  Future<void> selectDate({
    required BuildContext context,
    required DateTime initialDate,
    // required int index,
    // required SelectedDateType selectedDateType
  }) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      singleItem.paymentDate = picked;
    }
  }
}

