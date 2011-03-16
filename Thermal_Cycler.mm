#include <iostream>
#import "Thermal_Cycler.h"
#import <DNA.h>
#import "Wrapper.h"
#import <Foundation/NSEnumerator.h>
#import <Sequence.h>

@implementation Thermal_Cycler
-(void) print {
}


-(BioObject*) amplifyTemplate:(BioObject*)templateStrand withPrimers:(NSMutableArray*)primers
{
        //  Sequence *templateSequence=[templateStrand extractProperty:[Sequence class]];
  //printf("template %s\n",[[[templateStrand extractProperty:[Sequence class]] sequence] UTF8String]);
  char ampliconBuffer[100000]; // danger Will Robinson!
  amplify([[[templateStrand extractProperty:[Sequence class]] sequence] UTF8String],[[[[primers objectAtIndex:0] extractProperty:[Sequence class]] sequence] UTF8String],[[[[primers
  objectAtIndex:1] extractProperty:[Sequence class]] sequence] UTF8String],ampliconBuffer);
  BioObject *amplicon=[BioObject new];
  Sequence *ampliconSequence=[[Sequence alloc] initWithString:[NSString stringWithUTF8String:ampliconBuffer]];
  Double_Stranded_DNA *dsDNA=[Double_Stranded_DNA new];
  [amplicon addProp:ampliconSequence];
  [amplicon addProp:dsDNA];
  return amplicon;
}

-(NSMutableArray*) run:(NSMutableArray*) inputs
{
  // pull all the DNA out of the inputs
  NSMutableArray *templateStrand=nil;
  NSMutableArray *oligos=nil;
  NSEnumerator *enumerateContainers=[inputs objectEnumerator];
  id container;
  container=[enumerateContainers nextObject];
  if(templateStrand==nil)
    templateStrand=[container matchingObjects:[Double_Stranded_DNA class]];
  if(oligos==nil)
    oligos=[container matchingObjects:[Single_Stranded_DNA class]];
  //NSMutableArray *outputs=[NSMutableArray new];
  [container addObject:[self amplifyTemplate:[templateStrand objectAtIndex:0] withPrimers:oligos]];
  return inputs;
}

// should go through container, 
// "Restriction" protocol consists of taking a container with DNA in it, mixing in an enzyme, then calling thermal cycle
// the enzyme object knows what it does at a given temperature
// this will mean that objects are not entirely passive (in the simulated setting); is that okay?
// IMPORTANT: a division in what this describes into "IMPERATIVE" and "DESCRIPTIVE"
// IMPERATIVE: what you need to do
// DESCRIPTIVE: what the results are
// in that case, let's make "restriction enzyme" a property, not an object type

@end

