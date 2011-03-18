#import <Perform_Restriction_Digest.h>
#import <Foundation/NSEnumerator.h>
#import <Container.h>
#import <DNA.h>

@implementation Perform_Restriction_Digest

-(BioObject*) restrict:(BioObject*)dnaObject enzyme:(BioObject*)enzyme
{
  // little tricky
  BioObject *digestedDNA=nil;
  // do smart things with Wrapper here
  return digestedDNA;
}

// need a more complex input structure, perhaps
-(NSMutableArray*) run:(NSMutableArray*) inputs
{
  // 
  //NSMutableArray *outputs=[NSMutableArray new];
  NSEnumerator *enumerateInputs=[inputs objectEnumerator];
  id container;
  while((container=[enumerateInputs nextObject])){
    NSEnumerator *enumerateContainer=[[container matchingObjects:[DNA class]] objectEnumerator];
    id dnaObject;
    while((dnaObject=[enumerateContainer nextObject])){
      [container addObject:[self restrict:dnaObject enzyme:restrictionEnzyme]]; // not guaranteeing complete digestion
    }
  }
  return inputs;
}

@end
