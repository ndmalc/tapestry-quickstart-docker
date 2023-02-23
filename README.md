# Tapestry quickstart container
## Description

To ease the testing of Apache Tapestry framework, this project defines Dockerfiles for the standard demo project, Tapestry Quickstart. Image definition supports a wide range of Tapestry 5 versions, offering good legacy support.

As a quick testing solution this project currently supports only Jetty as application server. If a need arises, it could be adapted tu use other technologies.

## Get image from docker hub

From current project, it is possible to directly use docker-compose to start container out of the box.
```
export TAPESTRY_VERSION=5.X.X
# In interactive mode
docker-compose up
# In daemon mode
docker-compose up -d
```
_Note: '5.X.X' replace 'X' by actual Tapestry version number_

To manually run with Docker
```
# In interactive mode
docker run -it --rm ndmalc/tapestry-quickstart:jetty-5.X.X
# In daemon mode
docker run -d -name tapestry-quickstart-1 ndmalc/tapestry-quickstart:jetty-5.X.X
```
_Note: '5.X.X' replace 'X' by actual Tapestry version number_

## To get this repository

```
git clone https://github.com/ndmalc/tapestry-quickstart-docker.git
```

## Build image from scratch

First locate the working directory into the `build` folder.
```
cd build
```

### Build with docker-compose

