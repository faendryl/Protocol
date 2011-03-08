#import "Object.h"
#import "Amplify_DNA.h"

@interface Thermal_Cycler: NSObject <Amplify_DNA> {
}

-(void) print;
-(NSMutableArray*) run:(NSMutableArray*) inputs;
@end
