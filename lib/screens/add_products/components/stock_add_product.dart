import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:thunderapp/screens/add_products/add_products_controller.dart';

import 'package:thunderapp/shared/constants/style_constants.dart';

import '../../../components/forms/custom_text_form_field.dart';

class StockAddProduct extends StatefulWidget {
  final AddProductsController controller;

  const StockAddProduct(this.controller, {Key? key})
      : super(key: key);

  @override
  State<StockAddProduct> createState() =>
      _StockAddProductState();
}

class _StockAddProductState extends State<StockAddProduct> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Estoque atual',
          style: TextStyle(
            fontSize: size.height * 0.017,
            color: kTextButtonColor,
          ),
        ),
        Divider(
          height: size.height * 0.005,
          color: Colors.transparent,
        ),
        SizedBox(
          width: size.width * 0.25,
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            child: ClipPath(
              child: Container(
                alignment: Alignment.center,
                child: TextFormField(
                  decoration: const InputDecoration(
                    errorStyle: TextStyle(fontSize: 12),
                  ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Obrigatório';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      LengthLimitingTextInputFormatter(3),
                    ],
                    controller:
                        widget.controller.stockController,
                    onChanged: (value) {
                      setState(() {
                        widget.controller.setStock();
                      });
                    }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
