library identifier: "pipeline-library@master", retriever: modernSCM(
  [$class: "GitSCMSource",
   remote: "https://github.com/redhat-cop/pipeline-library.git"])
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
