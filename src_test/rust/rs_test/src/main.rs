

fn main() {
    println!("Hello, world!");
    println!("=======函数引用======");
    let s = String::from("hello");
    println!("引用前{s}");
    //pushworld(&s);
    //println!("引用后{s}");

}
fn pushworld(s:& mut String){
    s.push_str(", world");
}