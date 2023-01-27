library identifier: "pipeline-library@master", retriever: modernSCM(
  [$class: "GitSCMSource",
   remote: "https://github.com/redhat-cop/pipeline-library.git"])

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
   openshift.withProject("amitbansal26-dev"){
        steps {
              binaryBuild(buildConfigName: appName, buildFromPath: ".")
             }
         }
      }
   }
 }
