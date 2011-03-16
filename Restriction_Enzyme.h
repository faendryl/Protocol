#import <Property.h>

@interface Container;

@interface Restriction_Enzyme: BioProperty{
    Sequence *restriction_site;
    int cleaveage_site; // relative to beginning of restriction site; 0 is at beginning of sequence
}
-(void) process:(Container*)container;
-(void) printWithPrefix:(NSString*)prefix;
@end
