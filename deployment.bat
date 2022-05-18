pscp -pw 1964 "C:\Users\Divanshu Agarwal\.jenkins\workspace\webapp\target\java-webapp-1.0.jar" div@192.168.56.101:/home/div/staging/java-webapp-1.0.jar
plink -v div@192.168.56.101 -pw 1964 "java -jar /home/div/staging/java-webapp-1.0.jar"
