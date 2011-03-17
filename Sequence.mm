#import<Sequence.h>
#import<stdio.h>
#import<Wrapper.h>

@implementation Sequence
-(id) initWithFasta:(const char*)fastaFile
{
  char sequenceBuffer[100000];
  char sequenceTagBuffer[10000];
  readFasta(fastaFile,sequenceTagBuffer,sequenceBuffer);
  return [self initWithString:[NSString stringWithUTF8String:sequenceBuffer]];
}

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
  const char *cPrefix=[prefix UTF8String];
  printf("%sSequence: %s\n",cPrefix,[sequence UTF8String]);
}

-(void) print
{
  [self printWithPrefix:@""];
}

@end
