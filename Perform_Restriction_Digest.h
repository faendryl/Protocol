#import <Object.h>
#import <Restriction_Digest.h>


@interface Perform_Restriction_Digest: BioObject<Restriction_Digest>{
    BioObject *restrictionEnzyme;
}

-(NSMutableArray*) run:(NSMutableArray*) inputs;
-(void) setRestrictionEnzyme:(BioObject*)inputEnzyme;
@end
