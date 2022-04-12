## Add your own custom Makefile targets here
sync:
	cp ../ontology-access-kit/src/oaklib/datamodels/ontology_metadata.yaml src/linkml/obo_metadata.yaml
	cp ../semantic-sql/owl/bad-ontology.owl src/data/examples

SHEETSPECS = src/sheets
project/sheets/%.tsv: $(SHEETSPECS)/%_spec.tsv $(SOURCE_SCHEMA_PATH) 
	$(RUN) linkml2sheets --overwrite -s $(SOURCE_SCHEMA_PATH) $< -o $@ 

sparql:
	$(RUN) gen-sparql -d project/sparql $(SOURCE_SCHEMA_PATH)
