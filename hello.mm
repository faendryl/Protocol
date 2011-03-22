#include <iostream>
//#import <stdio.h>
#import <Thermal_Cycler.h>
#import <Protocol.h>
#import <Qiagen_PCR_Cleanup.h>
#import <Sequence.h>
#import <DNA.h>
#import <Amplify_DNA.h>
#import <Foundation/NSEnumerator.h>
#import <Object.h>
#import <Container.h>
#import <Foundation/NSAutoreleasePool.h>
#import <Perform_Restriction_Digest.h>
#import <Restriction_Enzyme.h>

#import <Wrapper.h>

int main(int argc,const char *argv[])
{
  NSAutoreleasePool *pool=[NSAutoreleasePool new];
  Thermal_Cycler *cycler=[[Thermal_Cycler alloc] init];
  Qiagen_PCR_Cleanup *qiagen_pcr=[[Qiagen_PCR_Cleanup alloc] init];
  Perform_Restriction_Digest *restriction_digest=[Perform_Restriction_Digest new];
  Restriction_Enzyme *AgeI=[Restriction_Enzyme new];
  [AgeI setRestrictionSite:[[Sequence alloc] initWithString:[NSString stringWithUTF8String:"ACCGGT"]]];
  [AgeI setCleavageSite:1];
  [restriction_digest setRestrictionEnzyme:AgeI];
  
  BioObject *forwardPrimer=[[BioObject alloc] init];
  Sequence *forwardPrimerSequence=[[Sequence alloc] initWithFasta:"reversePrimer.fasta"];
  Single_Stranded_DNA *ssDNA=[[Single_Stranded_DNA alloc] init];
  [forwardPrimer addProp:ssDNA];
  [forwardPrimer addProp:forwardPrimerSequence];

  BioProtocol *protocol=[[BioProtocol alloc] init];
  [protocol Add_Step: @protocol(Amplify_DNA)];
  [protocol Add_Step: @protocol(PCR_Cleanup)];
  [protocol Add_Step: @protocol(Restriction_Digest)];

  BioObject *reversePrimer=[[BioObject alloc] init];
  Sequence *reversePrimerSequence=[[Sequence alloc] initWithFasta:"forwardPrimer.fasta"];
  [reversePrimer addProp:ssDNA];
  [reversePrimer addProp:reversePrimerSequence];

  BioObject *templateStrand=[[BioObject alloc] init];
  Double_Stranded_DNA *dsDNA=[[Double_Stranded_DNA alloc] init];
  Sequence *templateSequence=[[Sequence alloc] initWithFasta:"templateSequence.fasta"];

  [templateStrand addProp:dsDNA];
  [templateStrand addProp:templateSequence];

  NSMutableArray *implementors=[[NSMutableArray alloc] init];
  [implementors addObject:cycler];
  [implementors addObject:qiagen_pcr];
  [implementors addObject:restriction_digest];

  Container *pcr_tube=[[Container alloc] init];
  [pcr_tube addObject:forwardPrimer];
  [pcr_tube addObject:reversePrimer];
  [pcr_tube addObject:templateStrand];

  NSMutableArray *inputs=[[NSMutableArray alloc] init];
  [inputs addObject:pcr_tube];
  NSMutableArray *outputs=[protocol runOnInputs:inputs withImplementors:implementors];
  NSEnumerator *enumerateOutputs=[outputs objectEnumerator];
  id output;
  while((output=[enumerateOutputs nextObject])){
    [output print];
  }

  [protocol release];
  [inputs release];
  [forwardPrimer release];
  [forwardPrimerSequence release];
  [reversePrimer release];
  [reversePrimerSequence release];
  [templateStrand release];
  [templateSequence release];
  [ssDNA release];
  [dsDNA release];
  [implementors release];
  [cycler release];
  [qiagen_pcr release];
  [restriction_digest release];
  return 0;
}
