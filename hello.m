#import <stdio.h>
#import <Thermal_Cycler.h>
#import <Protocol.h>
#import <PCR_Cleanup.h>
#import <Sequence.h>
#import <DNA.h>

int main(int argc,const char *argv[])
{
  Thermal_Cycler *cycler=[[Thermal_Cycler alloc] init];
  Qiagen_PCR_Cleanup qiagen_pcr=[[Qiagen_PCR_Cleanup alloc] init];

  Protocol *protocol=[[Protocol alloc] init];
  [protocol Add_Step: Amplify_DNA];
  [protocol Add_Step: PCR_Cleanup];

  Object *forwardPrimer=[[Object alloc] init];
  [forwardPrimer addProperty:singleStranded];
  [forwardPrimer addProperty:DNA];
  [forwardPrimer addProperty:sequence];
  Object *reversePrimer=[[Object alloc] init];
  [forwardPrimer addProperty:singleStranded];
  [forwardPrimer addProperty:DNA];
  [forwardPrimer addProperty:sequence];

  Object *template=[[Object alloc] init];
  [forwardPrimer addProperty:doubleStranded];
  [forwardPrimer addProperty:DNA];
  [forwardPrimer addProperty:sequence];

  NSMutableArray *implementors=[[NSMutableArray alloc] init];
  [implementors addObject:cycler];
  [implementors addObject:qiagen_pcr];

  NSMutableArray *inputs=[[NSMutableArray alloc] init];
  [inputs addObject:forwardPrimer];
  [inputs addObject:reversePrimer];
  [inputs addObject:template];
  NSMutableArray *outputs=[protocol runOnInputs:inputs withImplementors:implementors];

  return 0;
}
