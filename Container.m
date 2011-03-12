#import <Container.h>
#import <Foundation/NSEnumerator.h>
#import <Foundation/NSString.h>


@implementation Container

-(void) printWithPrefix:(NSString*)prefix
{
  NSEnumerator *enumerateObjects=[objects objectEnumerator];
  char *cPrefix=[prefix UTF8String];
  printf("%sContainer\n",cPrefix);
  id object;
  while((object=[enumerateObjects nextObject])){
    [object printWithPrefix:[prefix stringByAppendingString:@"\t"]];
  }
}

-(void) print
{
  [self printWithPrefix:@""];
}

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
  while((object=[enumerateObjects nextObject])){
    if([object hasProperty:objectClass]){
      [matchedObjects addObject:object];
    }
  }
  return matchedObjects;
}
@end
