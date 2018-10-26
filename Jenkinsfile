pipeline {
     agent {
        node {
            label 'master'
           }
         }

stages {

    stage('Pre Build') {
        steps {
            sh 'echo "Started...!" '
            echo sh(script: 'env|sort', returnStdout: true)
        }
    }
 

    stage('Terraform Init') {
        steps {
            
                sh '''
                    terraform init
                '''
        }
    }

    stage('Terraform Apply') {
        steps {
            withCredentials([
                usernamePassword(credentialsId: 'Anjan-AWS', passwordVariable: 'AWS_SECRET', usernameVariable: 'AWS_KEY'),
            ]) {
                sh '''
                    terraform apply -auto-approve -var aws_access_key=${AWS_KEY} -var aws_secret_key=${AWS_SECRET}
                '''
            }
        }
    }

    stage('Deployment Done') {
        steps {
            sh 'echo "Success....!!"'
        }
    }
  }
}



