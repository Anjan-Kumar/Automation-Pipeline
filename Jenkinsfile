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
 
     stage('Completed pre build and working on Build') {
        steps {
            sh 'echo "Pre-build Success and Next step is Terraform init....!!"'
        }
    }
  }

    stage('Terraform Init') {
        steps {
            withCredentials([
                usernamePassword(credentialsId: 'Anjan-AWS', passwordVariable: 'AWS_SECRET', usernameVariable: 'AWS_KEY'),
            ]) {
                sh '''
                    terraform init
                '''
            }
        }
    }

     stage('Completes Init and Working on Apply') {
        steps {
            sh 'echo "Next step is Terraform Apply!!"'
        }
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



