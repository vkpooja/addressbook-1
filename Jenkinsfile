pipeline {
    agent any
    parameters{
        string(name:'Env',defaultValue:'Test',description:'version to deploy')
        booleanParam(name:'executeTests',defaultValue: true,description:'decide to run tc')
        choice(name:'APPVERSION',choices:['1.1','1.2','1.3'])
    }
    stages {
        stage('Compile') {
            steps {
                script{
                    echo "Compiling the code"
                  }
            }
        }
        stage('UnitTest') {
            when{
                expression{
                    params.executeTests == false
                }
            }
            steps {
                script{
                    echo "Running the test cases"
                }
            }
        }
        stage('Package') {
            steps {
                script{
                    echo "Packaging the code"
                }
            }
        }
        stage('Deploy') {
            steps {
                script{
                    echo "Deploying the app"
                    echo "Deploying to env: ${params.Env}"
                    echo "Deploying the app version ${params.APPVERSION}"
                }
            }
        }
    }
}
