import chisel3._
import chisel3.util._

class acep16_4 extends Module{
  val io=IO(new Bundle{

    val a=Input(UInt(16.W))
    val b=Input(UInt(16.W))
    val sum=Output(UInt(17.W))
  })

  val b0=Module(new block4())
  val ap= Cat(io.a(3),io.a(2),io.a(1),io.a(0))
  b0.io.a:=ap.asUInt
  val bp=Cat(io.b(3),io.b(2),io.b(1),io.b(0))
  b0.io.b:=bp.asUInt
  b0.io.cin:=0.asUInt
  val sum1=Cat(b0.io.sum(3),b0.io.sum(2),b0.io.sum(1),b0.io.sum(0)).asUInt

  val b1=Module(new block4())


  val aq=Cat(io.a(7),io.a(6),io.a(5),io.a(4))
  b1.io.a:=aq.asUInt
  val bq=Cat(io.b(7),io.b(6),io.b(5),io.b(4))
  b1.io.b:=bq.asUInt
  b1.io.cin:=b0.io.cout.asUInt
  val sum2= Cat(b1.io.sum(3),b1.io.sum(2),b1.io.sum(1),b1.io.sum(0)).asUInt

  val b2=Module(new block4())


  val at=Cat(io.a(11),io.a(10),io.a(9),io.a(8))
  b2.io.a:=at.asUInt
  val bt=Cat(io.b(11),io.b(10),io.b(9),io.b(8))
  b2.io.b:=bt.asUInt
  b2.io.cin:=b1.io.cout.asUInt
  val sum3= Cat(b2.io.sum(3),b2.io.sum(2),b2.io.sum(1),b2.io.sum(0)).asUInt

  val b3=Module(new block4())


  val ar=Cat(io.a(15),io.a(14),io.a(13),io.a(12))
  b3.io.a:=ar.asUInt
  val br=Cat(io.b(15),io.b(14),io.b(13),io.b(12))
  b3.io.b:=br.asUInt
  b3.io.cin:=b2.io.cout.asUInt
  val sum4= Cat(b3.io.sum(3),b3.io.sum(2),b3.io.sum(1),b3.io.sum(0)).asUInt

  io.sum:=Cat(b3.io.cout,sum4,sum3,sum2,sum1).asUInt

  //io.sum:=suma
}


import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

object acep16_4Driver extends App {
  (new ChiselStage).execute(args, Seq(ChiselGeneratorAnnotation(() => new acep16_4)))
}
