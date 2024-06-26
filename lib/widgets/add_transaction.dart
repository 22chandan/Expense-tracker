import 'package:expenseapp/Controller/ChartController/chart_controller.dart';
import 'package:expenseapp/Controller/TransactionController/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddTransactionAlert extends StatefulWidget {
  const AddTransactionAlert({Key? key}) : super(key: key);

  @override
  State<AddTransactionAlert> createState() => _AddTransactionAlertState();
}

class _AddTransactionAlertState extends State<AddTransactionAlert> {
  TransactionController transactionController =
      Get.put(TransactionController());
  ChartController chartController = Get.put(ChartController());
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      insetAnimationCurve: Curves.fastLinearToSlowEaseIn,
      alignment: Alignment.center,
      child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
                color: context.isDarkMode
                    ? const Color.fromARGB(163, 0, 0, 0)
                    : Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            margin: EdgeInsets.zero,
            padding: const EdgeInsets.all(20),
            height: Get.height * 0.75,
            width: Get.width,
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.cancel,
                          size: 22.sp,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Text("Enter Transaction Details",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20.sp,
                          color:
                              context.isDarkMode ? Colors.white : Colors.black,
                        )),
                    SizedBox(
                      height: 4.h,
                    ),
                    Obx(
                      () => SizedBox(
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                transactionController.paidOrRecived.value = 0;
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: !context.isDarkMode
                                            ? Colors.black38
                                            : Colors.white,
                                        width: 1,
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(3),
                                    child: transactionController
                                                .paidOrRecived.value ==
                                            0
                                        ? Container(
                                            height: 18,
                                            width: 18,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              shape: BoxShape.circle,
                                            ),
                                          )
                                        : Container(),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Paid",
                                    style: TextStyle(
                                      color: !context.isDarkMode
                                          ? Colors.black38
                                          : Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                transactionController.paidOrRecived.value = 1;
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.green,
                                        width: 1,
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(3),
                                    child: transactionController
                                                .paidOrRecived.value ==
                                            1
                                        ? Container(
                                            height: 18,
                                            width: 18,
                                            decoration: const BoxDecoration(
                                              color: Colors.green,
                                              shape: BoxShape.circle,
                                            ),
                                          )
                                        : Container(),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Recived",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" Enter Amount",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: context.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 60,
                          width: Get.width * 0.9,
                          padding: const EdgeInsets.only(right: 20, left: 4),
                          decoration: BoxDecoration(
                            color: context.isDarkMode
                                ? Color.fromARGB(187, 0, 0, 0)
                                : Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            border: Border.all(
                              width: 2,
                              color: !context.isDarkMode
                                  ? Colors.black38
                                  : Colors.white,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Obx(
                                () => TextFormField(
                                  controller:
                                      transactionController.transactionAmount,
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                  keyboardType: TextInputType.number,
                                  cursorColor: !context.isDarkMode
                                      ? Colors.black38
                                      : Colors.white,
                                  decoration: InputDecoration(
                                    hintText: transactionController
                                                .paidOrRecived.value ==
                                            0
                                        ? "Amount Paid!"
                                        : "Amount Recived!",
                                    fillColor: context.isDarkMode
                                        ? Colors.black38
                                        : Colors.white,
                                    focusedBorder: InputBorder.none,
                                    border: InputBorder.none,
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" Transaction with",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: context.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 60,
                          width: Get.width * 0.9,
                          padding: const EdgeInsets.only(right: 20, left: 4),
                          decoration: BoxDecoration(
                            color: context.isDarkMode
                                ? Color.fromARGB(187, 0, 0, 0)
                                : Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            border: Border.all(
                              width: 2,
                              color: !context.isDarkMode
                                  ? Colors.black38
                                  : Colors.white,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                controller:
                                    transactionController.transactionWith,
                                decoration: InputDecoration(
                                  hintText: "Enter Name",
                                  border: InputBorder.none,
                                  fillColor: context.isDarkMode
                                      ? Colors.black38
                                      : Colors.white,
                                ),
                              )),
                              // const SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(" Transaction Notes",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 60,
                          width: Get.width * 0.9,
                          padding: const EdgeInsets.only(right: 20, left: 4),
                          decoration: BoxDecoration(
                            color: context.isDarkMode
                                ? Color.fromARGB(187, 0, 0, 0)
                                : Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            border: Border.all(
                              width: 2,
                              color: !context.isDarkMode
                                  ? Colors.black38
                                  : Colors.white,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                controller:
                                    transactionController.transactionNotes,
                                decoration: InputDecoration(
                                  hintText: "Enter Notes",
                                  border: InputBorder.none,
                                  fillColor: context.isDarkMode
                                      ? Colors.black38
                                      : Colors.white,
                                ),
                              )),
                              // const SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(" Select Reason",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        _reasonListTile(),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        transactionController.addTransaction(
                          amount: double.parse(
                              transactionController.transactionAmount.text),
                          paidOrRec: transactionController.paidOrRecived.value,
                          notes: transactionController.transactionNotes.text,
                          reason: transactionController.transactionReason.value,
                          toWhom: transactionController.transactionWith.text,
                        );
                        transactionController.transactionAmount.text = "";
                        transactionController.paidOrRecived.value = 0;
                        transactionController.transactionNotes.text = "";
                        transactionController.transactionReason.value = "Food";
                        transactionController.transactionWith.text = "";
                        chartController.getTransactionList();
                        Get.back();
                      },
                      child: Container(
                        width: 130,
                        height: 50,
                        decoration: BoxDecoration(
                          color: context.isDarkMode
                              ? Color.fromARGB(255, 100, 149, 255)
                              : Colors.blue.shade400,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Text(
                            "SUBMIT".tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

Widget _reasonListTile() {
  TransactionController transactionController =
      Get.put(TransactionController());
  List<String> reasons = <String>[
    "None",
    "Food",
    "Traveling",
    "Rent",
    "Recharge",
    "Electricity",
    "Shopping",
    "Grocery",
    "Party",
  ];

  return SizedBox(
    height: 50,
    width: Get.width,
    child: RotatedBox(
        quarterTurns: -1,
        child: Scrollbar(
          child: ListWheelScrollView.useDelegate(
            onSelectedItemChanged: (value) {
              transactionController.selectedReason.value = value;
              transactionController.transactionReason.value = reasons[value];
            },
            physics: const FixedExtentScrollPhysics(),
            controller: FixedExtentScrollController(initialItem: 1),
            itemExtent: 100,
            diameterRatio: 1.7,
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: reasons.length,
              builder: (context, index) {
                return RotatedBox(
                    quarterTurns: 1,
                    child: Obx(
                      () => Container(
                        height: 35,
                        decoration: BoxDecoration(
                            color: transactionController.selectedReason.value ==
                                    index
                                ? const Color.fromARGB(255, 100, 149, 255)
                                : Colors.deepPurple,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: Text(
                            reasons[index].toString(),
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ));
              },
            ),
          ),
        )),
  );
}
