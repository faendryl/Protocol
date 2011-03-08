#import <Foundation/NSObject.h>
#import <Foundation/NSArray.h>
#import "Interface.h"

@interface Protocol: NSObject {
    NSMutableArray *nodes;
    NSMutableArray *edges;
}


-(void) print;
-(void) Add_Step: (id<Interface>) step;
-(NSMutableArray*) runOnInputs:(NSMutableArray*)inputs withImplementors:(NSMutableArray*)implementors;
-(NSMutableArray*) nodes;
-(NSMutableArray*) edges;
@end
