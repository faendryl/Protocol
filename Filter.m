#import <Filter.h>
#import <Foundation/NSEnumerator.h>

@implementation Filter

-(id) init
{
  if((self=[super init])){
    conditions=[NSMutableArray new];
  }
  return self;
}

-(BOOL) passes:(BioObject*)object
{
  NSEnumerator *enumerateConditions=[conditions objectEnumerator];
  id condition;
  while((condition=[enumerateConditions nextObject])){
    if(![condition passes:object])
      return NO;
  }
  return YES;
}
@end
