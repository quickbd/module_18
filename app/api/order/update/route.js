import { PrismaClient } from "@prisma/client";
import { NextResponse } from "next/server";

export async function POST(req, res) {
  BigInt.prototype.toJSON = function () {
    return this.toString();
  };
  const { searchParams } = new URL(req.url);
  const id = searchParams.get("id");
  const reqData = await req.json();
  const prisma = new PrismaClient();
  console.log(id);
  try {
    let result = await prisma.order.update({
      where: { id: id },
      data: {
        title: reqData.title,
        subTotal: reqData.subTotal,
        itemDiscount: reqData.itemDiscount,
        tax: reqData.tax,
        total: reqData.total,
        discount: reqData.discount,
        grandTotal: reqData.grandTotal,
        firstName: reqData.firstName,
        middleName: reqData.middleName,
        lastName: reqData.lastName,
        mobile: reqData.mobile,
        email: reqData.email,
        city: reqData.city,
        country: reqData.country,
        userId: reqData.userId,
      },
    });

    return NextResponse.json({ status: "success", result });
  } catch (err) {
    return NextResponse.json({ status: "fail", data: err });
  }
}

//Data update:(POST) localhost:3000/api/order/update?id=2
//data:{object}
