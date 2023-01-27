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

        steps {
              binaryBuild(buildConfigName: appName, buildFromPath: ".")
             }
      }

      stage('Deploy top dev'){
       steps {
       tagImage(sourceImageName: appName, sourceImagePath: 'docker.io/amitb26j',
       toImagePath: 'amitbansal26-dev', toImageName: 'devopssample' , toImageTag:'prod2')
        }
      }
   }
 }
