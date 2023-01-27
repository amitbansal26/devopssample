library identifier: "pipeline-library@v1.6"
retriever: modernSCM(
[
$class: "GitSCMSource",
remote: "https://github.com/redhat-cop/pipeline-library.git"
]
)
 pipeline {
   agent any

   triggers {
       GenericTrigger(
        genericVariables: [
         [key: 'ref', value: '$.ref']
        ],
        token: '8790',
        causeString: 'Triggered on $ref',
        regexpFilterText: '$ref',
        regexpFilterExpression: 'develop',
        printContributedVariables: true,
        printPostContent: true
       )
     }

   stages{
   stage('Docker build'){
        when {
           beforeAgent true
           branch 'develop'
          }

   steps{
      sh  'docker -H 0.0.0.0:4243 build  -t 172.22.33.113:8085/emitra-auth-server:"$BUILD_NUMBER" .'
      sh ' docker -H 0.0.0.0:4243 login 172.22.33.113:8085 -u amitb -p nexus123 '
      sh ' docker -H 0.0.0.0:4243 push 172.22.33.113:8085/emitra-auth-server:"$BUILD_NUMBER"'
      sh ' docker -H 0.0.0.0:4243 logout '
      }
   }

  stage('Get Current User'){
       when {
           beforeAgent true
           branch 'develop'
          }

   steps{
          sh 'whoami'
        }
     }

  stage('Kubernetes deploy dev'){
  when {
        beforeAgent true
        branch 'develop'
       }
   steps{
        sh ' sed -i "s,IMAGE_NAME,172.22.33.113:8089/emitra-auth-server:"$BUILD_NUMBER"," k8s/dev/deployment.yaml'
        sh 'kubectl apply -f  k8s/dev/deployment.yaml -n dev'
        sh 'kubectl apply -f k8s/dev/istio-config.yaml -n dev'
        sh 'kubectl apply -f  k8s/dev/service.yaml -n dev'
       }
    }
   }
 }
