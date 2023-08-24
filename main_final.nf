#!/usr/bin/env nextflow

params.query = "/home/nyasha/Masters/Quality_Control/combined_viruses_with_sampleID/snakemake_and_nextflow/nextflow_tutorial/my_viruses_subset.faa"
params.dbDir = "/home/nyasha/Masters/Quality_Control/combined_viruses_with_sampleID/snakemake_and_nextflow/nextflow_tutorial/nr-fasta_10"

workflow {
def query_ch = Channel.fromPath(params.query)
runBlast(query_ch,params.dbDir)  | view
}

process runBlast {
input:
path query
path dbDir
output:
path "./NyashaBlastTest3.txt"

"""
blastp -num_threads 12 -query $query -db $dbDir/ten_sequences.faa_database -outfmt 5 -out NyashaBlastTest3.txt
"""
}
