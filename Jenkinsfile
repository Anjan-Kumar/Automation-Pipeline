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
            withCredentials([
                usernamePassword(credentialsId: 'Anjan-AWS', passwordVariable: 'AWS_SECRET', usernameVariable: 'AWS_KEY'),
            ]) {
                sh '''
                    terraform init
                '''
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

   
/*   stage('Terraform Plan') {
        steps {
            sh 'terraform plan -target=aws_lambda_function.demo_lambda -out demo_lambda.tfplan'
        }
    }
        stage('Terraform Apply') {
        steps {
            sh 'terraform apply demo_lambda.tfplan'
        }
    }
*/
    stage('Deployment Done') {
        steps {
            sh 'echo "Success....!!"'
        }
    }
  }
}



