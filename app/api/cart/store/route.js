import { PrismaClient } from "@prisma/client";
import { NextResponse } from "next/server";

export async function POST(req, res) {
  BigInt.prototype.toJSON = function () {
    return this.toString();
  };

  const reqData = await req.json();

  const prisma = new PrismaClient();
  try {
    let result = await prisma.cart.create({
      data: reqData,
    });

    return NextResponse.json({ status: "success", result });
  } catch (err) {
    return NextResponse.json({ status: "fail", data: err });
  }
}

// Data store/create:(POST) localhost:3000/api/cart/store
// sample data: object
