#import<Property.h>
#import<Foundation/NSString.h>

@interface Sequence:Property{
    NSString *sequence;
}

-(void) setSequence:(NSString*)seq;
-(NSString*) sequence;
@end
