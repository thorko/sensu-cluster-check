release:
	tar czf /tmp/sensu-cluster-check_${VERSION}_linux_amd64.tar.gz bin/ 
	sum=$$(sha512sum /tmp/sensu-cluster-check_${VERSION}_linux_amd64.tar.gz | cut -d ' ' -f 1); \
	f=$$(basename sensu-cluster-check_${VERSION}_linux_amd64.tar.gz); \
	echo $$sum $${f} > /tmp/sensu-cluster-check_${VERSION}_sha512_checksums.txt; \
	echo $$sum;
