#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#include "OnfidoViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    FlutterMethodChannel* nativeChannel = [FlutterMethodChannel
                                           methodChannelWithName:@"flutter.native/helper"
                                           binaryMessenger:controller];
    __weak  typeof(self) weakSelf = self;
    [nativeChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        if ([@"startKYC"  isEqualToString:call.method]) {
            NSString * firstName = call.arguments[@"first_name"];
            NSString * lastName = call.arguments[@"last_name"];
            NSString * email = call.arguments[@"email"];
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            OnfidoViewController *onfidoViewController = [storyboard instantiateViewControllerWithIdentifier:@"OnfidoViewController"];
            onfidoViewController.result = result;
            onfidoViewController.firstName = firstName;
            onfidoViewController.lastName = lastName;
            onfidoViewController.email = email;

            [controller presentViewController:onfidoViewController animated:YES completion:nil];
        } else if ([@"showAlert" isEqualToString:call.method]) {
            NSString * title = call.arguments[@"title"];
            NSString * message = call.arguments[@"message"];
            NSString * button = call.arguments[@"button"];
            [weakSelf showAlertDialog:controller title:title message:message button:button];
            
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];
    
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)showAlertDialog:(FlutterViewController *)controller title:(NSString *)title message:(NSString *)message button:(NSString *)button {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:title
                                 message:message
                                 preferredStyle:UIAlertControllerStyleAlert];

    //Add Buttons
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:button
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                }];

    //Add your buttons to alert controller
    [alert addAction:yesButton];

    [controller presentViewController:alert animated:YES completion:nil];
}

@end
