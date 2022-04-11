## Add your own custom Makefile targets here
sync:
	cp ../ontology-access-kit/src/oaklib/datamodels/ontology_metadata.yaml src/linkml/obo_metadata.yaml
	cp ../semantic-sql/owl/bad-ontology.owl src/data/examples
