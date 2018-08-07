#! /bin/bash

tmp2=.
ffmpoly2_path=$tmp2/practical_fm/ffmpoly2
ffm_path=$tmp2/practical_fm/libffm
poly2_path=$tmp2/practical_fm/poly2_w_linear

cd $ffmpoly2_path
make & cd - 
cd $ffm_path
make & cd -
cd $poly2_path
make & cd -
wait
ln -s $ffmpoly2_path/ffmpoly2-train
ln -s $ffm_path/ffm-train
ln -s $poly2_path/poly2-train

#Create log folder
for data in ijcnn news20 webspam mnist
do
  for solver in poly2_logs ffmpoly2_logs ffm_logs
  do
    mkdir -p ${solver}/${data}
  done
done