echo cool-guy easy tor setup...

function startTor(){
  if ![ -d "./tor" ]
  then
    mkdir ./tor 2> /dev/null
  fi
  tor -f ./.torrc
}

function server(){
  if ![ -d "./package.json" ]
  then
    npm install
  fi
  npm start
}

function run(){
  echo Starting service...
  server & 
  startTor
}

run
