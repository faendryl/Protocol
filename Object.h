#import <Foundation/NSObject.h>
#import <Foundation/NSArray.h>
#import <Property.h>

@interface BioObject: NSObject {
    NSMutableArray* properties;
}
-(BOOL) hasProperty:(Class)cl;
-(void) addProp:(BioProperty*)property;
-(BioProperty*) extractProperty:(Class)propertyClass;
-(id) init;
-(void) printWithPrefix:(NSString*)prefix;
-(void) print;
@end
