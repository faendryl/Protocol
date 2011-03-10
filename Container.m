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
    if([object hasProperty:objectClass]){
      printf("Matched\n");
      [matchedObjects addObject:object];
    }
  }
  return matchedObjects;
}
@end
