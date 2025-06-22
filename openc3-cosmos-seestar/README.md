# OpenC3 COSMOS Seestar Plugin

See the [OpenC3 documentation](https://docs.openc3.com) for all things OpenC3.

## Building non-tool / widget plugins

1. `../openc3.sh cli rake build VERSION=x.y.z` (or `openc3.bat` for Windows)
   - VERSION is required
   - gem file will be built locally

## Building tool / widget plugins using a local Ruby/Node/Yarn/Rake Environment

1. yarn
2. rake build VERSION=x.y.z

## Building tool / widget plugins using Docker and the openc3-node container

If you don’t have a local node environment, you can use the openc3-node container to build custom tools and custom widgets

Mac / Linux:

```
docker run -it -v `pwd`:/openc3/local:z -w /openc3/local docker.io/openc3inc/openc3-node sh
```

Windows:

```
docker run -it -v %cd%:/openc3/local -w /openc3/local docker.io/openc3inc/openc3-node sh
```

1. yarn
2. rake build VERSION=x.y.z

## Installing into OpenC3 COSMOS

1. `../openc3.sh cli load <plugin>.gem`, substituting in the name of an existing .gem plugin file.

## License

This plugin is released under the MIT License. See [LICENSE.txt](LICENSE.txt)
