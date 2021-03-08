xcodegen -s ./XcodeGen/RJPS_SwiftUI.yml -p ./

open RJPS_SwiftUI.xcodeproj

xcodegen dump --spec ./XcodeGen/RJPS_SwiftUI.yml --type graphviz --file ../Documents/Graph.viz
xcodegen dump --spec ./XcodeGen/RJPS_SwiftUI.yml --type json --file ../Documents/Graph.json

################################################################################

echo 'periphery...'
periphery scan

################################################################################

echo " ╔═══════════════════════╗"
echo " ║ Done! You're all set! ║"
echo " ╚═══════════════════════╝"
