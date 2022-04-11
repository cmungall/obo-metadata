

CREATE TABLE "NamedObject" (
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE "Ontology" (
	id TEXT NOT NULL, 
	title TEXT NOT NULL, 
	has_ontology_root_term TEXT, 
	license TEXT NOT NULL, 
	"versionIRI" TEXT NOT NULL, 
	"versionInfo" TEXT NOT NULL, 
	created TEXT, 
	imports TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "AnnotationProperty" (
	id TEXT NOT NULL, 
	deprecated BOOLEAN, 
	has_obsolescence_reason TEXT, 
	term_replaced_by TEXT, 
	"excluded_from_QC_check" TEXT, 
	"excluded_subClassOf" TEXT, 
	should_conform_to TEXT, 
	created_by TEXT, 
	created TEXT, 
	"isDefinedBy" TEXT, 
	ontology_term_requester TEXT, 
	imported_from TEXT, 
	category TEXT, 
	in_subset TEXT, 
	image TEXT, 
	has_curation_status TEXT, 
	is_class_level BOOLEAN, 
	is_metadata_tag BOOLEAN, 
	label TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("isDefinedBy") REFERENCES "Ontology" (id)
);

CREATE TABLE "Class" (
	id TEXT NOT NULL, 
	deprecated BOOLEAN, 
	has_obsolescence_reason TEXT, 
	term_replaced_by TEXT, 
	"excluded_from_QC_check" TEXT, 
	"excluded_subClassOf" TEXT, 
	should_conform_to TEXT, 
	created_by TEXT, 
	created TEXT, 
	"isDefinedBy" TEXT, 
	ontology_term_requester TEXT, 
	imported_from TEXT, 
	category TEXT, 
	in_subset TEXT, 
	image TEXT, 
	has_curation_status TEXT, 
	never_in_taxon TEXT, 
	disconnected_from TEXT, 
	has_rank TEXT, 
	label TEXT NOT NULL, 
	"broadMatch" TEXT, 
	"exactMatch" TEXT, 
	"narrowMatch" TEXT, 
	"closeMatch" TEXT, 
	"subClassOf" TEXT, 
	"intersectionOf" TEXT, 
	cardinality TEXT, 
	"complementOf" TEXT, 
	"oneOf" TEXT, 
	"unionOf" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("isDefinedBy") REFERENCES "Ontology" (id), 
	FOREIGN KEY(disconnected_from) REFERENCES "Class" (id)
);

CREATE TABLE "NamedIndividual" (
	id TEXT NOT NULL, 
	deprecated BOOLEAN, 
	has_obsolescence_reason TEXT, 
	term_replaced_by TEXT, 
	"excluded_from_QC_check" TEXT, 
	"excluded_subClassOf" TEXT, 
	should_conform_to TEXT, 
	created_by TEXT, 
	created TEXT, 
	"isDefinedBy" TEXT, 
	ontology_term_requester TEXT, 
	imported_from TEXT, 
	category TEXT, 
	in_subset TEXT, 
	image TEXT, 
	has_curation_status TEXT, 
	label TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("isDefinedBy") REFERENCES "Ontology" (id)
);

CREATE TABLE "Subset" (
	id TEXT NOT NULL, 
	deprecated BOOLEAN, 
	has_obsolescence_reason TEXT, 
	term_replaced_by TEXT, 
	"excluded_from_QC_check" TEXT, 
	"excluded_subClassOf" TEXT, 
	should_conform_to TEXT, 
	created_by TEXT, 
	created TEXT, 
	"isDefinedBy" TEXT, 
	ontology_term_requester TEXT, 
	imported_from TEXT, 
	category TEXT, 
	in_subset TEXT, 
	image TEXT, 
	has_curation_status TEXT, 
	is_class_level BOOLEAN, 
	is_metadata_tag BOOLEAN, 
	label TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("isDefinedBy") REFERENCES "Ontology" (id)
);

CREATE TABLE "NamedObject_type" (
	backref_id TEXT, 
	type TEXT, 
	PRIMARY KEY (backref_id, type), 
	FOREIGN KEY(backref_id) REFERENCES "NamedObject" (id)
);

CREATE TABLE "Ontology_type" (
	backref_id TEXT, 
	type TEXT, 
	PRIMARY KEY (backref_id, type), 
	FOREIGN KEY(backref_id) REFERENCES "Ontology" (id)
);

CREATE TABLE "Ontology_source" (
	backref_id TEXT, 
	source TEXT, 
	PRIMARY KEY (backref_id, source), 
	FOREIGN KEY(backref_id) REFERENCES "Ontology" (id)
);

CREATE TABLE "Ontology_comment" (
	backref_id TEXT, 
	comment TEXT, 
	PRIMARY KEY (backref_id, comment), 
	FOREIGN KEY(backref_id) REFERENCES "Ontology" (id)
);

CREATE TABLE "Ontology_creator" (
	backref_id TEXT, 
	creator TEXT, 
	PRIMARY KEY (backref_id, creator), 
	FOREIGN KEY(backref_id) REFERENCES "Ontology" (id)
);

CREATE TABLE "Axiom" (
	"annotatedProperty" TEXT, 
	"annotatedSource" TEXT, 
	"annotatedTarget" TEXT, 
	source TEXT, 
	is_inferred BOOLEAN, 
	notes TEXT, 
	url TEXT, 
	has_axiom_label TEXT, 
	is_a_defining_property_chain_axiom TEXT, 
	is_a_defining_property_chain_axiom_where_second_argument_is_reflexive TEXT, 
	created_by TEXT, 
	date_retrieved TEXT, 
	evidence TEXT, 
	external_ontology TEXT, 
	database_cross_reference TEXT, 
	has_exact_synonym TEXT, 
	has_synonym_type TEXT, 
	comment TEXT, 
	label TEXT, 
	"seeAlso" TEXT, 
	PRIMARY KEY ("annotatedProperty", "annotatedSource", "annotatedTarget", source, is_inferred, notes, url, has_axiom_label, is_a_defining_property_chain_axiom, is_a_defining_property_chain_axiom_where_second_argument_is_reflexive, created_by, date_retrieved, evidence, external_ontology, database_cross_reference, has_exact_synonym, has_synonym_type, comment, label, "seeAlso"), 
	FOREIGN KEY("annotatedProperty") REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "ObjectProperty" (
	id TEXT NOT NULL, 
	deprecated BOOLEAN, 
	has_obsolescence_reason TEXT, 
	term_replaced_by TEXT, 
	"excluded_from_QC_check" TEXT, 
	"excluded_subClassOf" TEXT, 
	should_conform_to TEXT, 
	created_by TEXT, 
	created TEXT, 
	"isDefinedBy" TEXT, 
	ontology_term_requester TEXT, 
	imported_from TEXT, 
	category TEXT, 
	in_subset TEXT, 
	image TEXT, 
	has_curation_status TEXT, 
	is_class_level BOOLEAN, 
	is_metadata_tag BOOLEAN, 
	label TEXT, 
	temporal_interpretation TEXT, 
	is_cyclic BOOLEAN, 
	is_transitive BOOLEAN, 
	"inverseOf" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("isDefinedBy") REFERENCES "Ontology" (id), 
	FOREIGN KEY(temporal_interpretation) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "TransitiveProperty" (
	id TEXT NOT NULL, 
	deprecated BOOLEAN, 
	has_obsolescence_reason TEXT, 
	term_replaced_by TEXT, 
	"excluded_from_QC_check" TEXT, 
	"excluded_subClassOf" TEXT, 
	should_conform_to TEXT, 
	created_by TEXT, 
	created TEXT, 
	"isDefinedBy" TEXT, 
	ontology_term_requester TEXT, 
	imported_from TEXT, 
	category TEXT, 
	in_subset TEXT, 
	image TEXT, 
	has_curation_status TEXT, 
	is_class_level BOOLEAN, 
	is_metadata_tag BOOLEAN, 
	label TEXT, 
	temporal_interpretation TEXT, 
	is_cyclic BOOLEAN, 
	is_transitive BOOLEAN, 
	"inverseOf" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("isDefinedBy") REFERENCES "Ontology" (id), 
	FOREIGN KEY(temporal_interpretation) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "AnnotationProperty_type" (
	backref_id TEXT, 
	type TEXT, 
	PRIMARY KEY (backref_id, type), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_has_exact_synonym" (
	backref_id TEXT, 
	has_exact_synonym TEXT, 
	PRIMARY KEY (backref_id, has_exact_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_has_narrow_synonym" (
	backref_id TEXT, 
	has_narrow_synonym TEXT, 
	PRIMARY KEY (backref_id, has_narrow_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_has_broad_synonym" (
	backref_id TEXT, 
	has_broad_synonym TEXT, 
	PRIMARY KEY (backref_id, has_broad_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_has_related_synonym" (
	backref_id TEXT, 
	has_related_synonym TEXT, 
	PRIMARY KEY (backref_id, has_related_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_alternative_term" (
	backref_id TEXT, 
	alternative_term TEXT, 
	PRIMARY KEY (backref_id, alternative_term), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_ISA_alternative_term" (
	backref_id TEXT, 
	"ISA_alternative_term" TEXT, 
	PRIMARY KEY (backref_id, "ISA_alternative_term"), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_IEDB_alternative_term" (
	backref_id TEXT, 
	"IEDB_alternative_term" TEXT, 
	PRIMARY KEY (backref_id, "IEDB_alternative_term"), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_editor_preferred_term" (
	backref_id TEXT, 
	editor_preferred_term TEXT, 
	PRIMARY KEY (backref_id, editor_preferred_term), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_OBO_foundry_unique_label" (
	backref_id TEXT, 
	"OBO_foundry_unique_label" TEXT, 
	PRIMARY KEY (backref_id, "OBO_foundry_unique_label"), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_consider" (
	backref_id TEXT, 
	consider TEXT, 
	PRIMARY KEY (backref_id, consider), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_has_alternative_id" (
	backref_id TEXT, 
	has_alternative_id TEXT, 
	PRIMARY KEY (backref_id, has_alternative_id), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_excluded_synonym" (
	backref_id TEXT, 
	excluded_synonym TEXT, 
	PRIMARY KEY (backref_id, excluded_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_creation_date" (
	backref_id TEXT, 
	creation_date TEXT, 
	PRIMARY KEY (backref_id, creation_date), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_contributor" (
	backref_id TEXT, 
	contributor TEXT, 
	PRIMARY KEY (backref_id, contributor), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_creator" (
	backref_id TEXT, 
	creator TEXT, 
	PRIMARY KEY (backref_id, creator), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_date" (
	backref_id TEXT, 
	date TEXT, 
	PRIMARY KEY (backref_id, date), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_editor_note" (
	backref_id TEXT, 
	editor_note TEXT, 
	PRIMARY KEY (backref_id, editor_note), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_term_editor" (
	backref_id TEXT, 
	term_editor TEXT, 
	PRIMARY KEY (backref_id, term_editor), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_definition_source" (
	backref_id TEXT, 
	definition_source TEXT, 
	PRIMARY KEY (backref_id, definition_source), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_term_tracker_item" (
	backref_id TEXT, 
	term_tracker_item TEXT, 
	PRIMARY KEY (backref_id, term_tracker_item), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_database_cross_reference" (
	backref_id TEXT, 
	database_cross_reference TEXT, 
	PRIMARY KEY (backref_id, database_cross_reference), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_has_obo_namespace" (
	backref_id TEXT, 
	has_obo_namespace TEXT, 
	PRIMARY KEY (backref_id, has_obo_namespace), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_conformsTo" (
	backref_id TEXT, 
	"conformsTo" TEXT, 
	PRIMARY KEY (backref_id, "conformsTo"), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_comment" (
	backref_id TEXT, 
	comment TEXT, 
	PRIMARY KEY (backref_id, comment), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_seeAlso" (
	backref_id TEXT, 
	"seeAlso" TEXT, 
	PRIMARY KEY (backref_id, "seeAlso"), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_example_of_usage" (
	backref_id TEXT, 
	example_of_usage TEXT, 
	PRIMARY KEY (backref_id, example_of_usage), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_curator_note" (
	backref_id TEXT, 
	curator_note TEXT, 
	PRIMARY KEY (backref_id, curator_note), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_depicted_by" (
	backref_id TEXT, 
	depicted_by TEXT, 
	PRIMARY KEY (backref_id, depicted_by), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_page" (
	backref_id TEXT, 
	page TEXT, 
	PRIMARY KEY (backref_id, page), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_domain" (
	backref_id TEXT, 
	domain TEXT, 
	PRIMARY KEY (backref_id, domain), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_range" (
	backref_id TEXT, 
	range TEXT, 
	PRIMARY KEY (backref_id, range), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_definition" (
	backref_id TEXT, 
	definition TEXT, 
	PRIMARY KEY (backref_id, definition), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_broadMatch" (
	backref_id TEXT, 
	"broadMatch" TEXT, 
	PRIMARY KEY (backref_id, "broadMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_exactMatch" (
	backref_id TEXT, 
	"exactMatch" TEXT, 
	PRIMARY KEY (backref_id, "exactMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_narrowMatch" (
	backref_id TEXT, 
	"narrowMatch" TEXT, 
	PRIMARY KEY (backref_id, "narrowMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_closeMatch" (
	backref_id TEXT, 
	"closeMatch" TEXT, 
	PRIMARY KEY (backref_id, "closeMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_subClassOf" (
	backref_id TEXT, 
	"subClassOf" TEXT, 
	PRIMARY KEY (backref_id, "subClassOf"), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "AnnotationProperty_shorthand" (
	backref_id TEXT, 
	shorthand TEXT, 
	PRIMARY KEY (backref_id, shorthand), 
	FOREIGN KEY(backref_id) REFERENCES "AnnotationProperty" (id)
);

CREATE TABLE "Class_type" (
	backref_id TEXT, 
	type TEXT, 
	PRIMARY KEY (backref_id, type), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_has_exact_synonym" (
	backref_id TEXT, 
	has_exact_synonym TEXT, 
	PRIMARY KEY (backref_id, has_exact_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_has_narrow_synonym" (
	backref_id TEXT, 
	has_narrow_synonym TEXT, 
	PRIMARY KEY (backref_id, has_narrow_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_has_broad_synonym" (
	backref_id TEXT, 
	has_broad_synonym TEXT, 
	PRIMARY KEY (backref_id, has_broad_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_has_related_synonym" (
	backref_id TEXT, 
	has_related_synonym TEXT, 
	PRIMARY KEY (backref_id, has_related_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_alternative_term" (
	backref_id TEXT, 
	alternative_term TEXT, 
	PRIMARY KEY (backref_id, alternative_term), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_ISA_alternative_term" (
	backref_id TEXT, 
	"ISA_alternative_term" TEXT, 
	PRIMARY KEY (backref_id, "ISA_alternative_term"), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_IEDB_alternative_term" (
	backref_id TEXT, 
	"IEDB_alternative_term" TEXT, 
	PRIMARY KEY (backref_id, "IEDB_alternative_term"), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_editor_preferred_term" (
	backref_id TEXT, 
	editor_preferred_term TEXT, 
	PRIMARY KEY (backref_id, editor_preferred_term), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_OBO_foundry_unique_label" (
	backref_id TEXT, 
	"OBO_foundry_unique_label" TEXT, 
	PRIMARY KEY (backref_id, "OBO_foundry_unique_label"), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_consider" (
	backref_id TEXT, 
	consider TEXT, 
	PRIMARY KEY (backref_id, consider), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_has_alternative_id" (
	backref_id TEXT, 
	has_alternative_id TEXT, 
	PRIMARY KEY (backref_id, has_alternative_id), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_excluded_synonym" (
	backref_id TEXT, 
	excluded_synonym TEXT, 
	PRIMARY KEY (backref_id, excluded_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_creation_date" (
	backref_id TEXT, 
	creation_date TEXT, 
	PRIMARY KEY (backref_id, creation_date), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_contributor" (
	backref_id TEXT, 
	contributor TEXT, 
	PRIMARY KEY (backref_id, contributor), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_creator" (
	backref_id TEXT, 
	creator TEXT, 
	PRIMARY KEY (backref_id, creator), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_date" (
	backref_id TEXT, 
	date TEXT, 
	PRIMARY KEY (backref_id, date), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_editor_note" (
	backref_id TEXT, 
	editor_note TEXT, 
	PRIMARY KEY (backref_id, editor_note), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_term_editor" (
	backref_id TEXT, 
	term_editor TEXT, 
	PRIMARY KEY (backref_id, term_editor), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_definition_source" (
	backref_id TEXT, 
	definition_source TEXT, 
	PRIMARY KEY (backref_id, definition_source), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_term_tracker_item" (
	backref_id TEXT, 
	term_tracker_item TEXT, 
	PRIMARY KEY (backref_id, term_tracker_item), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_database_cross_reference" (
	backref_id TEXT, 
	database_cross_reference TEXT, 
	PRIMARY KEY (backref_id, database_cross_reference), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_has_obo_namespace" (
	backref_id TEXT, 
	has_obo_namespace TEXT, 
	PRIMARY KEY (backref_id, has_obo_namespace), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_conformsTo" (
	backref_id TEXT, 
	"conformsTo" TEXT, 
	PRIMARY KEY (backref_id, "conformsTo"), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_comment" (
	backref_id TEXT, 
	comment TEXT, 
	PRIMARY KEY (backref_id, comment), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_seeAlso" (
	backref_id TEXT, 
	"seeAlso" TEXT, 
	PRIMARY KEY (backref_id, "seeAlso"), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_example_of_usage" (
	backref_id TEXT, 
	example_of_usage TEXT, 
	PRIMARY KEY (backref_id, example_of_usage), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_curator_note" (
	backref_id TEXT, 
	curator_note TEXT, 
	PRIMARY KEY (backref_id, curator_note), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_depicted_by" (
	backref_id TEXT, 
	depicted_by TEXT, 
	PRIMARY KEY (backref_id, depicted_by), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_page" (
	backref_id TEXT, 
	page TEXT, 
	PRIMARY KEY (backref_id, page), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_definition" (
	backref_id TEXT, 
	definition TEXT, 
	PRIMARY KEY (backref_id, definition), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_disjointWith" (
	backref_id TEXT, 
	"disjointWith" TEXT, 
	PRIMARY KEY (backref_id, "disjointWith"), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "Class_equivalentClass" (
	backref_id TEXT, 
	"equivalentClass" TEXT, 
	PRIMARY KEY (backref_id, "equivalentClass"), 
	FOREIGN KEY(backref_id) REFERENCES "Class" (id)
);

CREATE TABLE "NamedIndividual_type" (
	backref_id TEXT, 
	type TEXT, 
	PRIMARY KEY (backref_id, type), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_has_exact_synonym" (
	backref_id TEXT, 
	has_exact_synonym TEXT, 
	PRIMARY KEY (backref_id, has_exact_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_has_narrow_synonym" (
	backref_id TEXT, 
	has_narrow_synonym TEXT, 
	PRIMARY KEY (backref_id, has_narrow_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_has_broad_synonym" (
	backref_id TEXT, 
	has_broad_synonym TEXT, 
	PRIMARY KEY (backref_id, has_broad_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_has_related_synonym" (
	backref_id TEXT, 
	has_related_synonym TEXT, 
	PRIMARY KEY (backref_id, has_related_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_alternative_term" (
	backref_id TEXT, 
	alternative_term TEXT, 
	PRIMARY KEY (backref_id, alternative_term), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_ISA_alternative_term" (
	backref_id TEXT, 
	"ISA_alternative_term" TEXT, 
	PRIMARY KEY (backref_id, "ISA_alternative_term"), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_IEDB_alternative_term" (
	backref_id TEXT, 
	"IEDB_alternative_term" TEXT, 
	PRIMARY KEY (backref_id, "IEDB_alternative_term"), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_editor_preferred_term" (
	backref_id TEXT, 
	editor_preferred_term TEXT, 
	PRIMARY KEY (backref_id, editor_preferred_term), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_OBO_foundry_unique_label" (
	backref_id TEXT, 
	"OBO_foundry_unique_label" TEXT, 
	PRIMARY KEY (backref_id, "OBO_foundry_unique_label"), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_consider" (
	backref_id TEXT, 
	consider TEXT, 
	PRIMARY KEY (backref_id, consider), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_has_alternative_id" (
	backref_id TEXT, 
	has_alternative_id TEXT, 
	PRIMARY KEY (backref_id, has_alternative_id), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_excluded_synonym" (
	backref_id TEXT, 
	excluded_synonym TEXT, 
	PRIMARY KEY (backref_id, excluded_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_creation_date" (
	backref_id TEXT, 
	creation_date TEXT, 
	PRIMARY KEY (backref_id, creation_date), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_contributor" (
	backref_id TEXT, 
	contributor TEXT, 
	PRIMARY KEY (backref_id, contributor), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_creator" (
	backref_id TEXT, 
	creator TEXT, 
	PRIMARY KEY (backref_id, creator), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_date" (
	backref_id TEXT, 
	date TEXT, 
	PRIMARY KEY (backref_id, date), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_editor_note" (
	backref_id TEXT, 
	editor_note TEXT, 
	PRIMARY KEY (backref_id, editor_note), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_term_editor" (
	backref_id TEXT, 
	term_editor TEXT, 
	PRIMARY KEY (backref_id, term_editor), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_definition_source" (
	backref_id TEXT, 
	definition_source TEXT, 
	PRIMARY KEY (backref_id, definition_source), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_term_tracker_item" (
	backref_id TEXT, 
	term_tracker_item TEXT, 
	PRIMARY KEY (backref_id, term_tracker_item), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_broadMatch" (
	backref_id TEXT, 
	"broadMatch" TEXT, 
	PRIMARY KEY (backref_id, "broadMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_closeMatch" (
	backref_id TEXT, 
	"closeMatch" TEXT, 
	PRIMARY KEY (backref_id, "closeMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_exactMatch" (
	backref_id TEXT, 
	"exactMatch" TEXT, 
	PRIMARY KEY (backref_id, "exactMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_narrowMatch" (
	backref_id TEXT, 
	"narrowMatch" TEXT, 
	PRIMARY KEY (backref_id, "narrowMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_database_cross_reference" (
	backref_id TEXT, 
	database_cross_reference TEXT, 
	PRIMARY KEY (backref_id, database_cross_reference), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_has_obo_namespace" (
	backref_id TEXT, 
	has_obo_namespace TEXT, 
	PRIMARY KEY (backref_id, has_obo_namespace), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_conformsTo" (
	backref_id TEXT, 
	"conformsTo" TEXT, 
	PRIMARY KEY (backref_id, "conformsTo"), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_comment" (
	backref_id TEXT, 
	comment TEXT, 
	PRIMARY KEY (backref_id, comment), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_seeAlso" (
	backref_id TEXT, 
	"seeAlso" TEXT, 
	PRIMARY KEY (backref_id, "seeAlso"), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_example_of_usage" (
	backref_id TEXT, 
	example_of_usage TEXT, 
	PRIMARY KEY (backref_id, example_of_usage), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_curator_note" (
	backref_id TEXT, 
	curator_note TEXT, 
	PRIMARY KEY (backref_id, curator_note), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_depicted_by" (
	backref_id TEXT, 
	depicted_by TEXT, 
	PRIMARY KEY (backref_id, depicted_by), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_page" (
	backref_id TEXT, 
	page TEXT, 
	PRIMARY KEY (backref_id, page), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "NamedIndividual_definition" (
	backref_id TEXT, 
	definition TEXT, 
	PRIMARY KEY (backref_id, definition), 
	FOREIGN KEY(backref_id) REFERENCES "NamedIndividual" (id)
);

CREATE TABLE "Subset_type" (
	backref_id TEXT, 
	type TEXT, 
	PRIMARY KEY (backref_id, type), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_has_exact_synonym" (
	backref_id TEXT, 
	has_exact_synonym TEXT, 
	PRIMARY KEY (backref_id, has_exact_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_has_narrow_synonym" (
	backref_id TEXT, 
	has_narrow_synonym TEXT, 
	PRIMARY KEY (backref_id, has_narrow_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_has_broad_synonym" (
	backref_id TEXT, 
	has_broad_synonym TEXT, 
	PRIMARY KEY (backref_id, has_broad_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_has_related_synonym" (
	backref_id TEXT, 
	has_related_synonym TEXT, 
	PRIMARY KEY (backref_id, has_related_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_alternative_term" (
	backref_id TEXT, 
	alternative_term TEXT, 
	PRIMARY KEY (backref_id, alternative_term), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_ISA_alternative_term" (
	backref_id TEXT, 
	"ISA_alternative_term" TEXT, 
	PRIMARY KEY (backref_id, "ISA_alternative_term"), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_IEDB_alternative_term" (
	backref_id TEXT, 
	"IEDB_alternative_term" TEXT, 
	PRIMARY KEY (backref_id, "IEDB_alternative_term"), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_editor_preferred_term" (
	backref_id TEXT, 
	editor_preferred_term TEXT, 
	PRIMARY KEY (backref_id, editor_preferred_term), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_OBO_foundry_unique_label" (
	backref_id TEXT, 
	"OBO_foundry_unique_label" TEXT, 
	PRIMARY KEY (backref_id, "OBO_foundry_unique_label"), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_consider" (
	backref_id TEXT, 
	consider TEXT, 
	PRIMARY KEY (backref_id, consider), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_has_alternative_id" (
	backref_id TEXT, 
	has_alternative_id TEXT, 
	PRIMARY KEY (backref_id, has_alternative_id), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_excluded_synonym" (
	backref_id TEXT, 
	excluded_synonym TEXT, 
	PRIMARY KEY (backref_id, excluded_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_creation_date" (
	backref_id TEXT, 
	creation_date TEXT, 
	PRIMARY KEY (backref_id, creation_date), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_contributor" (
	backref_id TEXT, 
	contributor TEXT, 
	PRIMARY KEY (backref_id, contributor), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_creator" (
	backref_id TEXT, 
	creator TEXT, 
	PRIMARY KEY (backref_id, creator), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_date" (
	backref_id TEXT, 
	date TEXT, 
	PRIMARY KEY (backref_id, date), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_editor_note" (
	backref_id TEXT, 
	editor_note TEXT, 
	PRIMARY KEY (backref_id, editor_note), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_term_editor" (
	backref_id TEXT, 
	term_editor TEXT, 
	PRIMARY KEY (backref_id, term_editor), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_definition_source" (
	backref_id TEXT, 
	definition_source TEXT, 
	PRIMARY KEY (backref_id, definition_source), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_term_tracker_item" (
	backref_id TEXT, 
	term_tracker_item TEXT, 
	PRIMARY KEY (backref_id, term_tracker_item), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_database_cross_reference" (
	backref_id TEXT, 
	database_cross_reference TEXT, 
	PRIMARY KEY (backref_id, database_cross_reference), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_has_obo_namespace" (
	backref_id TEXT, 
	has_obo_namespace TEXT, 
	PRIMARY KEY (backref_id, has_obo_namespace), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_conformsTo" (
	backref_id TEXT, 
	"conformsTo" TEXT, 
	PRIMARY KEY (backref_id, "conformsTo"), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_comment" (
	backref_id TEXT, 
	comment TEXT, 
	PRIMARY KEY (backref_id, comment), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_seeAlso" (
	backref_id TEXT, 
	"seeAlso" TEXT, 
	PRIMARY KEY (backref_id, "seeAlso"), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_example_of_usage" (
	backref_id TEXT, 
	example_of_usage TEXT, 
	PRIMARY KEY (backref_id, example_of_usage), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_curator_note" (
	backref_id TEXT, 
	curator_note TEXT, 
	PRIMARY KEY (backref_id, curator_note), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_depicted_by" (
	backref_id TEXT, 
	depicted_by TEXT, 
	PRIMARY KEY (backref_id, depicted_by), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_page" (
	backref_id TEXT, 
	page TEXT, 
	PRIMARY KEY (backref_id, page), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_domain" (
	backref_id TEXT, 
	domain TEXT, 
	PRIMARY KEY (backref_id, domain), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_range" (
	backref_id TEXT, 
	range TEXT, 
	PRIMARY KEY (backref_id, range), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_definition" (
	backref_id TEXT, 
	definition TEXT, 
	PRIMARY KEY (backref_id, definition), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_broadMatch" (
	backref_id TEXT, 
	"broadMatch" TEXT, 
	PRIMARY KEY (backref_id, "broadMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_exactMatch" (
	backref_id TEXT, 
	"exactMatch" TEXT, 
	PRIMARY KEY (backref_id, "exactMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_narrowMatch" (
	backref_id TEXT, 
	"narrowMatch" TEXT, 
	PRIMARY KEY (backref_id, "narrowMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_closeMatch" (
	backref_id TEXT, 
	"closeMatch" TEXT, 
	PRIMARY KEY (backref_id, "closeMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_subClassOf" (
	backref_id TEXT, 
	"subClassOf" TEXT, 
	PRIMARY KEY (backref_id, "subClassOf"), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "Subset_shorthand" (
	backref_id TEXT, 
	shorthand TEXT, 
	PRIMARY KEY (backref_id, shorthand), 
	FOREIGN KEY(backref_id) REFERENCES "Subset" (id)
);

CREATE TABLE "ObjectProperty_type" (
	backref_id TEXT, 
	type TEXT, 
	PRIMARY KEY (backref_id, type), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_has_exact_synonym" (
	backref_id TEXT, 
	has_exact_synonym TEXT, 
	PRIMARY KEY (backref_id, has_exact_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_has_narrow_synonym" (
	backref_id TEXT, 
	has_narrow_synonym TEXT, 
	PRIMARY KEY (backref_id, has_narrow_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_has_broad_synonym" (
	backref_id TEXT, 
	has_broad_synonym TEXT, 
	PRIMARY KEY (backref_id, has_broad_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_has_related_synonym" (
	backref_id TEXT, 
	has_related_synonym TEXT, 
	PRIMARY KEY (backref_id, has_related_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_alternative_term" (
	backref_id TEXT, 
	alternative_term TEXT, 
	PRIMARY KEY (backref_id, alternative_term), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_ISA_alternative_term" (
	backref_id TEXT, 
	"ISA_alternative_term" TEXT, 
	PRIMARY KEY (backref_id, "ISA_alternative_term"), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_IEDB_alternative_term" (
	backref_id TEXT, 
	"IEDB_alternative_term" TEXT, 
	PRIMARY KEY (backref_id, "IEDB_alternative_term"), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_editor_preferred_term" (
	backref_id TEXT, 
	editor_preferred_term TEXT, 
	PRIMARY KEY (backref_id, editor_preferred_term), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_OBO_foundry_unique_label" (
	backref_id TEXT, 
	"OBO_foundry_unique_label" TEXT, 
	PRIMARY KEY (backref_id, "OBO_foundry_unique_label"), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_consider" (
	backref_id TEXT, 
	consider TEXT, 
	PRIMARY KEY (backref_id, consider), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_has_alternative_id" (
	backref_id TEXT, 
	has_alternative_id TEXT, 
	PRIMARY KEY (backref_id, has_alternative_id), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_excluded_synonym" (
	backref_id TEXT, 
	excluded_synonym TEXT, 
	PRIMARY KEY (backref_id, excluded_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_creation_date" (
	backref_id TEXT, 
	creation_date TEXT, 
	PRIMARY KEY (backref_id, creation_date), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_contributor" (
	backref_id TEXT, 
	contributor TEXT, 
	PRIMARY KEY (backref_id, contributor), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_creator" (
	backref_id TEXT, 
	creator TEXT, 
	PRIMARY KEY (backref_id, creator), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_date" (
	backref_id TEXT, 
	date TEXT, 
	PRIMARY KEY (backref_id, date), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_editor_note" (
	backref_id TEXT, 
	editor_note TEXT, 
	PRIMARY KEY (backref_id, editor_note), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_term_editor" (
	backref_id TEXT, 
	term_editor TEXT, 
	PRIMARY KEY (backref_id, term_editor), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_definition_source" (
	backref_id TEXT, 
	definition_source TEXT, 
	PRIMARY KEY (backref_id, definition_source), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_term_tracker_item" (
	backref_id TEXT, 
	term_tracker_item TEXT, 
	PRIMARY KEY (backref_id, term_tracker_item), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_database_cross_reference" (
	backref_id TEXT, 
	database_cross_reference TEXT, 
	PRIMARY KEY (backref_id, database_cross_reference), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_has_obo_namespace" (
	backref_id TEXT, 
	has_obo_namespace TEXT, 
	PRIMARY KEY (backref_id, has_obo_namespace), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_conformsTo" (
	backref_id TEXT, 
	"conformsTo" TEXT, 
	PRIMARY KEY (backref_id, "conformsTo"), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_comment" (
	backref_id TEXT, 
	comment TEXT, 
	PRIMARY KEY (backref_id, comment), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_seeAlso" (
	backref_id TEXT, 
	"seeAlso" TEXT, 
	PRIMARY KEY (backref_id, "seeAlso"), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_example_of_usage" (
	backref_id TEXT, 
	example_of_usage TEXT, 
	PRIMARY KEY (backref_id, example_of_usage), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_curator_note" (
	backref_id TEXT, 
	curator_note TEXT, 
	PRIMARY KEY (backref_id, curator_note), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_depicted_by" (
	backref_id TEXT, 
	depicted_by TEXT, 
	PRIMARY KEY (backref_id, depicted_by), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_page" (
	backref_id TEXT, 
	page TEXT, 
	PRIMARY KEY (backref_id, page), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_domain" (
	backref_id TEXT, 
	domain TEXT, 
	PRIMARY KEY (backref_id, domain), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_range" (
	backref_id TEXT, 
	range TEXT, 
	PRIMARY KEY (backref_id, range), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_definition" (
	backref_id TEXT, 
	definition TEXT, 
	PRIMARY KEY (backref_id, definition), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_broadMatch" (
	backref_id TEXT, 
	"broadMatch" TEXT, 
	PRIMARY KEY (backref_id, "broadMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_exactMatch" (
	backref_id TEXT, 
	"exactMatch" TEXT, 
	PRIMARY KEY (backref_id, "exactMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_narrowMatch" (
	backref_id TEXT, 
	"narrowMatch" TEXT, 
	PRIMARY KEY (backref_id, "narrowMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_closeMatch" (
	backref_id TEXT, 
	"closeMatch" TEXT, 
	PRIMARY KEY (backref_id, "closeMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_subClassOf" (
	backref_id TEXT, 
	"subClassOf" TEXT, 
	PRIMARY KEY (backref_id, "subClassOf"), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_shorthand" (
	backref_id TEXT, 
	shorthand TEXT, 
	PRIMARY KEY (backref_id, shorthand), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_equivalentProperty" (
	backref_id TEXT, 
	"equivalentProperty" TEXT, 
	PRIMARY KEY (backref_id, "equivalentProperty"), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_propertyChainAxiom" (
	backref_id TEXT, 
	"propertyChainAxiom" TEXT, 
	PRIMARY KEY (backref_id, "propertyChainAxiom"), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "ObjectProperty_disjointWith" (
	backref_id TEXT, 
	"disjointWith" TEXT, 
	PRIMARY KEY (backref_id, "disjointWith"), 
	FOREIGN KEY(backref_id) REFERENCES "ObjectProperty" (id)
);

CREATE TABLE "TransitiveProperty_type" (
	backref_id TEXT, 
	type TEXT, 
	PRIMARY KEY (backref_id, type), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_has_exact_synonym" (
	backref_id TEXT, 
	has_exact_synonym TEXT, 
	PRIMARY KEY (backref_id, has_exact_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_has_narrow_synonym" (
	backref_id TEXT, 
	has_narrow_synonym TEXT, 
	PRIMARY KEY (backref_id, has_narrow_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_has_broad_synonym" (
	backref_id TEXT, 
	has_broad_synonym TEXT, 
	PRIMARY KEY (backref_id, has_broad_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_has_related_synonym" (
	backref_id TEXT, 
	has_related_synonym TEXT, 
	PRIMARY KEY (backref_id, has_related_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_alternative_term" (
	backref_id TEXT, 
	alternative_term TEXT, 
	PRIMARY KEY (backref_id, alternative_term), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_ISA_alternative_term" (
	backref_id TEXT, 
	"ISA_alternative_term" TEXT, 
	PRIMARY KEY (backref_id, "ISA_alternative_term"), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_IEDB_alternative_term" (
	backref_id TEXT, 
	"IEDB_alternative_term" TEXT, 
	PRIMARY KEY (backref_id, "IEDB_alternative_term"), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_editor_preferred_term" (
	backref_id TEXT, 
	editor_preferred_term TEXT, 
	PRIMARY KEY (backref_id, editor_preferred_term), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_OBO_foundry_unique_label" (
	backref_id TEXT, 
	"OBO_foundry_unique_label" TEXT, 
	PRIMARY KEY (backref_id, "OBO_foundry_unique_label"), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_consider" (
	backref_id TEXT, 
	consider TEXT, 
	PRIMARY KEY (backref_id, consider), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_has_alternative_id" (
	backref_id TEXT, 
	has_alternative_id TEXT, 
	PRIMARY KEY (backref_id, has_alternative_id), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_excluded_synonym" (
	backref_id TEXT, 
	excluded_synonym TEXT, 
	PRIMARY KEY (backref_id, excluded_synonym), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_creation_date" (
	backref_id TEXT, 
	creation_date TEXT, 
	PRIMARY KEY (backref_id, creation_date), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_contributor" (
	backref_id TEXT, 
	contributor TEXT, 
	PRIMARY KEY (backref_id, contributor), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_creator" (
	backref_id TEXT, 
	creator TEXT, 
	PRIMARY KEY (backref_id, creator), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_date" (
	backref_id TEXT, 
	date TEXT, 
	PRIMARY KEY (backref_id, date), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_editor_note" (
	backref_id TEXT, 
	editor_note TEXT, 
	PRIMARY KEY (backref_id, editor_note), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_term_editor" (
	backref_id TEXT, 
	term_editor TEXT, 
	PRIMARY KEY (backref_id, term_editor), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_definition_source" (
	backref_id TEXT, 
	definition_source TEXT, 
	PRIMARY KEY (backref_id, definition_source), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_term_tracker_item" (
	backref_id TEXT, 
	term_tracker_item TEXT, 
	PRIMARY KEY (backref_id, term_tracker_item), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_database_cross_reference" (
	backref_id TEXT, 
	database_cross_reference TEXT, 
	PRIMARY KEY (backref_id, database_cross_reference), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_has_obo_namespace" (
	backref_id TEXT, 
	has_obo_namespace TEXT, 
	PRIMARY KEY (backref_id, has_obo_namespace), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_conformsTo" (
	backref_id TEXT, 
	"conformsTo" TEXT, 
	PRIMARY KEY (backref_id, "conformsTo"), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_comment" (
	backref_id TEXT, 
	comment TEXT, 
	PRIMARY KEY (backref_id, comment), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_seeAlso" (
	backref_id TEXT, 
	"seeAlso" TEXT, 
	PRIMARY KEY (backref_id, "seeAlso"), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_example_of_usage" (
	backref_id TEXT, 
	example_of_usage TEXT, 
	PRIMARY KEY (backref_id, example_of_usage), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_curator_note" (
	backref_id TEXT, 
	curator_note TEXT, 
	PRIMARY KEY (backref_id, curator_note), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_depicted_by" (
	backref_id TEXT, 
	depicted_by TEXT, 
	PRIMARY KEY (backref_id, depicted_by), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_page" (
	backref_id TEXT, 
	page TEXT, 
	PRIMARY KEY (backref_id, page), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_domain" (
	backref_id TEXT, 
	domain TEXT, 
	PRIMARY KEY (backref_id, domain), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_range" (
	backref_id TEXT, 
	range TEXT, 
	PRIMARY KEY (backref_id, range), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_definition" (
	backref_id TEXT, 
	definition TEXT, 
	PRIMARY KEY (backref_id, definition), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_broadMatch" (
	backref_id TEXT, 
	"broadMatch" TEXT, 
	PRIMARY KEY (backref_id, "broadMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_exactMatch" (
	backref_id TEXT, 
	"exactMatch" TEXT, 
	PRIMARY KEY (backref_id, "exactMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_narrowMatch" (
	backref_id TEXT, 
	"narrowMatch" TEXT, 
	PRIMARY KEY (backref_id, "narrowMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_closeMatch" (
	backref_id TEXT, 
	"closeMatch" TEXT, 
	PRIMARY KEY (backref_id, "closeMatch"), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_subClassOf" (
	backref_id TEXT, 
	"subClassOf" TEXT, 
	PRIMARY KEY (backref_id, "subClassOf"), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_shorthand" (
	backref_id TEXT, 
	shorthand TEXT, 
	PRIMARY KEY (backref_id, shorthand), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_equivalentProperty" (
	backref_id TEXT, 
	"equivalentProperty" TEXT, 
	PRIMARY KEY (backref_id, "equivalentProperty"), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_propertyChainAxiom" (
	backref_id TEXT, 
	"propertyChainAxiom" TEXT, 
	PRIMARY KEY (backref_id, "propertyChainAxiom"), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);

CREATE TABLE "TransitiveProperty_disjointWith" (
	backref_id TEXT, 
	"disjointWith" TEXT, 
	PRIMARY KEY (backref_id, "disjointWith"), 
	FOREIGN KEY(backref_id) REFERENCES "TransitiveProperty" (id)
);
