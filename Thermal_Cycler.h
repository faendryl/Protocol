#import "Object.h"
#import "Amplify_DNA.h"
#import "Container.h"
#import <Foundation/NSArray.h>

@interface Thermal_Cycler: NSObject<Amplify_DNA> {
}

-(void) print;
-(BioObject*) amplifyTemplate:(BioObject*)templateStrand withPrimers:(NSMutableArray*)primers;
-(NSMutableArray*) run:(NSMutableArray*) inputs;
@end
