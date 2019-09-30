#!/usr/bin/env bash

main(){
  local version=${1:?Please specify a version to publish}
  rm orb.yml
  circleci config pack src > orb.yml
  circleci orb validate orb.yml

  # git tag "${version}"
  # git push --tags

  circleci orb publish orb.yml "sous-chefs/terraform@${version}"
}

main "$@"
