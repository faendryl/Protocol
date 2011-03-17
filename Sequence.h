#import<Property.h>
#import<Foundation/NSString.h>

@interface Sequence:BioProperty{
    NSString *sequence;
}

-(id) initWithFasta:(const char*)fastaFile;
-(id) initWithString:(NSString*)seq;
-(id) init;
-(void) setSequence:(NSString*)seq;
-(NSString*) sequence;
-(void) dealloc;
-(void) printWithPrefix:(NSString*)prefix;
-(void) print;
@end
