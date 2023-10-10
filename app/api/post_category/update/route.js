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
    let result = await prisma.post_category.update({
      where: { id: id },
      data: {
        postId: reqData.postId,
        categoryId: reqData.categoryId,
      },
    });

    return NextResponse.json({ status: "success", result });
  } catch (err) {
    return NextResponse.json({ status: "fail", data: err });
  }
}

//Data update:(POST) localhost:3000/api/post_category/update?id=2
//data:{object}
