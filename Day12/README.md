# Jenkins Maven Projects Setup

## Overview

This repository is set up to use Jenkins for automating the build and test process of a Maven project. We have two Jenkins freestyle projects configured:

1. **Maven-Compile**: Compiles the Maven project.
2. **Maven-Test**: Runs tests on the Maven project.

The `Maven-Compile` project triggers the `Maven-Test` project upon successful completion.

## Prerequisites

Before setting up the Jenkins projects, ensure the following plugins are installed:

1. **Build Pipeline Plugin**
   - Enables visualization of the build pipeline and triggers downstream jobs.
   
2. **GitHub API Plugin**
   - Provides GitHub integration for Jenkins to access repositories.

3. **GitHub Integration Plugin**
   - Allows Jenkins to integrate with GitHub repositories, including authentication and notifications.

## Jenkins Project Configuration

### Maven-Compile

1. **Create a Freestyle Project**: 
   - Go to Jenkins dashboard.
   - Click on "New Item" and select "Freestyle project".
   - Name the project `Maven-Compile` and click "OK".

2. **Source Code Management**:
   - Under "Source Code Management", select "Git".
   - Enter your GitHub repository URL.
   - Add your GitHub credentials to access the private repository.

3. **Build**:
   - Under the "Build" section, click "Add build step" and select "Invoke top-level Maven targets".
   - Set the "Goals" field to `compile`.
   - Choose Maven version `3.9.0` from the dropdown.

4. **Post-build Actions**:
   - Under "Post-build Actions", click "Add post-build action".
   - Select "Build other projects".
   - Enter `Maven-Test` as the project to trigger after successful build.

5. **Save** the configuration.

### Maven-Test

1. **Create a Freestyle Project**:
   - Go to Jenkins dashboard.
   - Click on "New Item" and select "Freestyle project".
   - Name the project `Maven-Test` and click "OK".

2. **Source Code Management**:
   - Under "Source Code Management", select "Git".
   - Enter your GitHub repository URL.
   - Add your GitHub credentials to access the private repository.

3. **Build**:
   - Under the "Build" section, click "Add build step" and select "Invoke top-level Maven targets".
   - Set the "Goals" field to `test`.
   - Choose Maven version `3.9.0` from the dropdown.

4. **Save** the configuration.

## Pipeline Execution

- When the `Maven-Compile` project is executed, it will compile the Maven project.
- Upon successful completion, it triggers the `Maven-Test` project.
- The `Maven-Test` project runs tests on the compiled Maven project.

## Notes

- Ensure Jenkins has the necessary permissions to access the private GitHub repository.
- Verify that Maven version `3.9.0` is correctly configured in Jenkins.
- Monitor the build and test results in Jenkins for successful execution.

## Troubleshooting

- **Failed Build**: Check the console output of the Jenkins job for any errors during the build or test process.
- **Repository Access Issues**: Verify GitHub credentials and repository URL.
- **Maven Configuration Issues**: Ensure Maven version `3.9.0` is installed and configured correctly in Jenkins.
- **Plugin Issues**: Ensure all prerequisite plugins are installed and up-to-date.


## Output:

- ![image](https://github.com/user-attachments/assets/ee28e47a-2a61-4468-bb5e-f37b8a85f3cf)
- ![image](https://github.com/user-attachments/assets/80ce683b-4f4a-489a-8fb9-d5c62a501bd7)
- ![image](https://github.com/user-attachments/assets/478f09e9-ccdf-442f-87fd-0df324949460)
- ![image](https://github.com/user-attachments/assets/12e8beeb-8efd-47f0-b9ca-acec1f530f82)
- ![image](https://github.com/user-attachments/assets/bb9eb96a-2b9a-45aa-aa0e-04b00b92eb03)
- ![image](https://github.com/user-attachments/assets/a01d1f24-8c74-4688-b0f2-15c3d99c0d75)
- ![image](https://github.com/user-attachments/assets/68c838da-9c2f-4d44-88e3-b5a0766c6206)

## Additionally, you can create a View to visualize the pipeline workflows:

- ![image](https://github.com/user-attachments/assets/199acef8-b39d-4594-af6a-b4096be00064)









