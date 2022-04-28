ls -d */ | xargs -I {} bash -c "cd '{}' && samtools sort -@ 25 -m 4G *genomic.gdc_realn.bam -o sorted_genomic.gdc_realn.bam"