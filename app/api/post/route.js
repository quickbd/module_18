import { PrismaClient } from "@prisma/client";
import { NextResponse } from "next/server";

export async function GET(req, res) {
  BigInt.prototype.toJSON = function () {
    return this.toString();
  };

  // const reqData = await req.json();
  const prisma = new PrismaClient();
  try {
    let result = await prisma.brands.create({
      data: { brandName: "sss", brandImg: "image.jpg" },
    });

    return NextResponse.json({ status: "success", result });
  } catch (err) {
    return NextResponse.json({ status: "fail", data: err });
  }
}
