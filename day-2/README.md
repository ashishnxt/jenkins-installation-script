# Day 2 - Configuring an Ansible Pipeline

## Jenkins Sample Pipeline
```bash
pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                sh 'free -h'
            }
        }
    }
}
```

## Ansible Pipeline Steps
Step 1: Clone Git Repo on itself

Step 2: Verify ansible and required packages are present

Step 3: Syntax check and perform linting of the playbook

Step 4: Run the playbook against the inventory

Step 5: Log any artifacts

Step 6: Print a success message if the pipeline runs else print an error message
