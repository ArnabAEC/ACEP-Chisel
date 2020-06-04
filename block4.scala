import chisel3._
import chisel3.util._

class block4 extends Module{
  val io=IO(new Bundle{
    val a=Input(UInt(4.W))
    val b=Input(UInt(4.W))
    val cin=Input(UInt(1.W))
    val sum=Output(UInt(4.W))
    val cout=Output(UInt(1.W))
  })

  val x = io.a(3)
  val y= io.b(3)
  val z= io.a(2)
  val w= io.b(2)

  io.cout:=x&y | y&z&w | x&z&w//major logic
  //full adder 0 with sum(0) and carry(0)
  val f0=Module(new fa())
  f0.io.a:=io.a(0)
  f0.io.b:=io.b(0)
  f0.io.cin:=io.cin
  val s0=f0.io.sum
  val c1= f0.io.cout
  //full adder 1 with sum(1) and cin as cout of f0
  val f1=Module(new fa())
  f1.io.a:=io.a(1)
  f1.io.b:=io.b(1)
  val s1=Cat(f1.io.sum,s0)
  f1.io.cin:=f0.io.cout
  val c2=f1.io.cout
  //full adder 0 with sum(2) and cin as cout of f1
  val f2=Module(new fa())
  f2.io.a:=io.a(2)
  f2.io.b:=io.b(2)
  f2.io.cin:=f1.io.cout
  val s2=Cat(f2.io.sum,s1)
  val c3= f2.io.cout    
  //full adder 1 with sum(3) and cin as cout of f2
  val f3=Module(new fa())
  f3.io.a:=io.a(3)
  f3.io.b:=io.b(3)
  f3.io.cin:=f2.io.cout

  val s3=Cat(f3.io.sum,s2)

  //
  io.sum:=s3.asUInt

}



/*import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

object block4Driver extends App {
  (new ChiselStage).execute(args, Seq(ChiselGeneratorAnnotation(() => new block4)))
}
  */      


