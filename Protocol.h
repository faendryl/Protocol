#import <Foundation/NSObject.h>
#import <Foundation/NSArray.h>
#import "Interface.h"

@interface BioProtocol: NSObject {
    NSMutableArray *nodes;
    NSMutableArray *edges;
}


-(void) print;
-(void) Add_Step: (Protocol*) step;
-(NSMutableArray*) runOnInputs:(NSMutableArray*)inputs withImplementors:(NSMutableArray*)implementors;
-(NSMutableArray*) nodes;
-(NSMutableArray*) edges;
@end
