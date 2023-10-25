# Inception
## About the project
This project requires creating and configuring 3 services: 
1. NGinX - a web server that delivers the web content from your website.
2. Wordpress - a content management system (CMS) that simplifies the creation and organization of web content, offering a user-friendly platform for website administrators to publish, edit, and manage posts, pages, and multimedia.
3. Mariadb - a database to store and manage structured data, such as user credentials, website content, and application data, ensuring data integrity and accessibility.

## Details
* Each service has to run on a separate docker container.
* Docker images have to be made from scratch. Using images from Docker Hub is forbidden.
* Docker-compose file needs to run the services all together.
* There should be a Makefile to start and stop the services all together.
* 3 containers need to be on the same network.
* There should be 2 volumes: 
	1. mariadb - to store data on the wordpress page.
	2. wordpress - to store neccessary files for the wordpress, which will be accessed by NGinX.

## What have I learned from the project?
First of all, I was introduced to the world of containers. Now, no more saying "It works on my machine" =)

Secondly, I learned how to make something completely unknown work completely from zero. To be more precise, NGinX, Wordpress and Mariadb.

<img width="671" alt="structure" src="https://github.com/Jamshidbek2000/inception_42/assets/106934634/7859fa5f-48d8-4440-9ed4-8d6ba37c1769">

