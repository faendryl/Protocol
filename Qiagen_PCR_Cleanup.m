#import "Qiagen_PCR_Cleanup.h"
#import <Filter.h>
#import <Foundation/NSEnumerator.h>
#import <Foundation/NSArray.h>
#import <Foundation/NSObjCRuntime.h>
#import <Condition.h>
#import <Container.h>

int compare(id self,SEL _cmd)
{
  return 0;// NSComparisonResult::NSOrderedSame;
}

@implementation Qiagen_PCR_Cleanup
-(void) print {
}

-(NSMutableArray*) run:(NSMutableArray*) inputs
{
  // take each container, filter out only the DNA of a certain size, and return it
  // 100bp to 10kbp apparently
  NSMutableArray *outputs=[NSMutableArray new];
  NSEnumerator *enumerateInputs=[inputs objectEnumerator];
  Filter *dnaSizeFilter=[Filter new];
  [dnaSizeFilter addCondition:[[dnaSizeCondition alloc] initWithSize:[NSNumber numberWithInt:100] andComparison:NSOrderedAscending]];
  [dnaSizeFilter addCondition:[[dnaSizeCondition alloc] initWithSize:[NSNumber numberWithInt:10000] andComparison:NSOrderedDescending]];

  id container;
  while((container=[enumerateInputs nextObject])){
    Container *filteredContainer=[container filtered:dnaSizeFilter];
    [outputs addObject:[container filtered:dnaSizeFilter]];
  }
  return outputs;
}
@end
