#import <Container.h>
#import <Foundation/NSEnumerator.h>
#import <Foundation/NSString.h>


@implementation Container

-(id)init
{
  if((self=[super init])){
    objects=[[NSMutableArray alloc] init];
  }
  return self;
}

-(void) addObject:(BioObject*)object{
  [objects addObject:object];
}

-(NSMutableArray*) matchingObjects:(Class)objectClass
{
  NSMutableArray *matchedObjects=[[NSMutableArray alloc] init];
  NSEnumerator *enumerateObjects=[objects objectEnumerator];
  id object;
  printf("In match\n");
  while((object=[enumerateObjects nextObject])){
    printf("Match %s\n",[[object description] UTF8String]);
    if([object hasProperty:objectClass])
      [matchedObjects addObject:object];
  }
  return matchedObjects;
}
@end
