#import<Sequence.h>
#import<stdio.h>

@implementation Sequence
-(id) initWithString:(NSString*)seq
{
  if((self=[super init]))
    {
      sequence=[[NSString alloc] init];
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

-(void) printWithPrefix:(NSString*)prefix
{
  char *cPrefix=[prefix UTF8String];
  printf("%sSequence: %s\n",cPrefix,[sequence UTF8String]);
}

-(void) print
{
  [self printWithPrefix:@""];
}

-(NSString*) reverseComplement
{
  NSString *reverse=[[NSString alloc] init];
  return reverse;
}
@end
