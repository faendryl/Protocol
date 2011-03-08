#import<DNA.h>
#import<stdio.h>

@implementation DNA
-(void) print
{
  printf("DNA\n");
}
@end

@implementation Single_Stranded_DNA
-(void) print
{
  printf("DNA: single-stranded\n");
}
@end

@implementation Double_Stranded_DNA
-(void) print
{
  printf("DNA: double-stranded\n");
}
@end
