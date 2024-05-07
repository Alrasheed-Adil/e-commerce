import '../views/Orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/cart_provider.dart';
import 'package:provider/provider.dart';
import '../models/order.dart';

class OrdersList extends StatefulWidget {
  @override
  _OrdersListState createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3D82AE),
        centerTitle: true,
        title: const Text(
          'Orders',
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
                // createId(provider),
                // createDate(provider),
                // createStatus(provider),
                // createSubTitle(provider),
                createCartList(provider),
                // footer(provider, context)
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Total" + ":  " + "\$" + provider.getCartTotal().toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  // style: CustomTextStyle.textFormFieldMedium
                  //     .copyWith(color: Colors.grey, fontSize: 12),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(right: 30),
              //   child: Text(
              //     "\$" + provider.getCartTotal().toString(),

              //     // style: CustomTextStyle.textFormFieldBlack.copyWith(
              //     //     color: Colors.greenAccent.shade700, fontSize: 14),
              //   ),
              // ),
            ],
          ),
          SizedBox(height: 8),
          // ElevatedButton(
          //   onPressed: () {
          //     // createOrder(provider.items);
          //   },
          //   style: ElevatedButton.styleFrom(
          //     padding:
          //         EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.all(Radius.circular(24))),
          //     backgroundColor: Color(0xFF3D82AE),
          //   ),
          //   child: const Text(
          //     "Confirm Order",
          //     style: TextStyle(fontSize: 20, color: Colors.white),
          //   ),
          // ),
          SizedBox(height: 8),
        ],
      ),
      margin: EdgeInsets.only(top: 16),
    );
  }

  createHeader() {
    return Container(
      alignment: Alignment.topCenter,
      child: Text(
        "ORDER DETAILS " + ORDERS.length.toString(),
        // style: CustomTextStyle.textFormFieldBold
        //     .copyWith(fontSize: 16, color: Colors.black),
        style: TextStyle(fontWeight: FontWeight.bold),
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
      margin: EdgeInsets.only(left: 12, top: 12),
    );
  }

  createId(provider) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Order ID : 0aXG0swrTZQZpdXIWxId",
        // style: CustomTextStyle.textFormFieldBold
        //     .copyWith(fontSize: 12, color: Colors.grey),
      ),
      margin: EdgeInsets.only(left: 12, top: 12),
    );
  }

  createDate(provider) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Time : 2024-04-22 11:43:38",
        // style: CustomTextStyle.textFormFieldBold
        //     .copyWith(fontSize: 12, color: Colors.grey),
      ),
      margin: EdgeInsets.only(left: 12, top: 10),
    );
  }

  createStatus(provider) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Status : Processing",
        // style: CustomTextStyle.textFormFieldBold
        //     .copyWith(fontSize: 12, color: Colors.grey),
      ),
      margin: EdgeInsets.only(left: 12, top: 10),
    );
  }

  createCartList(provider) {
    return Expanded(
        child: ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, position) {
        // Item product = provider.items[position];
        order ordr = ORDERS[position];
        return createCartListItem(ordr);
      },
      itemCount: ORDERS.length,
    ));
  }

  createCartListItem(ordr) {
    return Stack(
      children: <Widget>[
        InkWell(
          child: Container(
            margin: EdgeInsets.only(left: 12, right: 0, top: 12),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              children: <Widget>[
                // Container(
                //   margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                //   width: 80,
                //   height: 80,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.all(Radius.circular(14)),
                //       color: Colors.transparent,
                //       border: Border.all(color: Color(0xFF3D82AE), width: 2.0),
                //       image: DecorationImage(image: NetworkImage(product.image))),
                // ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // SizedBox(
                        //   height: 20,
                        // ),
                        Container(
                          padding: EdgeInsets.only(right: 8, top: 4),
                          child: Text(
                            ordr.date,
                            maxLines: 2,
                            softWrap: true,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            // style: CustomTextStyle.textFormFieldSemiBold
                            //     .copyWith(fontSize: 14),
                          ),
                        ),
                        // SizedBox(height: 3),
                        Text(
                          ordr.id,
                          style: TextStyle(color: Colors.grey),
                          // style: CustomTextStyle.textFormFieldRegular
                          //     .copyWith(color: Colors.grey, fontSize: 14),
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              ordr.status,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ordr.status == "Processing"
                                      ? Colors.orange
                                      : Colors.green),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // flex: 100,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "\$" + ordr.total.toString(),
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                      // style: CustomTextStyle.textFormFieldRegular
                      //     .copyWith(color: Colors.grey, fontSize: 14),
                    ),
                    Container(
                        // color: Colors.green,
                        padding: EdgeInsets.fromLTRB(0, 4, 15, 0),
                        child: Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        )),
                  ],
                ),
              ],
            ),
          ),

          // Align(
          //   alignment: Alignment.topRight,
          //   child: InkWell(
          //     child: Container(
          //       width: 24,
          //       height: 24,
          //       alignment: Alignment.center,
          //       margin: EdgeInsets.only(right: 10, top: 8),
          //       child: Icon(
          //         Icons.close,
          //         color: Colors.white,
          //         size: 20,
          //       ),
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.all(Radius.circular(4)),
          //           color: Color(0xFF3D82AE)),
          //     ),
          //     onTap: () {
          //       provider.remove(product);
          //     },
          //   ),
          // )
          // Divider(
          //   color: Color.fromARGB(255, 233, 233, 233),
          // )
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Orders(
                  details: ordr,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
