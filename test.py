stage('Run Tests') {
    steps {
        container('python') {
            sh 'python3 test.py'
        }
    }
}