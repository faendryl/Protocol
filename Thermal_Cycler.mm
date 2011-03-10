#include <iostream>
#import "Thermal_Cycler.h"
#import <DNA.h>
#import "Wrapper.h"
#import <Foundation/NSEnumerator.h>
#import <Sequence.h>

@implementation Thermal_Cycler
-(void) print {
}


-(void) amplifyTemplate:(BioObject*)templateStrand withPrimers:(NSMutableArray*)primers
{
        //  Sequence *templateSequence=[templateStrand extractProperty:[Sequence class]];
  NSEnumerator *enumeratePrimers=[primers objectEnumerator];
  id primer;
  printf("template %s\n",[[[templateStrand extractProperty:[Sequence class]] sequence] UTF8String]);
  while((primer=[enumeratePrimers nextObject])){
    printf("primer %s\n",[[[primer extractProperty:[Sequence class]] sequence] UTF8String]);
    testFunction([[[templateStrand extractProperty:[Sequence class]] sequence] UTF8String],[[[primer extractProperty:[Sequence class]] sequence] UTF8String]);
  }
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
  printf("Objects %d\n",[templateStrand count]);
  [self amplifyTemplate:[templateStrand objectAtIndex:0] withPrimers:oligos];
  // pseudocode:
  // find annealing locations and directions of the oligos on the template.
  // simple as searching sequence and reverse complement?
//  NSRange annealingRange;
        /*  annealingRange=[[templateStrand getString] rangeOfString:[oligos getString]];
  if(annealingRange.location != NSNotFound){
    // rejoice, we have binding!  do stuff

    }*/
  
  return nil;
}
@end

