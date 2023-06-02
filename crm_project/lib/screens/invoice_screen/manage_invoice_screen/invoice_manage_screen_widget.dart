import 'dart:developer';

import 'package:crm_project/common_modules/common_textfield.dart';
import 'package:crm_project/controller/company_module_controllers/invoice_manage_screen_controller.dart';
import 'package:crm_project/utils/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../common_modules/common_textfield_header_module.dart';
import '../../../common_modules/custom_submit_button.dart';
import '../../../constants/colors.dart';
import '../../../models/bill_screen_model/active_payment_type_list_model.dart';
import '../../../models/invoice_screen_models/invoice_item_list_model.dart';
import '../../../models/invoice_screen_models/invoice_payment_list_model.dart';
import '../../../models/ledger_screen_model/active_category_type_list_model.dart';
import '../../../models/work_order_screen_models/details_work_order_screen_models/work_order_company_list_model.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/decorations.dart';
import '../../../utils/enums.dart';
import '../../../utils/messaging.dart';

//bill to
class InvoiceBillToWidget extends StatelessWidget {
  InvoiceBillToWidget({Key? key}) : super(key: key);
  final invoiceManageScreenController =
      Get.find<InvoiceManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFieldHeaderModule(header: AppMessage.company, required: true),
        const SizedBox(height: 5),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField(
            //<PropertyData>(
            isExpanded: true,
            decoration: dropdownInputDecoration,
            hint: Text(
              AppMessage.company,
              style: const TextStyle(color: AppColors.appColors),
            ),
            value: invoiceManageScreenController.billCompanyListValue,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.companyName == AppMessage.selectBillingCompany) {
                return "Please ${AppMessage.selectBillingCompany}";
              }
              return null;
            },

            onChanged: (newValue) async {
              invoiceManageScreenController.billCompanyListValue = newValue!;
              invoiceManageScreenController.loadUi();
              log('bill Company : ${invoiceManageScreenController.billCompanyListValue.toJson()}');
            },
            items: invoiceManageScreenController.billCompanyListDropDown
                .map((value) {
              return DropdownMenuItem<WorkOrderCompanyData>(
                value: value,
                child: Text(value.companyName!),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
        CommonTextFieldHeaderModule(
            header: AppMessage.billingAddress, required: false),
        const SizedBox(height: 5),
        TextFieldModule(
            fieldController:
                invoiceManageScreenController.billAddressTextFieldController,
            hintText: AppMessage.billingAddress,
            keyboardType: TextInputType.text),
        const SizedBox(height: 5),
      ],
    );
  }
}

//ship to
class InvoiceShipToWidget extends StatelessWidget {
  InvoiceShipToWidget({Key? key}) : super(key: key);
  final invoiceManageScreenController =
      Get.find<InvoiceManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFieldHeaderModule(header: AppMessage.company, required: true),
        const SizedBox(height: 5),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField(
            //<PropertyData>(
            isExpanded: true,
            decoration: dropdownInputDecoration,
            hint: Text(
              AppMessage.company,
              style: const TextStyle(color: AppColors.appColors),
            ),
            value: invoiceManageScreenController.shipCompanyListValue,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.companyName == AppMessage.selectShippingCompany) {
                return "Please ${AppMessage.selectShippingCompany}";
              }
              return null;
            },

            onChanged: (newValue) async {
              invoiceManageScreenController.shipCompanyListValue = newValue!;
              invoiceManageScreenController.loadUi();
              log('ship Company : ${invoiceManageScreenController.shipCompanyListValue.toJson()}');
            },
            items: invoiceManageScreenController.shipCompanyListDropDown
                .map((value) {
              return DropdownMenuItem<WorkOrderCompanyData>(
                value: value,
                child: Text(value.companyName!),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
        CommonTextFieldHeaderModule(
            header: AppMessage.shippingAddress, required: false),
        const SizedBox(height: 5),
        TextFieldModule(
            fieldController:
                invoiceManageScreenController.shipAddressTextFieldController,
            hintText: AppMessage.billingAddress,
            keyboardType: TextInputType.text),
        const SizedBox(height: 5),
      ],
    );
  }
}

