#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/shibin1995/Documents/final_ws/src/dynamixel_motor/dynamixel_driver"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/shibin1995/Documents/final_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/shibin1995/Documents/final_ws/install/lib/python2.7/dist-packages:/home/shibin1995/Documents/final_ws/build/dynamixel_driver/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/shibin1995/Documents/final_ws/build/dynamixel_driver" \
    "/usr/bin/python2" \
    "/home/shibin1995/Documents/final_ws/src/dynamixel_motor/dynamixel_driver/setup.py" \
     \
    build --build-base "/home/shibin1995/Documents/final_ws/build/dynamixel_driver" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/shibin1995/Documents/final_ws/install" --install-scripts="/home/shibin1995/Documents/final_ws/install/bin"
