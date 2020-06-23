module load perl/5.22.2
module load gcc/5.4.0
module load python/3.6

cd /home/vincenth/projects/def-jinguo/vincenth
cpan XML::DOM

cd ${ROUGE}/data/WordNet-2.0-Exceptions/
./buildExeptionDB.pl . exc WordNet-2.0.exc.db

cd ${ROUGE}
./runROUGE-test.pl

cd ../../
source .venv/bin/activate

cd pyrouge/
pyrouge_set_rouge_path ${ROUGE}
python -m pyrouge.test


