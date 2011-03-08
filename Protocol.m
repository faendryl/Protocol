#import "Protocol.h"
#import <stdio.h>

@implementation Protocol
-(void) print {
}

-(void) Add_Step: (id<Interface>) step {
  [nodes addObject: step];
}

-(NSMutableArray*) runOnInputs:(NSMutableArray*)inputs withImplementors:(NSMutableArray*)implementors
{
  // start by checking that we have implementors for all of our steps
  NSEnumerator *enumerateSteps=[steps objectEnumerator];
  id step;
  NSMutableArray *orderedImplementors=[[NSMutableArray alloc] init];
  while(step=[enumerateSteps nextObject]){
    NSEnumerator *enumerateImplementors=[implementors objectEnumerator];
    while(implementor=[enumerateImplementors nextObject]){
      if([implementor conforms:[step protocol]]){
        [orderedImplementors addObject:implementor];
      }
    }
  }
  
  NSEnumerator *enumerateOrderedImplementors=[orderedImplementors objectEnumerator];
  id orderedImplementor;
  NSMutableArray *outputs=inputs;
  while(orderedImplementor=[enumerateOrderedImplementors nextObject]){
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

