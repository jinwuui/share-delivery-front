import 'package:flutter/material.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/molecules/expected_order_time.dart';

class RegisterExpectedDeliveryTimeSection extends StatelessWidget {
  const RegisterExpectedDeliveryTimeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "예상 배달 완료 시각",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: ExpectedOrderTime(),
              ),
              Expanded(
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                    ),
                    onPressed: () {},
                    child: Text("hello"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
