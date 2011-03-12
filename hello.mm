#include <iostream>
#import <stdio.h>
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

int main(int argc,const char *argv[])
{
  NSAutoreleasePool *pool=[NSAutoreleasePool new];
  Thermal_Cycler *cycler=[[Thermal_Cycler alloc] init];
  Qiagen_PCR_Cleanup *qiagen_pcr=[[Qiagen_PCR_Cleanup alloc] init];
  
  BioObject *forwardPrimer=[[BioObject alloc] init];
  Sequence *forwardPrimerSequence=[[Sequence alloc] initWithString:@"CATCA"];
  Single_Stranded_DNA *ssDNA=[[Single_Stranded_DNA alloc] init];
  [forwardPrimer addProp:ssDNA];
  [forwardPrimer addProp:forwardPrimerSequence];

  BioProtocol *protocol=[[BioProtocol alloc] init];
  [protocol Add_Step: @protocol(Amplify_DNA)];
  [protocol Add_Step: @protocol(PCR_Cleanup)];

  BioObject *reversePrimer=[[BioObject alloc] init];
  Sequence *reversePrimerSequence=[[Sequence alloc] initWithString:@"GAATTC"];
  [reversePrimer addProp:ssDNA];
  [reversePrimer addProp:reversePrimerSequence];

  BioObject *templateStrand=[[BioObject alloc] init];
  Double_Stranded_DNA *dsDNA=[[Double_Stranded_DNA alloc] init];
  Sequence *templateSequence=[[Sequence alloc] initWithString:@"AAGCTACGAATTCAGTCGTACGATCGATCGATCGATCGATTAGTGATCGTAGCTGATGC"];
  [templateStrand addProp:dsDNA];
  [templateStrand addProp:templateSequence];

  NSMutableArray *implementors=[[NSMutableArray alloc] init];
  [implementors addObject:cycler];
  [implementors addObject:qiagen_pcr];

  Container *pcr_tube=[[Container alloc] init];
  [pcr_tube addObject:forwardPrimer];
  [pcr_tube addObject:reversePrimer];
  [pcr_tube addObject:templateStrand];

  NSMutableArray *inputs=[[NSMutableArray alloc] init];
  [inputs addObject:pcr_tube];
  NSMutableArray *outputs=[protocol runOnInputs:inputs withImplementors:implementors];
std::cout<<"wo"<<std::endl;
  NSEnumerator *enumerateOutputs=[outputs objectEnumerator];
  id output;
  while((output=[enumerateOutputs nextObject])){
std::cout<<"Dear me"<<[[output description] UTF8String]<<std::endl;
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
  return 0;
}
