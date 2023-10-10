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
    let result = await prisma.post_comment.update({
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
