import chisel3._
import chisel3.util._

class acep8_4 extends Module{
  val io = IO(new Bundle{
    val a=Input(UInt(8.W))
    val b=Input(UInt(8.W))
    val sum=Output(UInt(9.W))
  })
  val b0=Module(new block4())
  val ap= Cat(io.a(3),io.a(2),io.a(1),io.a(0))
  b0.io.a:=ap.asUInt
  val bp=Cat(io.b(3),io.b(2),io.b(1),io.b(0))
  b0.io.b:=bp.asUInt
  b0.io.cin:=0.asUInt
  val sum1=Cat(b0.io.sum(3),b0.io.sum(2),b0.io.sum(1),b0.io.sum(0)).asUInt
  //val ac1=b0.io.cout

  val b1=Module(new block4())

  val aq=Cat(io.a(7),io.a(6),io.a(5),io.a(4))
  b1.io.a:=aq.asUInt
  val bq=Cat(io.b(7),io.b(6),io.b(5),io.b(4))
  b1.io.b:=bq.asUInt
  b1.io.cin:=b0.io.cout
  val sum2= Cat(b1.io.sum(3),b1.io.sum(2),b1.io.sum(1),b1.io.sum(0)).asUInt
  //b1.io.sum:=
  val suma=Cat(b1.io.cout,sum2,sum1).asUInt
  io.sum:=suma
  //b1.io.cout:=io.sum(8)






}



import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

object acep8_4Driver extends App {
  (new ChiselStage).execute(args, Seq(ChiselGeneratorAnnotation(() => new acep8_4)))
}
