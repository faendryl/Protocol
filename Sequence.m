#import<Sequence.h>

@implementation Sequence
-(id) initWithString:(NSString*)seq
{
  if(self=[super init])
    {
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

@end
