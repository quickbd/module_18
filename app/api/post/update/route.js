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
    let result = await prisma.post.update({
      where: { id: id },
      data: {
        firstName: reqData.firstName,
        lastName: reqData.lastName,
        mobile: reqData.mobile,
        email: reqData.mobile,
        passwordHash: reqData.passwordHash,
        profile: reqData.profile,
      },
    });

    return NextResponse.json({ status: "success", result });
  } catch (err) {
    return NextResponse.json({ status: "fail", data: err });
  }
}

//Data update:(POST) localhost:3000/api/post/update?id=2
// sample data: {
//     "authorId": "1",
//     "parentId":"0",
//     "title":"test",
//     "metaTitle":"metaTitle",
//     "slug":"slug-slug",
//     "summary":"my summary",
//     "published":"1",
//     "content":"my content",
// }
