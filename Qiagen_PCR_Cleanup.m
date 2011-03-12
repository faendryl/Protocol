#import "Qiagen_PCR_Cleanup.h"

@implementation Qiagen_PCR_Cleanup
-(void) print {
}

-(NSMutableArray*) run:(NSMutableArray*) inputs
{
  // take each container, filter out only the DNA of a certain size, and return it
  // 100bp to 10kbp apparently
  NSMutableArray *outputs=[NSMutableArray new];
  NSEnumerator *enumerateInputs=[inputs objectEnumerator];
  id container;
  while((container=[enumerateInputs nextObject])){
    
  }
  return inputs;
}
@end
