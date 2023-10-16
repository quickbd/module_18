import { PrismaClient } from "@prisma/client";
import { NextResponse } from "next/server";

export async function DELETE(req, res) {
  BigInt.prototype.toJSON = function () {
    return this.toString();
  };
  const { searchParams } = new URL(req.url);
  const id = searchParams.get("id");
  // const reqData = await req.json();
  const prisma = new PrismaClient();

  try {
    let result = await prisma.product.delete({
      where: { id: id },
    });

    return NextResponse.json({ status: "success", result });
  } catch (err) {
    return NextResponse.json({ status: "fail", data: err });
  }
}

//Data delete:(POST) localhost:3000/api/product/delete?id=1
