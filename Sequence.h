#import<Property.h>
#import<Foundation/NSString.h>

@interface Sequence:Property{
    NSString *sequence;
}

-(id) initWithString:(NSString*)seq;
-(id) init;
-(void) setSequence:(NSString*)seq;
-(NSString*) sequence;
@end
