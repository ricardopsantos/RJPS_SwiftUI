xcodegen -s ./XcodeGen/RJPS_SwiftUI.yml -p ./

open RJPS_SwiftUI.xcodeproj

xcodegen dump --spec ./XcodeGen/RJPS_SwiftUI.yml --type graphviz --file ../Documents/Graph.viz
xcodegen dump --spec ./XcodeGen/RJPS_SwiftUI.yml --type json --file ../Documents/Graph.json