Before building it is necessary to setup four environment variables: `TAPESTRY_VERSION`, `JDK_VERSION`, `JETTY_VERSION`, `MVN_ARCHETYPE_PLUGIN_VERSION`.
Variables must be set in accordance with the [Tapestry version table](#tapestry-version-table).
```
export TAPESTRY_VERSION=5.X.X
export JDK_VERSION=XX
export JETTY_VERSION=X-X-X
export MVN_ARCHETYPE_PLUGIN_VERSION=X-X-X
```

Build with standard docker-compose command
```
docker compose build --no-cache
```
_Note: `--no-cache` is necessary when multiple versions are compiled. This is necessary to properly support the variabilization of the Dockerfile based on environment variable_

### Build with Docker

```
export TAPESTRY_VERSION=5.X.X
export JDK_VERSION=XX
export JETTY_VERSION=X-X-X
export MVN_ARCHETYPE_PLUGIN_VERSION=X-X-X

docker build -f Dockerfile_jdk_${JDK_VERSION}_jetty_${JETTY_VERSION}_archp_${MVN_ARCHETYPE_PLUGIN_VERSION} --build-arg TAPESTRY_VERSION=${TAPESTRY_VERSION} -t ndmalc/tapestry-quickstart:jetty-${TAPESTRY_VERSION} --no-cache .
```
_Note: Variables must be set in accordance with the [Tapestry version table](#tapestry-version-table)_

_Note: `--no-cache` is necessary when multiple versions are compiled. This is necessary to properly support the variabilization of the Dockerfile based on environment variable_

## Tapestry version table

| Tapestry Version  | Build | JDK Version | Jetty Version | Maven archetype plugin version | Comment |
| ----------------- | ----- | ----------- | ------------- | ------------------------------ | ------- |
5.8.2 | :heavy_check_mark: | 11 | 8-0-0 | 3-2-1 |  |
5.8.1 | :heavy_check_mark: | 11 | 8-0-0 | 3-2-1 |  |
5.8.0 | :heavy_check_mark: | 11 | 8-0-0 | 3-2-1 |  |
5.7.3 | :heavy_check_mark: | 11 | 8-0-0 | 2-4 |  |
5.7.2 | :heavy_check_mark: | 11 | 8-0-0 | 2-4 |  |
5.7.1 | :heavy_check_mark: | 11 | 8-0-0 | 2-4 |  |
5.7.0 | :heavy_check_mark: | 11 | 8-0-0 | 2-4 |  |
5.6.4 | :heavy_check_mark: | 11 | 8-0-0 | 2-4 |  |
5.6.3 | :heavy_check_mark: | 11 | 8-0-0 | 2-4 |  |
5.6.2 | :heavy_check_mark: | 11 | 8-0-0 | 2-4 |  |
5.6.1 | :heavy_check_mark: | 11 | 8-0-0 | 2-4 |  |
5.6.0 | :x: | 11 | 8-0-0 | 2-4 | common-lang breaks the application. v5.6.1 release only fixes the breaking bug of 5.6.1 (https://github.com/apache/tapestry-5/commit/39f534e9507112756ae3512d2bb259dd853384f1) |
5.5.0 | :heavy_check_mark: | 11 | 8-0-0 | 2-4 |  |
5.5.0-beta-3 | :heavy_check_mark: | 11 | 8-0-0 | 2-4 |  |
5.4.5 | :heavy_check_mark: | 11 | 7-6-0 | 2-4 |  |
5.4.4 | :heavy_check_mark: | 11 | 7-6-0 | 2-4 |  |
5.4.3 | :heavy_check_mark: | 11 | 7-6-0 | 2-4 |  |
5.4.2 | :heavy_check_mark: | 11 | 7-6-0 | 2-4 |  |
5.4.1 | :heavy_check_mark: | 11 | 7-6-0 | 2-4 |  |
5.4.0 | :heavy_check_mark: | 11 | 7-6-0 | 2-4 |  |
5.4-rc-1 | :heavy_check_mark: | 11 | 7-6-0 | 2-4 |  |
5.4-beta-35 | :heavy_check_mark: | 11 | 7-6-0 | 2-4 |  |
5.4-beta-26 | :heavy_check_mark: | 11 | 7-6-0 | 2-4 |  |
5.4-beta-22 | :heavy_check_mark: | 11 | 7-6-0 | 2-4 |  |
5.4-beta-6 | :heavy_check_mark: | 11 | 7-6-0 | 2-4 |  |
5.4-beta-3 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.3.8 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.3.7 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.3.6 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.3.5 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.3.4 | :x: | 1-7 | 7-6-0 | 2-4 | tapestry-yuicompressor-5.3.4 declares an invalid dependency with non-existing groupID 'com.google.code.maven-play-plugin.com.yahoo.platform.yui' |
5.3.3 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.3.3-rc-1 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.3.2 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.3.1 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.3 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.2.6 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.2.5 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.2.4 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.2.3-SNAPSHOT | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.2.2 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.2.1 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.2.0 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.1.0.8-SNAPSHOT | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.1.0.7-SNAPSHOT | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.1.0.6-SNAPSHOT | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.1.0.5 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.1.0.4 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.1.0.3 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.1.0.2 | :x: | 1-7 | 7-6-0 | 2-4 | quickstart-5.1.0.2.jar contains a bug in META-INF/maven/archetype-metadata.xml line 54 where directory element is included 2 times |
5.1.0.1 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.1.0.0 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.0.20-SNAPSHOT | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.0.19 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.0.18 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.0.17 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.0.16 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.0.15 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.0.14 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.0.13 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.0.12 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.0.11 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.0.10 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.0.9 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.0.7 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.0.6 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.0.5 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.0.4 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |
5.0.3 | :heavy_check_mark: | 1-7 | 7-6-0 | 2-4 |  |

## Version requirements

| Tapestry Version | Dependency | Dependency Version | Reason |
| ---------------- | ---------- | ------------------ | ------ |
| < 5.4 | JDK | < 1.8 (chosen 1.7) | Apache Tapestry requires Java functions removed after 1.7 |
| >= 5.4 | JDK | >= 1.8 (chosen 11) | Apache Tapestry added support for Java 1.8+. Java 11 chosen for better system dependency |
| < 5.5.0-beta-3 | Jetty | >= 7.6 (chose 7.6.0.v20120127) | First version that offers the `help` parameter. This parameter is used in the Dockerfile to pre-build the Jetty run which allows quick and offline run at container creation time |
| >= 5.5.0-beta-3 | Jetty | >= 8.0 (chosen 8.0.0.v20110901) | First version that supports the servlet 3.0 specification, more specifically, the annotated servlet function which replaces the `web.xml` file |
| >= 5.8 | Maven Archetype Plugin | >= 3.2.1 | Required to support more up to date archetype definition file |

## Development environment

To setup a development environment, follow [this guide](dev/README.md).

## Miscellaneous

As is, various versions of older versions of Apache Tapestry 5 are not behaving nicely with current time situation (dependency versions, artifact repository servers, ...) or are outright bugged from release time. To help those situations, live patching is performed at compilation time based on testing performed at the beginning of 2023.

Used patches are present in `build/patch` and `build/.m2`.

## Links

- https://tapestry.apache.org/
- https://tapestry.apache.org/getting-started.html
- https://github.com/apache/tapestry-5
- https://repository.apache.org/content/groups/public/

## Disclaimer

This project is not related from one way or another to the Apache Tapestry project. The owner of this repository does not own any right on the Apache Tapestry project or Apache Tapestry trademark. This project is just a community project made to help people use in an easy fashion the Apache Tapestry Quickstart project in a variety of Apache Tapestry 5 versions.

## License

[MIT License](https://opensource.org/licenses/MIT) © [ndmalc]