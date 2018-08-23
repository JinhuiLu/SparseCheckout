#!/bin/sh

UPDATE=${1}
RESPOSITORY_PATH=${2}
REMOTE_URL=${3}
COMMIT_BRANCH=${4}
CHECKOUT_LIST=${@:5:$#-4}

cd "${RESPOSITORY_PATH}"

git config --global core.sparseCheckout true

if [ ! -d ".git" ]; then
    git init
    git remote add origin "${REMOTE_URL}"
    for i in ${CHECKOUT_LIST}; do
        echo ${i} >> ".git/info/sparse-checkout"
    done
    git pull origin "${COMMIT_BRANCH}" --depth=1
else
	for i in ${CHECKOUT_LIST}; do
		if [[ `grep -c ${i} ".git/info/sparse-checkout"` -eq '0' ]]; then
			echo ${i} >> ".git/info/sparse-checkout"
		else
			echo "Found! ${i}"
		fi
	done
fi

if [[ ${UPDATE} = "ture" ]]; then
    git pull origin "${COMMIT_BRANCH}" --depth=1
fi

git checkout -qf master
