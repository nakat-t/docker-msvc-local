# Supported tags

* `latest`, `2019`

# Introduction

A personal docker image for C/C++ builds with Visual Studio (msvc) and some software added.

# How to use this image

Mount the directory containing your source files on `C:\Data` and run the container.

```
docker run -it --rm -v ${pwd}:C:\Data nakatt/msvc:2019 msbuild.exe foo.sln
```

# Installed components

The installed visual studio build tools include the following components:

* [MSBuild Tools](https://docs.microsoft.com/ja-jp/visualstudio/install/workload-component-id-vs-build-tools?view=vs-2019#msbuild-tools)
* [C++ build tools (Required, Recommended)](https://docs.microsoft.com/ja-jp/visualstudio/install/workload-component-id-vs-build-tools?view=vs-2019#c-build-tools)
