#import "Thermal_Cycler.h"
#import <seqan/basic.h>
#import <DNA.h>

@implementation Thermal_Cycler
-(void) print {
}

-(void) amplifyTemplate:(BioObject*)templateStrand withPrimers:(NSMutableArray*)primers
{
        //  Sequence *templateSequence=[templateStrand extractProperty:[Sequence class]];
  
}

-(NSMutableArray*) run:(Container*) inputs
{
  // pull all the DNA out of the inputs
  Container *templateStrand=[inputs matchingObjects:[Double_Stranded_DNA class]];
  Container *oligos=[inputs matchingObjects:[Single_Stranded_DNA class]];
  // pseudocode:
  // find annealing locations and directions of the oligos on the template.
  // simple as searching sequence and reverse complement?
  NSRange annealingRange;
        /*  annealingRange=[[templateStrand getString] rangeOfString:[oligos getString]];
  if(annealingRange.location != NSNotFound){
    // rejoice, we have binding!  do stuff

    }*/
  
  return nil;
}
@end

