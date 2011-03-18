#import <Restriction_Enzyme.h>
#import <Container.h>

@implementation Restriction_Enzyme

-(void) process:(Container*)container
{
  // really also need some kind of "conditions" input so we know whether to apply the effect
  // go through container, look for dsDNA or ssDNA, cut as appropriate
  // need a better representation for dsDNA
}
-(void) printWithPrefix:(NSString*)prefix
{
  const char *cPrefix=[prefix UTF8String];
  printf("%sRestriction enzyme\n",cPrefix);
  [restriction_site printWithPrefix:[prefix stringByAppendingString:@"\t"]];
}

@end
