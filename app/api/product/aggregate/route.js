import { PrismaClient } from "@prisma/client";
import { NextResponse } from "next/server";

export async function GET(req, res) {
  BigInt.prototype.toJSON = function () {
    return this.toString();
  };

  const prisma = new PrismaClient();
  try {
    let resultw = await prisma.product.groupBy({
      by: ["userId"],
      _avg: { price: true },
      _count: { id: true },
      _max: { price: true },
      _sum: { price: true },
    });
    return NextResponse.json({ status: "fail", resultw });

    // let result = await prisma.product.aggregate({
    //   _avg: { price: true },
    //   _count: { id: true },
    //   _max: { price: true },
    //   _sum: { price: true },
    // });
    // return NextResponse.json({
    //   status: "success",
    //   avg_price: result._avg.price ?? 0,
    //   total_product: result._count.id,
    //   hight_price: result._max.price,
    //   sum_price: result._sum.price,
    // });
  } catch (err) {
    return NextResponse.json({ status: "fail", data: err });
  }
}

//View list:(GET) localhost:3000/api/product/
