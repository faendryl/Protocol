#import "Object.h"
#import "Amplify_DNA.h"
#import "Container.h"
#import <Foundation/NSArray.h>

@interface Thermal_Cycler: NSObject <Amplify_DNA> {
}

-(void) print;
-(NSMutableArray*) run:(Container*) inputs;
@end
