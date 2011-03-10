#include <iostream>
#import "Thermal_Cycler.h"
#import <DNA.h>
#import "Wrapper.h"
#import <Foundation/NSEnumerator.h>

@implementation Thermal_Cycler
-(void) print {
}

/*
-(void) amplifyTemplate:(BioObject*)templateStrand withPrimers:(NSMutableArray*)primers
{
        //  Sequence *templateSequence=[templateStrand extractProperty:[Sequence class]];
  
}*/

-(NSMutableArray*) run:(NSMutableArray*) inputs
{
  // pull all the DNA out of the inputs
         std::cout<<"Whoa dude"<<std::endl;
  Container *templateStrand=nil;
  Container *oligos=nil;
  NSEnumerator *enumerateContainers=[inputs objectEnumerator];
  id container;
  while((container=[enumerateContainers nextObject])){
        std::cout<<"Loop"<<std::endl;
    if(templateStrand==nil)
      templateStrand=[container matchingObjects:[Double_Stranded_DNA class]];
    if(oligos==nil)
      oligos=[container matchingObjects:[Single_Stranded_DNA class]];
  }
        std::cout<<"Hey hey hey"<<std::endl;
  // pseudocode:
  // find annealing locations and directions of the oligos on the template.
  // simple as searching sequence and reverse complement?
  testFunction();
  NSRange annealingRange;
        /*  annealingRange=[[templateStrand getString] rangeOfString:[oligos getString]];
  if(annealingRange.location != NSNotFound){
    // rejoice, we have binding!  do stuff

    }*/
  
  return nil;
}
@end

