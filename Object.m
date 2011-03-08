#import "Object.h"

@implementation Object
-(BOOL) conforms:(Protocol*)proto
{
  return [[self class] conformsToProtocol:proto];
}

-(void) addProp:(Property*) property
{
  
  //[properties addObject:property];
}

-(id) init
{
  if((self=[super init]))
    {
      properties=[[NSMutableArray alloc] init];
    }
  return self;
}
@end

