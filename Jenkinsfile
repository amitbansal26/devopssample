library identifier: "pipeline-library@v1.6"
retriever: modernSCM(
[
$class: "GitSCMSource",
remote: "https://github.com/redhat-cop/pipeline-library.git"
]
)

appName = "devopssample"
 pipeline {
   agent any
   stages{
     stage("Checkout") {
         steps {
                   checkout scm
               }
           }
     stage('Docker build'){

        steps {
              binaryBuild(buildConfigName: appName, buildFromPath: ".")
             }
      }
   }
 }
