import 'package:flutter/material.dart';
import 'package:in_app_purchases_intl/helper/paywall_helper.dart';
import 'package:in_app_purchases_paywall_ui/in_app_purchases_paywall_ui.dart';
import 'package:in_app_purchases_paywall_ui/paywall/widgets/insets/card_insets.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ActivePlanCard extends StatelessWidget {
  final ActivePlan plan;

  const ActivePlanCard(this.plan);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 8),
        if (plan is GooglePlayGeneralActivePlan)
          _ActivePlanGooglePlayGeneralWidget(
              plan as GooglePlayGeneralActivePlan),
        if (plan is GooglePlayActivePlan)
          _ActivePlanGooglePlayWidget(plan as GooglePlayActivePlan),
        if (plan is AppleAppStoreActivePlan)
          _ActivePlanAppleAppStoreGeneralWidget(plan as AppleAppStoreActivePlan)
      ],
    );
  }
}

class _ActivePlanGooglePlayGeneralWidget extends StatelessWidget {
  final GooglePlayGeneralActivePlan plan;

  _ActivePlanGooglePlayGeneralWidget(this.plan);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: CardInsets.normal(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Verwalte deine Abos"),
            SizedBox(height: 12),
            ElevatedButton(
                onPressed: () async {
                  await launchUrlString(plan.link);
                },
                child: Text("Meine Abos")
            )
          ],
        ),
      ),
    );
  }
}

class _ActivePlanGooglePlayWidget extends StatelessWidget {
  final GooglePlayActivePlan plan;

  _ActivePlanGooglePlayWidget(this.plan);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: CardInsets.normal(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Verwalte deine Abos"),
            SizedBox(height: 12),
            ElevatedButton(
                onPressed: () async {
                  await launchUrlString(plan.link);
                },
                child: Text("Abos von " + plan.productId))
          ],
        ),
      ),
    );
  }
}

class _ActivePlanAppleAppStoreGeneralWidget extends StatelessWidget {
  final AppleAppStoreActivePlan plan;

  _ActivePlanAppleAppStoreGeneralWidget(this.plan);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: CardInsets.normal(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Verwalte deine Abos"),
            SizedBox(height: 12),
            ElevatedButton(
                onPressed: () async {
                  await launchUrlString(plan.link);
                },
                child: Text("Meine Abos"))
          ],
        ),
      ),
    );
  }
}
