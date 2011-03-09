#import <stdio.h>
#import <Thermal_Cycler.h>
#import <Protocol.h>
#import <Qiagen_PCR_Cleanup.h>
#import <Sequence.h>
#import <DNA.h>
#import <Amplify_DNA.h>
#import <Foundation/NSEnumerator.h>
#import <Object.h>

class TestClass{
 public:

};

int main(int argc,const char *argv[])
{
  TestClass test;
  Thermal_Cycler *cycler=[[Thermal_Cycler alloc] init];
  Qiagen_PCR_Cleanup *qiagen_pcr=[[Qiagen_PCR_Cleanup alloc] init];
  
  printf("Whut whut!\n");
  BioObject *forwardPrimer=[[BioObject alloc] init];
  Sequence *forwardPrimerSequence=[[Sequence alloc] initWithString:@"AAGCTAC"];
  Single_Stranded_DNA *ssDNA=[[Single_Stranded_DNA alloc] init];
  //printf("%d",ssDNA);
  [forwardPrimer addProp:ssDNA];
  printf("Whut whut!\n");
  [forwardPrimer addProp:forwardPrimerSequence];

  printf("Whut whut!\n");
  BioProtocol *protocol=[[BioProtocol alloc] init];
  [protocol Add_Step: @protocol(Amplify_DNA)];
  //[protocol Add_Step: [[Amplify_DNA_Protocol alloc] init]];
  [protocol Add_Step: @protocol(PCR_Cleanup)];


  printf("Whut whut!\n");
  BioObject *reversePrimer=[[BioObject alloc] init];
  Sequence *reversePrimerSequence=[[Sequence alloc] initWithString:@"AAGCTAC"];
  [forwardPrimer addProp:ssDNA];
  [forwardPrimer addProp:reversePrimerSequence];

  printf("Whut whut!\n");
  BioObject *templateStrand=[[BioObject alloc] init];
  Double_Stranded_DNA *dsDNA=[[Double_Stranded_DNA alloc] init];
  Sequence *templateSequence=[[Sequence alloc] initWithString:@"AAGCTAC"];
  [forwardPrimer addProp:dsDNA];
  [forwardPrimer addProp:templateSequence];

  printf("Whut whut!\n");
  NSMutableArray *implementors=[[NSMutableArray alloc] init];
  [implementors addObject:cycler];
  [implementors addObject:qiagen_pcr];

  printf("Whut whut!\n");
  NSMutableArray *inputs=[[NSMutableArray alloc] init];
  [inputs addObject:forwardPrimer];
  [inputs addObject:reversePrimer];
  [inputs addObject:templateStrand];
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
  return 0;
}
