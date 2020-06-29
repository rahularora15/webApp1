pipeline
{
agent any
tools
{
  maven 'maven'
}
stages
{
  stage('checkout')
  {
    steps
    {
        checkout scm
     }
  }
  
  
  stage('Build')
  {
    steps
    {
      bat "mvn package"
	  bat "java -jar target/dependency/webapp-runner.jar target/*.war"
    }
  }
	
  stage('Sonar Analysis')
  {
    steps
    {
      echo "Sonar"
      withSonarQubeEnv("local sonar") 
				{
					bat "mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.2:sonar"
				}
    }
  }
	
    stage ('Uploading to Artifactory')
	{
		steps
		{
		echo "Stage for artifact"
		rtMavenDeployer (
                    id: 'deployer',
                    serverId: '123456789@artifactory',
		    snapshotRepo: 'devopsforqaRA',
                    releaseRepo: 'devopsforqaRA'
                    
                )
                rtMavenRun (
                    pom: 'pom.xml',
                    goals: 'clean install',
                    deployerId: 'deployer',
                )
                rtPublishBuildInfo (
                    serverId: '123456789@artifactory',
                )
			
		}
	}
	
	stage('Docker Build Image')
	{
		steps

		{
			bat "docker build -t rahul/random-image ./"

		}
	}
	
	stage('Docker Deployment-container run')
	{
		steps
		{


			bat "docker run -d -p 8081:8080 rahul/random-image"
		}
	}	
	
}
  
  }
