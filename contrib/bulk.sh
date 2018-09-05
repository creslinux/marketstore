# Automate added more plugin
x=99


stub=binance_usdt_

src_dir=binance_usdt_1
src_src=binance_usdt_1.go
src_so=binance_usdt_1.so

for x in `seq 2 50`
do 
 echo ${x}

 dst_dir=`echo ${src_dir} | sed -e "s/${src_dir}/${stub}${x}/"`
 dst_src=`echo ${src_src} | sed -e "s/${src_src}/${stub}${x}.go/"`

 echo ${dst_dir}
 echo ${dst_src}

 cp -R ${src_dir} ${dst_dir}
 mv ${dst_dir}/${src_src} ${dst_dir}/${dst_src}

 cat ${dst_dir}/Makefile | sed -e  "s/${src_so}/${stub}${x}.so/" > ${dst_dir}/tmp_file
 mv ${dst_dir}/tmp_file ${dst_dir}/Makefile

 cat ../Makefile | sed -e 's/plugins:/plugins:\'$'\nsfglwiiwbqlbwql/' |  sed -e "s/sfglwiiwbqlbwql/        \$(MAKE) -C contrib\/${stub}${x}/" > ../tmp_file
 cat ../tmp_file
 mv ../tmp_file ../Makefile

done

