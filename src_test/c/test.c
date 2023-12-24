#include <stdio.h>
#include <limits.h>
#include <stdlib.h>




/*
* 数据类型测试
*/
void data_type(){
    //基本数据类型的使用 
    //  char
    printf("size of char : %lu \n",sizeof(char));
    printf("(min , max ) of char : (%d , %d)\n",CHAR_MIN,CHAR_MAX);
    //  unsigned char
    //printf("size of uchar : %lu \n",sizeof(unsigned char));
    //printf("(min , max ) of char : (%d , %d)\n",0,UCHAR_MAX);
    //  int
    //printf("size of int : %lu \n",sizeof(int));
    //printf("(min , max ) of int : (%d , %d)\n",INT_MIN,INT_MAX);
    //  unsigned int
    //printf("size of uint : %lu \n",sizeof(unsigned int));
    //printf("(min , max ) of uint : (%u , %u)\n",0,UINT_MAX);
    //  float
    //printf("size of float : %lu\n",sizeof(float));
    //  double
    //printf("size of double : %lu\n",sizeof(double));
    //printf("size of void : %lu",sizeof(void)); // 1 byte
}
/*内存管理测试*/
void manage_loc()
{
    //分配 8 个 顺序int类型的内存，并赋值0-7，读出；free内存，再尝试读出
    //  1.分配
    printf("1.分配\n");
    int* p_a = (int*) malloc(8 * sizeof(int));
    //  2.赋值
    printf("2.赋值\n");
    int* p = p_a;
    for (int i = 0; i < 8; i++,p++)
    {
        (*p) = i;
    }
    //  3.取值
    printf("3.取值\n");
    for (int i = 0; i < 8; i++)
    {
        printf("(*p_a + %d) = %d\n",i,p_a[i]);
    }
    //  4.free
    printf("4.free\n");
    free(p_a);
    //  5.再次读出
    printf("5.再次读出\n");
    for (int i = 0; i < 8; i++)
    {
        printf("(*(p_a + %d)) = %d\n",i,(*(p_a + i)));
    }
}


int main(void)
{
    manage_loc();
    return 0;
}