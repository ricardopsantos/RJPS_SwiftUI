xcodegen -s ./XcodeGen/project.yml -p ./

open RJPS_SwiftUI.xcodeproj
cd XcodeGen
xcodegen dump --type graphviz --file ../Documents/Graph.viz
xcodegen dump --type json --file ../Documents/Graph.json