//date Pick
class InvoiceDatePickerWidget extends StatelessWidget {
  InvoiceDatePickerWidget({Key? key}) : super(key: key);
  final invoiceManageScreenController =
      Get.find<InvoiceManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextFieldHeaderModule(
                  header: AppMessage.date, required: true),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.appColors, width: 1),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      invoiceManageScreenController.showSelectedDate.value,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        // color: AppColors.greyColor,
                      ),
                    ).paddingOnly(left: 10)),
                    GestureDetector(
                      onTap: () async {
                        invoiceManageScreenController.selectedDateType =
                            WorkOrderDetailsDate.date;
                        await invoiceManageScreenController.selectDate(context);
                      },
                      child: SizedBox(
                        child: Center(
                          child: const Icon(Icons.calendar_today_outlined)
                              .paddingAll(12),
                        ), //Text(AppMessage.chooseFile,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: AppColors.appColors),)).paddingAll(5)
                      ),
                    ),
                  ],
                ),
              ).paddingOnly(bottom: 5),
            ],
          )),
          const SizedBox(width: 10),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextFieldHeaderModule(
                  header: AppMessage.dueDate, required: true),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.appColors, width: 1),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      invoiceManageScreenController.showSelectedDueDate.value,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        // color: AppColors.greyColor,
                      ),
                    ).paddingOnly(left: 10)),
                    GestureDetector(
                      onTap: () async {
                        invoiceManageScreenController.selectedDateType =
                            WorkOrderDetailsDate.dueDate;
                        await invoiceManageScreenController.selectDate(context);
                      },
                      child: SizedBox(
                        child: Center(
                          child: const Icon(Icons.calendar_today_outlined)
                              .paddingAll(12),
                        ), //Text(AppMessage.chooseFile,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: AppColors.appColors),)).paddingAll(5)
                      ),
                    ),
                  ],
                ),
              ).paddingOnly(bottom: 5),
            ],
          ))
        ],
      ),
    );
  }
}

//paid & printed switch Button
class InvoiceSwitchButtonWidget extends StatelessWidget {
  InvoiceSwitchButtonWidget({Key? key}) : super(key: key);
  final invoiceManageScreenController =
      Get.find<InvoiceManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Row(
            children: [
              Transform.scale(
                alignment: AlignmentDirectional.centerEnd,
                scale: 0.8,
                child: CupertinoSwitch(
                  activeColor: AppColors.appColors,
                  trackColor: AppColors.appColorsSecondry,
                  value: invoiceManageScreenController.paidIsActive.value,
                  onChanged: (value) {
                    invoiceManageScreenController.paidIsActive.value = value;
                  },
                ),
              ),
              const SizedBox(width: 3),
              Text(AppMessage.paid, style: TextStyle(fontSize: 11.sp)),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                alignment: AlignmentDirectional.centerEnd,
                scale: 0.8,
                child: CupertinoSwitch(
                  activeColor: AppColors.appColors,
                  trackColor: AppColors.appColorsSecondry,
                  value: invoiceManageScreenController.printedIsActive.value,
                  onChanged: (value) {
                    invoiceManageScreenController.printedIsActive.value = value;
                  },
                ),
              ),
              const SizedBox(width: 3),
              Text(AppMessage.printed, style: TextStyle(fontSize: 11.sp)),
            ],
          )
        ],
      ),
    );
  }
}

//balance TextField
class InvoiceBalanceWidget extends StatelessWidget {
  InvoiceBalanceWidget({Key? key}) : super(key: key);
  final invoiceManageScreenController =
      Get.find<InvoiceManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFieldHeaderModule(
            header: AppMessage.balanceLabel, required: true),
        const SizedBox(height: 5),
        TextFieldModule(
            fieldController: invoiceManageScreenController.balanceTextFieldController,
            hintText: AppMessage.balanceLabel,
            onChange: (e){
              invoiceManageScreenController.totalTextFieldController.text = invoiceManageScreenController.balanceTextFieldController.text;
            },
            validate: (value) => FieldValidation().validateNum(value),
            keyboardType: TextInputType.number),
        const SizedBox(height: 5),
      ],
    );
  }
}

