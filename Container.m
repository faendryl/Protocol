#import <Container.h>
#import <Foundation/NSEnumerator.h>


@implementation Container
-(void) addObject:(BioObject*)object{
  [objects addObject:object];
}

-(Container*) matchingObjects:(Class)objectClass
{
  Container *matchedContainer=[[Container alloc] init];
  NSEnumerator *enumerateObjects=[objects objectEnumerator];
  id object;
  while((object=[enumerateObjects nextObject])){
    if([object isKindOfClass:objectClass])
      [matchedContainer addObject:object];
  }
  return matchedContainer;
}
@end
