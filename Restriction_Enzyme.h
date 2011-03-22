#import <Property.h>
#import <Sequence.h>

@class Container;

@interface Restriction_Enzyme: BioProperty{
    Sequence *restriction_site;
    int cleavage_site; // relative to beginning of restriction site; 0 is at beginning of sequence
}
-(void) process:(Container*)container;
-(void) printWithPrefix:(NSString*)prefix;
-(void) setRestrictionSite:(Sequence*)restriction_site_input;
-(void) setCleavageSite:(int)cleavage_site_input;
@end
