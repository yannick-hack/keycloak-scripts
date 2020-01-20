## Docker Setup Script ##


apt -y update 
apt  -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt -y update
apt-cache -y policy docker-ce
apt -y install docker-ce
docker run -d -p 9001:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin --name keycloak jboss/keycloak    
docker exec keycloak /opt/jboss/keycloak/bin/jboss-cli.sh --connect "/subsystem=undertow/server=default-server/http-listener=default:write-attribute(name=proxy-address-forwarding, value=true)"
