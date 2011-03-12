#import<Object.h>
#import<Foundation/NSArray.h>

@interface Container:NSObject{
    NSMutableArray *objects;
}

-(void) printWithPrefix:(NSString*)prefix;
-(void) print;
-(void) addObject:(BioObject*)object;
-(NSMutableArray*) matchingObjects:(Class)objectClass;
-(NSMutableArray*) filtered:(Filter*)filter;
@end
