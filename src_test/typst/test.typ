


#[
  #set text(
  font:"Noto Sans")
  Noto Sans

  #h(2em)#lorem(10)
]

#[
  #set text(font:"Noto Serif")
  Noto Serif

  #h(2em)#lorem(10)
]

#[
  #set text(font:"Linux Libertine",)
  Linux Libertine


  #h(2em)#lorem(10)
]


#[
  #set text(font:"New Computer Modern Math",)
  New Computer Modern Math

  #h(2em)#lorem(10)
]

#let lorem(num) = {
  let ts_array = "测 试 所 用 的 文 本".split()
  let result = ""
  for i in array.range(0,num){
    let n = int(calc.round(calc.abs(calc.sin(i)*7))-1)
    result += ts_array.at(n)
    result
  }
}

#[
  #set text(font:"Source Han Sans",)
  Source Han Sans

  #h(2em)#h(2em)#lorem(5)
]

#[
  #set text(font:"Source Han Serif",)
  Source Han Serif

  #h(2em)#lorem(5)
]

#[
  #set text(font:"SimSun",)
  Sim Sun

  #h(2em)#lorem(5)
]

#[
  #set text(font:"FangSong",)
  FangSong

  #h(2em)#lorem(5)
]

#[
  #set text(font:"NSimSun",)
  NSimSun

  #h(2em)#lorem(5)
]

#[
  #set text(font:"KaiTi",)
  KaiTi

  #h(2em)#lorem(5)
]

#[
  #set text(font:"SimHei",)
  SimHei

  #h(2em)#lorem(5)
]