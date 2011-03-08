#import<Sequence.h>
#import<stdio.h>

@implementation Sequence
-(id) initWithString:(NSString*)seq
{
  if((self=[super init]))
    {
      //sequence=[[NSString alloc] init];
      [self setSequence:seq];
    }
  return self;
}

-(id) init
{
  return [self initWithString:@""];
}


-(void) setSequence:(NSString*) seq
{
  sequence=seq;
}

-(NSString*) sequence
{
  return sequence;
}

-(void) dealloc{
  [sequence release];
  [super dealloc];
}

-(void) print{
  printf("Sequence: %s\n",[sequence UTF8String]);
}
@end
