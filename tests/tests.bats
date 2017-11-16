#!/usr/bin/env bats

# =======================================================================
#
# Testing the project
#
# @see https://github.com/sstephenson/bats
# @see https://blog.engineyard.com/2014/bats-test-command-line-tools
#
# =======================================================================

# Test nginx version
@test "Nginx version is ${NGINX_VERSION}" {
	result="$(docker run --entrypoint=/bin/sh ${DOCKER_APP_IMAGE_NAME} -c '/usr/sbin/nginx -v 2>&1')"
	[[ "$result" == *"nginx version: nginx/${NGINX_VERSION}"* ]]
}
