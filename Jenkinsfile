pipeline 
{
  agent any
	  

  stages {
           stage(' SVN checkout') {
                               steps {
                                      echo 'Git checkout stage'
                                      
					git 'https://github.com/kuljeetverma/jenkins-docker-pipeline.git'
                                     }
                             }

             stage('Maven Build')    {
                                 steps {
                                        echo 'In build'
                                        
					sh 'mvn clean install'
                                       
                                       }
                               }

             stage('Unit test Results')    {
                                 steps {
                                        echo 'In Unit testing'
                                       
                                        sh 'mvn test-compile test'
                                       
                                       }
                               }
 
               /* stage('Sonarqube Analysis')    {
                                 steps {
                                        echo 'In Sonar Analysis'
	  			      withSonarQubeEnv('Sonar')
	  			      {
	  			      sh 'mvn sonar:sonar -Dsonar.login=admin -Dsonar.password=admin'
 	  			      }
                                       }
                               }
	   */
      
               stage('Upload to Artifactory')    {
                                 steps {
                                        echo 'In Release App Artifactory'
      				      script 
	 			      {
      
                                            def server = Artifactory.server('Artifactory-server')              
                                            def uploadSpec = """{
                                                                   "files": [
      					                               {
                                                                           "pattern": "target/*.jar",
                                                                           "target": "generic-local/com/nagarro/jenkins/kuljeetverma/"
                                                                         }
                                                                            ]
                                                                }"""
	  		      
	  			                              server.upload(uploadSpec)
	  			      }
      
                                       }
                               }

					stage('Prepare for deployment')
					{

						steps	{

							  sh "docker build -t jenkins_kuljeetverma_app ."

							  sh "docker tag jenkins_kuljeetverma_app localhost:5000/jenkins_kuljeetverma_app"

							  sh "docker push localhost:5000/jenkins_kuljeetverma_app"

							}
					}
      
            
			


         
     
                             
         }
}