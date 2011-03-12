#import<DNA.h>
#import<stdio.h>
#import<Foundation/NSString.h>

@implementation DNA
-(void) printWithPrefix:(NSString*)prefix
{
  char *cPrefix=[prefix UTF8String];
  printf("%sDNA\n",cPrefix);
}
@end

@implementation Single_Stranded_DNA
-(void) printWithPrefix:(NSString*)prefix
{
  char *cPrefix=[prefix UTF8String];
  printf("%sDNA: single-stranded\n",cPrefix);
}
@end

@implementation Double_Stranded_DNA
-(void) printWithPrefix:(NSString*)prefix
{
  char *cPrefix=[prefix UTF8String];
  printf("%sDNA: double-stranded\n",cPrefix);
}
@end
