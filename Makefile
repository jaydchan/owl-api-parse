all: clean package out test

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

go.owl:
	$(CMD) $(RSC)/go.owl > out/go_owl.owx

go.owx:
	$(CMD) $(RSC)/go.owx > out/go_owx.owx
