import { PrismaClient } from "@prisma/client";
import moment from "moment";
import { NextResponse } from "next/server";
export async function POST(req, res) {
  BigInt.prototype.toJSON = function () {
    return this.toString();
  };

  const reqData = await req.json();

  reqData.registeredAt = moment();
  console.log(reqData);
  const prisma = new PrismaClient();
  try {
    let createuser = prisma.user.create({
      data: reqData,
    });

    const result = await prisma.$transaction([createuser]);

    return NextResponse.json({ status: "success", result });
  } catch (err) {
    return NextResponse.json({ status: "fail", data: err });
  }
}

// Data store/create:(POST) localhost:3000/api/user/store
// sample data:  object
