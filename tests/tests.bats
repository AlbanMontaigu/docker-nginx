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
@test "Terraform version is ${NGINX_VERSION}" {
	result="$(docker run ${DOCKER_APP_IMAGE_NAME} version)"
	[[ "$result" == *"Terraform v${NGINX_VERSION}"* ]]
}
