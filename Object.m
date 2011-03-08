#import "Object.h"

@implementation Object
-(BOOL) conforms:(id)proto
{
  return [[self class] conformsToProtocol:@protocol(proto)];
}

-(void) addProperty:(Property*) property{
  [properties addObject:property];
}
@end

