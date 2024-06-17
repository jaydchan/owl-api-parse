all: clean package go test

clean:
	mvn clean

package:
	mvn package

CMD=java -jar target/owl-api-parse-1.0-SNAPSHOT-jar-with-dependencies.jar
RSC=./resources

test:
	$(CMD) $(RSC)/and.owl
	$(CMD) $(RSC)/and.owx

clean-go:
	rm $(RSC)/go.ow*

go:
	wget -nc http://purl.obolibrary.org/obo/go.owl# -P $(RSC)/
	robot convert --input $(RSC)/go.owl --output $(RSC)/go.owx

go.owl:
	$(CMD) $(RSC)/go.owl

go.owx:
	$(CMD) $(RSC)/go.owx
