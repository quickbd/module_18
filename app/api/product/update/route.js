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
    let result = await prisma.product.update({
      where: { id: id },
      data: {
        firstName: reqData.firstName,
        metaTitle: reqData.metaTitle,
        slug: reqData.slug,
        summary: reqData.summary,
        price: reqData.price,
        discount: reqData.discount,
        userId: reqData.userId,
        publishedAt: reqData.publishedAt,
        startsAt: reqData.startsAt,
        endsAt: reqData.startsAt,
      },
    });

    return NextResponse.json({ status: "success", result });
  } catch (err) {
    return NextResponse.json({ status: "fail", data: err });
  }
}

//Data update:(POST) localhost:3000/api/post_comment/update?id=2
//Data data:{parameters}
