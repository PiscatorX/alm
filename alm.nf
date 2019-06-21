#!/usr/bin/env nextflow

params.hmmerfile  = "/home/drewx/Documents/alm/Peptidase_C14.hmm"
params.queryfile  = "/home/drewx/Documents/alm/DDMegaHitSHB.fasta"
hmmerfile 	  = Channel.fromPath(params.hmmerfile)
queryfile 	  = Channel.fromPath(params.queryfile)
params.output     = "${PWD}/hmmer.Out" 
output 		  =  params.output

process hmmsearch{

    echo true
    publishDir path: output, mode: 'move'
    cpus params.htp_cores
    memory "${params.l_mem} GB"
    input:
	file hmmerfile 
        file queryfile

    output:
        file("${out_basename}.*")        

    script:
         out_basename =  "${queryfile.baseName}"

	
"""
  
   hmmsearch \
       --cpu ${params.htp_cores} \
       -o ${out_basename}.out \
       -A ${out_basename}.aln \
       --tblout ${out_basename}.tblout \
       --noali \
       -E 0.01 \
       ${hmmerfile} \
       ${queryfile}

"""

}



    