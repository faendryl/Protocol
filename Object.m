#import "Object.h"
#import <stdio.h>
#import <Foundation/NSEnumerator.h>

@implementation BioObject
-(BOOL) conforms:(Protocol*)proto
{
  NSEnumerator *enumerateProperties=[properties objectEnumerator];
  id property;
  while((property=[enumerateProperties nextObject])){
    if([[property class] conformsToProtocol:proto])
      return YES;
  }
  return NO;
}

-(BioProperty*) extractProperty:(Class)propertyClass
{
  NSEnumerator *enumerateProperties=[properties objectEnumerator];
  id property;
  while((property=[enumerateProperties nextObject])){
    if([property isKindOfClass:propertyClass])
      return property;
  }
  return nil;
}

-(void) addProp:(BioProperty*) property
{
  [properties addObject:property];
}

-(id) init
{
  if((self=[super init]))
    {
      properties=[[NSMutableArray alloc] init];
    }
  return self;
}

-(void) print
{
  NSEnumerator *enumerateProperties=[properties objectEnumerator];
  id property;
  while((property=[enumerateProperties nextObject])){
    [property print];
  }
}
@end

