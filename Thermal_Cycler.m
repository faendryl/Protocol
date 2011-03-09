#import "Thermal_Cycler.h"

@implementation Thermal_Cycler
-(void) print {
}

-(void) amplifyTemplate:(BioObject*)template withPrimers:(NSMutableArray*)primers
{
  Sequence *templateSequence=[template extractProperty:[Sequence class]];
}

-(NSMutableArray*) run:(Container*) inputs
{
  // pull all the DNA out of the inputs
  Container *template=[inputs matchingObjects:@protocol(Double_Stranded_DNA)];
  Container *oligos=[inputs matchingObjects:@protocol(Single_Stranded_DNA)];
  // pseudocode:
  // find annealing locations and directions of the oligos on the template.
  // simple as searching sequence and reverse complement?
  NSRange annealingRange;
  annealingRange=[[template getString] rangeOfString:[oligos getString]];
  if(annealingRange.location != NSNotFound){
    // rejoice, we have binding!  do stuff

    }
  
  return nil;
}
@end

