#!/usr/bin/env nextflow


params.hmmerfile = "/home/drewx/Documents/alm/Peptidase_C14.hmm"
params.queryseqs  = "/home/drewx/Documents/alm/extract_MegaHitX.fasta.fasta"
hmmerfile 	 = Channel.fromPath("params.hmmerfile")
queryseqs 	 = Channel.fromPath("queryseqs")


process hmmsearch{

    echo true
    publishDir path: "$output/multiqc_RawReads", mode: 'move'
    cpus params.ltp_cores
    memory "${params.l_mem} GB"
    input:
	file hmmerfile 
        file queryseqs


"""

    


"""

}
