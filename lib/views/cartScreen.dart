import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/cart_provider.dart';
import 'package:provider/provider.dart';
import '../models/item.dart';
import '../controlers/createOrder.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:shopping_cart/utils/CustomTextStyle.dart';
// import 'package:shopping_cart/utils/CustomUtils.dart';

// import 'CheckOutPage.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3D82AE),
        centerTitle: true,
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: SvgPicture.network(
            'https://firebasestorage.googleapis.com/v0/b/e-cart-d8427.appspot.com/o/back.svg?alt=media&token=829f4460-9bfd-4c5b-b829-54ce991d68c2',
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: Builder(
        builder: (context) {
          return Consumer<CartProvider>(builder: (context, provider, _) {
            return Column(
              children: <Widget>[
                createHeader(),
                createSubTitle(provider),
                createCartList(provider),
                footer(provider, context)
              ],
            );
          });
        },
      ),
    );
  }

  footer(provider, BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Total",
                  // style: CustomTextStyle.textFormFieldMedium
                  //     .copyWith(color: Colors.grey, fontSize: 12),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "\$" + provider.getCartTotal().toString(),
                  // style: CustomTextStyle.textFormFieldBlack.copyWith(
                  //     color: Colors.greenAccent.shade700, fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              createOrder(context, provider.items);
              AwesomeDialog(
                context: context,
                animType: AnimType.scale,
                dialogType: DialogType.success,
                title: 'Order Created Successfully',
                desc: 'Go To The Order Page To Track your Order',
                btnOkOnPress: () {},
              )..show();
            },
            style: ElevatedButton.styleFrom(
              padding:
                  EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              backgroundColor: Color(0xFF3D82AE),
            ),
            child: const Text(
              "Checkout",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
      margin: EdgeInsets.only(top: 16),
    );
  }

  createHeader() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "SHOPPING CART",
        // style: CustomTextStyle.textFormFieldBold
        //     .copyWith(fontSize: 16, color: Colors.black),
      ),
      margin: EdgeInsets.only(left: 12, top: 12),
    );
  }

  createSubTitle(provider) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Total(" + provider.items.length.toString() + ") Items",
        // style: CustomTextStyle.textFormFieldBold
        //     .copyWith(fontSize: 12, color: Colors.grey),
      ),
      margin: EdgeInsets.only(left: 12, top: 4),
    );
  }

  createCartList(provider) {
    return Expanded(
        child: ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, position) {
        Item product = provider.items[position];
        return createCartListItem(provider, product);
      },
      itemCount: provider.items.length,
    ));
  }

  createCartListItem(provider, product) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    color: Colors.transparent,
                    border: Border.all(color: Color(0xFF3D82AE), width: 2.0),
                    image: DecorationImage(image: NetworkImage(product.image))),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          product.name,
                          maxLines: 2,
                          softWrap: true,
                          // style: CustomTextStyle.textFormFieldSemiBold
                          //     .copyWith(fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        product.unit.length > 85
                            ? product.unit.substring(0, 85) + '...'
                            : product.unit,
                        // style: CustomTextStyle.textFormFieldRegular
                        //     .copyWith(color: Colors.grey, fontSize: 14),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "\$" +
                                    (product.price * product.count).toString(),
                                // style: CustomTextStyle.textFormFieldBlack
                                //     .copyWith(color: Colors.green),
                              ),
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                    ),
                                    onPressed: () {
                                      provider.decreaseCount(product);
                                    },
                                    child: Icon(Icons.remove),
                                  ),
                                  Container(
                                    // color: Colors.green,
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 10),
                                    child: Text(
                                      product.count.toString(),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                      // style:,
                                      // CustomTextStyle.textFormFieldSemiBold,
                                    ),
                                  ),
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                    ),
                                    onPressed: () {
                                      provider.increaseCount(product);
                                    },
                                    child: Icon(Icons.add),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            child: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 10, top: 8),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Color(0xFF3D82AE)),
            ),
            onTap: () {
              provider.remove(product);
            },
          ),
        )
      ],
    );
  }
}
