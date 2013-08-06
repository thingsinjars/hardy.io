export REPO="$(pwd | sed s,^/home/travis/build/,,g)"
echo -e "Current Repo:$REPO --- Travis Branch:$TRAVIS_BRANCH"

git config --global user.email "simon@thingsinjars.com"
git config --global user.name "TravisCI"

mkdir $HOME/temp_hardyio
git clone -b gh-pages https://${GH_TOKEN}@github.com/thingsinjars/hardy.io $HOME/temp_hardyio

rm -rf $HOME/temp_hardyio/* > /dev/null

cp -rf dist/* $HOME/temp_hardyio/

cd $HOME/temp_hardyio

git add -f .
git commit -m "Travis build $TRAVIS_BUILD_NUMBER pushed to gh-pages"
git push https://${GH_TOKEN}@github.com/thingsinjars/hardy.io gh-pages > /dev/null