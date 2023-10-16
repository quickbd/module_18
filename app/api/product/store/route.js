import { PrismaClient } from "@prisma/client";
import { NextResponse } from "next/server";

export async function POST(req, res) {
  BigInt.prototype.toJSON = function () {
    return this.toString();
  };

  const reqData = await req.json();
  const prisma = new PrismaClient();

  console.log(reqData);
  try {
    let insertProduct = prisma.product.create({
      data: reqData,
    });

    let insertProductMeta = prisma.product_meta.create({
      data: {
        productId: insertProduct.id,
        content: insertProduct.metaTitle,
        key: insertProduct.slug,
      },
    });
    const result = await prisma.$transaction([
      insertProduct,
      insertProductMeta,
    ]);

    return NextResponse.json({ status: "success", result });
  } catch (err) {
    return NextResponse.json({ status: "fail", data: err });
  }
}

//Data store/create:(POST) localhost:3000/api/product/store
//Data data:{parameters}
