## GraalVM Native Support

This project has been configured to let you generate either a lightweight container or a native executable.

### Lightweight Container with Cloud Native Buildpacks For Targetted Linux Server
Docker should be installed and configured on your machine prior to creating the image.

To create the image, run the following goal:

```
$ docker compose build
```

Then, you can run the app like any other container:

```
$ docker compose up
```


### Building Windows Executable
If you are doing this on local Windows machine for testing purpose

```
Install GraalVM on local, https://www.graalvm.org/downloads/
```

```
Install Visual Studio on local, require the Visual C++ build tools for specific tasks, particularly if you're compiling Java code that interacts with native code.  https://visualstudio.microsoft.com/downloads.  Ensure that you include the "Desktop development with C++" workload. This will install the necessary tools, including vcvarsall.bat
```


```
$ mvnw native:compile -Pnative
```

```
native image will built in within ./target folder as Demo.exe, just run this executable to start up the Spring Boot application.
```

