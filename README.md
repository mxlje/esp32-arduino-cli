# ESP32 Arduino CLI

This is a sample project on how to use the Arduino CLI to compile and upload code to an ESP32
board. It uses the Just task runner to provide a convenient way to run the commands, which
isn’t strictly necessary, but makes it convenient and less error-prone than a Makefile.

Also you can change variables on the fly with CLI flags and such, which is quite nice.

## Prerequisites

- [Arduino CLI](https://github.com/arduino/arduino-cli)
- [Just](https://github.com/casey/just)

## Usage

You don’t need to clone this repo, I suggest you instead copy the `justfile` and adjust it
to your needs. You do however need to install the ESP32 core. You can do that through the
Arduino CLI or use the GUI if you have the Arduino IDE installed.

```bash
$ arduino-cli core update-index
$ arduino-cli core install esp32:esp32
```

Then create a folder for your project with your sketch and the `justfile`. It’s important that
the name of the folder is the same as the name of the sketch, so that the Arduino CLI can
find it. In the case of this example, the folder is called `esp32-arduino-cli` and the sketch
is called `esp32-arduino-cli.ino`.

Then you can run the commands:

```bash
# compile, upload, and connect the serial monitor
$ just

# or run the them individually
$ just build
$ just upload
$ just monitor
$ just info
```

Depending on your shell, Just should also automatically provide tab completions for commands as
well as variables you can change per run.

## Configuration

### Board (FQBN)
Depending on your ESP32 board you may need to adjust the `board` variable in the `justfile`.
I am using the S3 variant, but the "default" (if there is such a thing with all the different
ESP32 variants) is most likely the `esp32:esp32:esp32` variant. I have one of those too and
that’s what works.

### Upload- and Serial Speeds
If you get an error uploading your sketch, try decreasing the `upload_speed` to `460800` (half
the default). The serial monitor speed is most likely fine, but you can also reduce it (just
make sure it matches the value in your sketch when you initialize it). Run `just info` for other
possible values.

### Board Port
Depending on your OS the command to find the port may differ. I suggest you connect
your board and run `ls -l /dev | grep usb` and see what shows up, then adjust the `port`
command accordingly.

### Other Options & Default Values
You can run the following command to see all available build options for your board, their
default values as well as some info about your board. Generally these options are used during
the build step and you can add them to your `justfile`.

```bash
$ just info
```

## License

[Unlicense](https://choosealicense.com/licenses/unlicense/).

Really just do whatever you want with this, it’s just a helpful collection of commands.
If you make improvements and feel like sharing them, you’re welcome to do so through a
pull request.

🖖
