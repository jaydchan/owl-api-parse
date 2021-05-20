package owl_api_parse;

import org.semanticweb.owlapi.formats.OWLXMLDocumentFormat;
import org.semanticweb.owlapi.model.*;
import org.semanticweb.owlapi.apibinding.OWLManager;

import java.io.File;

// http://syllabus.cs.manchester.ac.uk/pgt/2020/COMP62342/introduction-owl-api-msc.pdf
public class Main {
    public static void main(String[] args) {

	// check argument value is a valid file path
	File file = new File(args[0]);
	if (!file.exists()) {
	    System.out.println("No such file or directory");
	    System.exit(1);	    
	}
	
        try {
            // create an ontology
            OWLOntologyManager man = OWLManager.createOWLOntologyManager();
	    OWLOntology o = man.loadOntologyFromOntologyDocument(file);

            // print ontology
            man.saveOntology(o, new OWLXMLDocumentFormat(), System.out);

        } catch (OWLOntologyCreationException | OWLOntologyStorageException e) {
            e.printStackTrace();
        }
    }
}
