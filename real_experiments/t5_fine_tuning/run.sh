#! /bin/bash
set -e

ACQF_ARRAY=(EEIPU EI CArBO EIPS)

c=0
for trial in {1..5}; do
    # for acqf in ${ACQF_ARRAY[@]}; do
        acqf=$1
        data_dir="${2:-./inputs}"
        # ((c+=1))
        cache_root=.cachestore/${acqf}/${RANDOM}_trial_${trial}
        python optimize.py \
            --exp-name t5-pipeline-tuun --trial $trial --cache-root \
            $cache_root --acqf $acqf --data-dir $data_dir && rm -rf $cache_root

        # if [ $(($c%1)) -eq 0 ]; then
        #     wait # Wait for the inner loop to complete before continuing
        # fi
    # done

done

# wait