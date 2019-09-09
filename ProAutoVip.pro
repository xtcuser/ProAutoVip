TEMPLATE = subdirs

SUBDIRS += \
    AutoUpdater2 \
    autovip_ls \
    VirtualResponder \
    AutoUpdater \  
    ServiceManager \
    tools/before \
    tools/after

target.path = /home/root/autovip
INSTALLS += target
