xcodebuild -workspace CommonFoundation.xcworkspace \
           -scheme CommonFoundation \
           -destination 'platform=iOS Simulator,name=iPhone 15 Pro Max,OS=latest' \
           -resultBundlePath TestResults.xcresult \
            clean test | xcpretty --test --color
