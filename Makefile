all: clean package out go test

clean:
	mvn clean
	- rm -r out

package:
	mvn package

out:
	- mkdir out

CMD=java -jar target/owl-api-parse-1.0-SNAPSHOT-jar-with-dependencies.jar
RSC=./resources

test: out
	$(CMD) $(RSC)/and.owl > out/test_owl.owx
	$(CMD) $(RSC)/and.owx > out/test_owx.owx

clean-go:
	rm $(RSC)/go.ow*

go:
	wget -nc http://purl.obolibrary.org/obo/go.owl# -P $(RSC)/
	robot convert --input $(RSC)/go.owl --output $(RSC)/go.owx

go.owl:
	$(CMD) $(RSC)/go.owl > out/go_owl.owx

go.owx:
	$(CMD) $(RSC)/go.owx > out/go_owx.owx
