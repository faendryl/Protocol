#import "Protocol.h"
#import <stdio.h>
#import <Foundation/NSEnumerator.h>

@implementation BioProtocol
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
    while((implementor=[enumerateImplementors nextObject])){
      if([implementor conforms:step]){
        [orderedImplementors addObject:implementor];
      }
    }
  }
  
  NSEnumerator *enumerateOrderedImplementors=[orderedImplementors objectEnumerator];
  id orderedImplementor;
  NSMutableArray *outputs=inputs;
  while((orderedImplementor=[enumerateOrderedImplementors nextObject])){
    outputs=[orderedImplementor run:outputs];
    
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

