## Add your own custom Makefile targets here
sync:
	cp ../ontology-access-kit/src/oaklib/datamodels/ontology_metadata.yaml src/linkml/obo_metadata.yaml
	cp ../semantic-sql/owl/bad-ontology.owl src/data/examples

SHEETSPEC = src/linkml/export_spec.tsv
project/sheets/obo-metadata.sheets.tsv: $(SOURCE_SCHEMA_PATH) $(SHEETSPEC)
	$(RUN) linkml2sheets --overwrite -s $< $(SHEETSPEC) -o $@ 

sparql:
	$(RUN) gen-sparql -d project/sparql $(SOURCE_SCHEMA_PATH)
