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
  while((container=[enumerateContainers nextObject])){
    if(templateStrand==nil)
      templateStrand=[container matchingObjects:[Double_Stranded_DNA class]];
    if(oligos==nil)
      oligos=[container matchingObjects:[Single_Stranded_DNA class]];
  }
  //NSMutableArray *outputs=[NSMutableArray new];
  [inputs addObject:[self amplifyTemplate:[templateStrand objectAtIndex:0] withPrimers:oligos]];
  return inputs;
}
@end

