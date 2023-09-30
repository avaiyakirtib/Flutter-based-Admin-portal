import 'package:admin/core/constants.dart';
import 'dart:html' as html;
import 'package:admin/core/widgets/bar_graph_card.dart';
import 'package:admin/core/widgets/common_widget.dart';
import 'package:admin/core/widgets/custom_card.dart';
import 'package:admin/core/widgets/line_chart_card.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'components/header.dart';
import 'components/my_fields.dart';
import 'components/recent_files.dart';
import 'components/storage_details.dart';

class StaffScreen extends StatefulWidget {
  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  TextEditingController dateRangeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    SizedBox _height(BuildContext context) => SizedBox(
          height: Responsive.isDesktop(context) ? 30 : 20,
        );
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Header(title: "Staff"),
            SizedBox(height: defaultPadding),
            _height(context),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: CustomCard(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: !Responsive.isMobile(context)
                                ? !Responsive.isTablet(context)
                                    ? width * 0.02
                                    : width * 0.015
                                : width * 0.03),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                headerView(),
                                metricsView(),
                                offlineConversionsView(),
                                if (Responsive.isMobile(context))
                                  SizedBox(height: defaultPadding),
                                if (Responsive.isMobile(context))
                                  _chartView(_height, context),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we don't want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 1,
                    child: _chartView(_height, context),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _chartView(
      SizedBox _height(BuildContext context), BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          BarGraphCard(),
          _height(context),
          LineChartCard(),
        ],
      ),
    );
  }

  Widget headerView() {
    return Text(
      "Acme inc. reports",
      style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: appColors.xffffffff.withOpacity(0.8)),
    );
  }

  Widget metricsView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TitleView(
            controller: dateRangeController,
            text: "Matrics",
            buttonText: 'Date range',
            onTap: () {
              _selectDate(context);
            }),
        const DetailsView(title: "page views", value: '56,320'),
        const DetailsView(title: "leads", value: '10,170'),
        const DetailsView(title: "qualifield leads", value: '2,560'),
        const DetailsView(title: "matching errors", value: '23'),
      ],
    );
  }

  Widget offlineConversionsView() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          const TitleView(text: 'Offline Conversions'),
          const DetailsView(
              padding: EdgeInsets.only(top: 18),
              title: "GA4 measurement ID",
              value: 'synching....'),
          const DetailsView(
              padding: EdgeInsets.only(top: 18),
              title: "GAD conversionID",
              value: 'synching....'),
          const DetailsView(
              padding: EdgeInsets.only(top: 18),
              title: "FB pixel ID",
              value: 'synching....'),
          const DetailsView(
              padding: EdgeInsets.only(top: 18),
              title: "Tiktok account ID",
              value: 'synching....'),
          DetailsView(
              title: "UET account ID",
              buttonText: "Download Csv",
              onTap: () {
                html.AnchorElement anchorElement = new html.AnchorElement(
                    href:
                        "https://people.sc.fsu.edu/~jburkardt/data/csv/addresses.csv");
                anchorElement.download =
                    "https://people.sc.fsu.edu/~jburkardt/data/csv/addresses.csv";
                anchorElement.click();
              }),
          DetailsView(
              title: "Linkedin account ID",
              buttonText: "Download Csv",
              onTap: () {
                html.AnchorElement anchorElement = new html.AnchorElement(
                    href:
                        "https://people.sc.fsu.edu/~jburkardt/data/csv/addresses.csv");
                anchorElement.download =
                    "https://people.sc.fsu.edu/~jburkardt/data/csv/addresses.csv";
                anchorElement.click();
              }),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        dateRangeController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
}