//balance TextField
class InvoiceTotalWidget extends StatelessWidget {
  InvoiceTotalWidget({Key? key}) : super(key: key);
  final invoiceManageScreenController =
      Get.find<InvoiceManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFieldHeaderModule(
            header: AppMessage.total, required: true),
        const SizedBox(height: 5),
        TextFieldModule(
            fieldController: invoiceManageScreenController.totalTextFieldController,
            hintText: AppMessage.total,
            onChange: (e){
              invoiceManageScreenController.balanceTextFieldController.text = invoiceManageScreenController.totalTextFieldController.text;
            },
            validate: (value) => FieldValidation().validateNum(value),
            keyboardType: TextInputType.number),
        const SizedBox(height: 5),
      ],
    );
  }
}



//item
class InvoiceItemListModule extends StatelessWidget {
  // GlobalKey<FormState> formKey;
  InvoiceItemListModule({Key? key, /*required this.formKey*/}) : super(key: key);
  final screenController = Get.find<InvoiceManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        ListView.builder(
          itemCount: screenController.mainItemList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            InvoiceItemDetailsModel singleItem = screenController.mainItemList[i];
            return InvoiceItemListTile(
              index: i,
              singleItem: singleItem,
              invoiceManageScreenController: screenController,
            );
          },
        ),

        CustomSubmitButton(
          labelText: "Add Item",
          onPress: () {
            screenController.setMainItemListFunction();
            screenController.loadUi();
          },
        ).paddingSymmetric(horizontal: 30.w),
      ],
    );
  }
}

class InvoiceItemListTile extends StatelessWidget {
  int index;
  InvoiceItemDetailsModel singleItem;
  InvoiceManageScreenController invoiceManageScreenController;

  InvoiceItemListTile({
    Key? key,
    required this.index,
    required this.singleItem,
    required this.invoiceManageScreenController,
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
                        invoiceManageScreenController.loadUi();
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
                  invoiceManageScreenController.mainItemList.removeAt(index);
                  invoiceManageScreenController.loadUi();
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
                          invoiceManageScreenController.loadUi();
                        },
                        // Getting From Controller
                        items: invoiceManageScreenController.itemNameList.map((value) {
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
                      required: true
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

                          singleItem.itemTotalFieldController.text =singleItem.priceFieldController.text;
                          // if(singleItem.qtyFieldController.text != "" && singleItem.priceFieldController.text != "") {
                          //   singleItem.itemTotalFieldController.text = (int.parse(singleItem.qtyFieldController.text) * int .parse(singleItem.priceFieldController.text)).toString();
                          //   log('itemTotalFieldController : ${singleItem.itemTotalFieldController.text}');
                          // } else {
                          //   singleItem.itemTotalFieldController.text = "0";
                          // }
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


// payment
class InvoicePaymentListModule extends StatelessWidget {
  // GlobalKey<FormState> formKey;
  InvoicePaymentListModule({Key? key, /*required this.formKey*/}) : super(key: key);
  final screenController = Get.find<InvoiceManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        ListView.builder(
          itemCount: screenController.mainPaymentList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            InvoicePaymentListModel singleItem = screenController.mainPaymentList[i];
            return InvoicePaymentListTile(
              index: i,
              singleItem: singleItem,invoiceManageScreenController: screenController,
            );
          },
        ),


        CustomSubmitButton(
          labelText: "Add Payment",
          onPress: () {
            screenController.setMainPaymentListFunction();
            screenController.loadUi();
          },
        ).paddingSymmetric(horizontal: 25.w),
      ],
    );
  }
}

class InvoicePaymentListTile extends StatelessWidget {
  int index;
  InvoicePaymentListModel singleItem;
  InvoiceManageScreenController invoiceManageScreenController;
  InvoicePaymentListTile({Key? key,
    required this.index,
    required this.singleItem,
    required this.invoiceManageScreenController,
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
                  invoiceManageScreenController.mainPaymentList.removeAt(index);
                  invoiceManageScreenController.loadUi();
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
                            ).then((value) => invoiceManageScreenController.loadUi()),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        value: singleItem.paymentTypeDataValue,
                        onChanged: (newValue) async {
                          singleItem.paymentTypeDataValue = newValue!;
                          // loadUI getting from controller
                          invoiceManageScreenController.loadUi();
                        },
                        // Getting From Controller
                        items: invoiceManageScreenController.paymentTypeList.map((value) {
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (newValue) async {
                    singleItem.categoryTypeDataValue = newValue!;
                    // loadUI getting from controller
                    invoiceManageScreenController.loadUi();
                  },
                  // Getting From Controller
                  items:
                  invoiceManageScreenController.categoryTypeList.map((value) {
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

