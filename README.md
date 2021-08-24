[![Build Status](https://travis-ci.org/webbreaker/webbreaker.svg?branch=master)](https://travis-ci.org/webbreaker/webbreaker/builds)
[![Release](http://img.shields.io/github/release/webbreaker/webbreaker.svg)](https://github.com/webbreaker/webbreaker/releases/latest)
[![Versions](https://img.shields.io/pypi/pyversions/webinspectapi.svg)](https://img.shields.io/pypi/pyversions/webinspectapi.svg)
[![Open Hub statistics](https://www.openhub.net/p/webbreaker/widgets/project_thin_badge.gif)](https://www.openhub.net/p/webbreaker)

## Introduction

WebBreaker is an open source Dynamic Application Security Test Orchestration (DASTO) client, enabling development teams to create pipelines for security testing and automation of functional security tests, with WebInspect, Fortify SSC, and ThreadFix.

The commands are organized by product followed by actions you want to take on the product accompanied with options.  For example `webbreaker webinspect scan --settings=zerobank`

## Download & Install
 [ ![Download](https://api.bintray.com/packages/webbreaker/webbreaker-cli/webbreaker/images/download.svg) ](https://bintray.com/webbreaker/webbreaker-cli/webbreaker/_latestVersion)

:arrow_down: [Mac OS](https://github.com/webbreaker/webbreaker/releases), Mac installation is available on tap @ [homebrew](https://brew.sh) - COMING SOON

`brew install webbreaker`

:arrow_down: [CentOS/RedHat/Fedora](https://github.com/webbreaker/webbreaker/releases), Linux installation is available @ [artifactory](https://bintray.com/webbreaker/webbreaker-cli/webbreaker/)

`yum install webbreaker`

:arrow_down: [Windows](https://github.com/webbreaker/webbreaker/releases), Windows installation is available @ [Chocolatey](https://chocolatey.org/packages/webbreaker) - BETA

`choco install webbreaker --version=2.2.0`

:arrow_down: [Build and install](https://github.com/webbreaker/webbreaker.git) from source and follow the steps below.

1. ```git clone https://github.com/webbreaker/webbreaker```
1. ```export PATH=$PATH:$PYTHONPATH```
1. ```cd webbreaker;pip install -r requirements.txt```
1. ```python setup.py build```
1. ```python setup.py install```


## Configuration
:white_check_mark: If you have downloaded an executable release of [webbreaker](https://github.com/webbreaker/webbreaker/releases), add it to your $PATH or %PATH%

:white_check_mark: First time installs, run the `webbreaker` command in your terminal to create the default configurations, including the `$HOME/.webbreaker/config.ini`

:white_check_mark: Configure the `$HOME/.webbreaker/config.ini` or `%USERPROFILE%\.webbreaker\config.ini`

```
# Your required Fortify SSC URL and run `webbreaker admin credentials --fortify` 
[fortify]
ssc_url = https://ssc.example.com/ssc
username = 
password = 

# Your ThreadFix URL and ThreadFix API Key
[threadfix]
host = https://threadfix.example.com:8443/threadfix
api_key = <put your threadfix api key here>

# Your Webinspect servers with the REST API port, default is 8083/tcp.
server_01 = https://webinspect-1.example.com:8083
server_02 = https://webinspect-2.example.com:8083
endpoint_01 = %(server_01)s|%(large_server_max_concurrent_scans)s
endpoint_02 = %(server_01)s|%(small_server_max_concurrent_scans)s
```
**NOTES:**
* If you are using WebInspect turn-on your [WebInspect API Service](https://software.microfocus.com/en-us/software/webinspect).  

## Release Notes

New Features, bugs and enhancements for this release are documented in our [WebBreaker Release Notes](docs/release.md)

## Usage

WebBreaker is a command-line interface (CLI) client.

Illustrated below is an example of a typical WebBreaker WebInspect scanning workflow from creation to triage.  Please see the [WebBreaker Cheatsheet](docs/cheatsheet.md) for further examples.

1. Starting WebInspect Proxy  
`webbreaker webinspect proxy --start --port=9001 --proxy_name=WEBINSPECT_SCAN_NAME`

1. Stopping WebInspect Proxy  
`webbreaker webinspect proxy --stop --proxy_name=WEBINSPECT_SCAN_NAME`

1. WebInspect Scanning from Proxy Results  
`webbreaker webinspect scan --settings=$WEBINSPECT_SCAN_NAME.xml --scan_name=WEBINSPECT_SCAN_NAME`

1. Uploading Scan Results to Threadfix  
`webbreaker threadfix upload --application WEBINSPECT --scan_file WEBINSPECT_SCAN_NAME.xml`

1. Uploading Scan Results to Fortify SSC  
`webbreaker fortify upload --version $WEBINSPECT_SCAN_NAME --scan_name $WEBINSPECT_SCAN_NAME`

1. Running scans in Jenkins

```
# scan
webbreaker webinspect scan --settings zerobank --scan_name ${BUILD_TAG}
# upload scan to Fortify SSC
webbreaker fortify upload --scan_name ${BUILD_TAG} --version ${JOB_NAME}
# upload scan to ThreadFix
webbreaker threadfix upload --scan_name ${BUILD_TAG} --application ${JOB_NAME}
```

## Bugs and Feature Requests

Found something that doesn't seem right or have a feature request? [Please open a new issue](https://github.com/webbreaker/webbreaker/issues/new/).

## Copyright and License

[![license](https://img.shields.io/github/license/webbreaker/webbreaker.svg?style=flat-square)](https://github.com/webbreaker/webbreaker/blob/master/LICENSE.txt)

Copyright 2018 Target Brands, Inc.

