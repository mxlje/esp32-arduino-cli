board            := "esp32:esp32:esp32s3"
monitor_speed    := "115200"
upload_speed     := "921600"
flash_size       := "16M"
cpu_freq         := "240"
partition_scheme := "app3M_fat9M_16MB"
port             := shell("ls /dev/cu.usb* | head -n1")
path             := "."

run: build upload monitor

alias b := build
build:
  arduino-cli compile \
    --fqbn {{board}} \
    --board-options "FlashSize={{flash_size}}" \
    --board-options "PartitionScheme={{partition_scheme}}" \
    --board-options "CPUFreq={{cpu_freq}}" \
    {{path}}

alias u := upload
upload:
  arduino-cli upload \
    --port {{port}} \
    --fqbn {{board}} \
    --board-options "UploadSpeed={{upload_speed}}" \
    {{path}}

alias m := monitor
monitor:
  arduino-cli monitor \
    --config baudrate={{monitor_speed}} \
    --port {{port}} \
    --fqbn {{board}} \
    {{path}}

alias i := info
info:
  arduino-cli board details --fqbn {{board}}
