javac -cp "../lib/java_websocket.jar;C:/lucee/lib/lucee.jar" "com/bonnydoonmedia/io/WSClient.java"
jar -cvfm ../com.bonnydoonmedia.io.jar manifest.mf -C ./ .