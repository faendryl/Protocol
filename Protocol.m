#import "Protocol.h"
#import <stdio.h>
#import <Foundation/NSEnumerator.h>
#include <iostream>

@implementation BioProtocol
-(id) init
{
  if((self=[super init]))
    {
      nodes=[[NSMutableArray alloc] init];
      edges=[[NSMutableArray alloc] init];
    }
  return self;
  
}

-(void) print {
}

-(void) Add_Step: (Protocol*) step {
  [nodes addObject: step];
}

-(NSMutableArray*) runOnInputs:(NSMutableArray*)inputs withImplementors:(NSMutableArray*)implementors
{
  // start by checking that we have implementors for all of our steps
  NSEnumerator *enumerateSteps=[nodes objectEnumerator];
  id step;
  NSMutableArray *orderedImplementors=[[NSMutableArray alloc] init];
  while((step=[enumerateSteps nextObject])){
    NSEnumerator *enumerateImplementors=[implementors objectEnumerator];
    id implementor;
    //printf("Protocol %s\n",[[step description] UTF8String]);
    while((implementor=[enumerateImplementors nextObject])){
      //printf("Implementor %s\n",[[implementor description] UTF8String]);
      if([implementor conformsToProtocol:step]){
        [orderedImplementors addObject:implementor];
      }
    }
  }
  NSEnumerator *enumerateOrderedImplementors=[orderedImplementors objectEnumerator];
  id orderedImplementor;
  NSMutableArray *outputs=inputs;
  while((orderedImplementor=[enumerateOrderedImplementors nextObject])){
    outputs=[orderedImplementor run:outputs];
    printf("Step\n");
  }
  return outputs;
}

-(NSMutableArray*) nodes{
  return nodes;
}

-(NSMutableArray*) edges{
  return edges;
}

@end

