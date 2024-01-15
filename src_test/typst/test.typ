#import "@preview/cetz:0.1.2"

/*#cetz.canvas(background: luma(200),debug: false,
  {
    import cetz.draw : *
    //
    circle((0,0),name:"circle")
    fill(red)
    stroke(none)
    circle("circle.top-left",radius: 0.3)
    circle("circle.top-right",radius: 0.3)
    circle("circle.bottom-left",radius: 0.3,stroke: blue)
    circle("circle.bottom-right",radius: 0.3,fill: blue)
    line((0,0),(1,0),stroke: black)
    content((0,0),anchor:"bottom-left")[Hello world]
  }
)*/

#cetz.canvas(background:luma(200),length:1em,
{
  import cetz.draw:*
  let (a,b,n,theta) = (15,10,10,-calc.pi/4)
  set-style(stroke:black)
  let chpoint(p,theta) = {
    (
      p.at(0)-p.at(1)/calc.tan(theta),
      p.at(1)
    )
  }
  for i in array.range(0,n+1){
    line(chpoint((0,b/n*i),theta),chpoint((a,b/n*i),theta))
  }
  for j in array.range(0,n+1){
    line(chpoint((a/n*j,b),theta),chpoint((a/n*j,0),theta))
  }
  
})