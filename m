Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9831058BBA9
	for <lists+uboot-stm32@lfdr.de>; Sun,  7 Aug 2022 17:47:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D9D1C03FDB;
	Sun,  7 Aug 2022 15:47:26 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 607F4C03FC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Aug 2022 15:47:24 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id s204so7874780oif.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 07 Aug 2022 08:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=X2PuR5PoXnINkRROIScLQGw2r5MpJ2vIH1YRdaGEZ1s=;
 b=d9/nmbrlx5Vz88Du4LOaKnjTQKLrZZH8QTQDBw4YPkV3XKDg0v4RnTsGcFGqrmRue8
 s9vLRE6i4HEQxl05y3HcPOItKwdeeyF1qZkUyGmkve6GvRoR90JlmhDsI/xNeBrWflsK
 0JqpUxE7hgClNUxK4O7kqsyQt3qVlMOS9Kr5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=X2PuR5PoXnINkRROIScLQGw2r5MpJ2vIH1YRdaGEZ1s=;
 b=MP3L0mIi0dv4a/pM+3DzdAGlQgOc/DrqxcT++QzFNwb0Zic89x7HaUJLm4L93KNoZp
 Zk1VGrsTd6r6NMYcCI4YnmQVaZSCTl+4hWvdn9xwpXRHvHzQP6O1ZLXN/GO0le22uuQc
 DpwgjtiAVMECvUqnz5r+BiRd8MztrQwKaT7icn0Csr7WskKKPrRYwBM2hfDipZaISKMG
 4FraKki+oaw7YnvbM/vyFR6RjOvts8UQl+cnK5VYkd5hNDqYtIN6oPtUsOO1XmDRouTN
 ujxO14hxbtFYA8GPrshdLztUnqWXQiN9sEkcozIQyAkpKQHLXviP86r4/zpZxPZdD6At
 TmPg==
X-Gm-Message-State: ACgBeo1lqW1sXEUNyFw3C+s1aSVGDhF5CgQAlCGwunyVsutOoBYzY2A3
 GIw0OR5EHTH6U8B8e+nRDBxifw==
X-Google-Smtp-Source: AA6agR51Kk4V07gNzeGMMtB5gQIFVwxxU94x/bARVu1fakxZhlLojcNSSzzXVHJPXbZ3V6dgqpTo1Q==
X-Received: by 2002:a05:6808:305:b0:33a:e148:bcce with SMTP id
 i5-20020a056808030500b0033ae148bccemr9392637oie.114.1659887243095; 
 Sun, 07 Aug 2022 08:47:23 -0700 (PDT)
Received: from sjg1.roam.corp.google.com
 (c-67-190-102-125.hsd1.co.comcast.net. [67.190.102.125])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a056808131200b0034290c4ed01sm1553412oiv.41.2022.08.07.08.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Aug 2022 08:47:22 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sun,  7 Aug 2022 09:46:45 -0600
Message-Id: <20220807154708.1418967-1-sjg@chromium.org>
X-Mailer: git-send-email 2.37.1.559.g78731f0fdb-goog
MIME-Version: 1.0
Cc: Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@denx.de>,
 Oleksii Bidnichenko <oleksii.bidnichenko@toradex.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Kever Yang <kever.yang@rock-chips.com>, Lukasz Majewski <lukma@denx.de>,
 Gary Bisson <gary.bisson@boundarydevices.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>, Stefan Roese <sr@denx.de>,
 Fabio Estevam <festevam@gmail.com>, Ricardo Salveti <ricardo@foundries.io>,
 Wolfgang Denk <wd@denx.de>, =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>, Mark Kettenis <kettenis@openbsd.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Alexey Brodkin <abrodkin@synopsys.com>, Huang Jianan <jnhuang95@gmail.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Ramon Fried <rfried.dev@gmail.com>,
 Tony Dinh <mibodhi@gmail.com>, Heiko Schocher <hs@denx.de>,
 Marek Vasut <marex@denx.de>, Thomas Huth <thuth@redhat.com>,
 Ye Li <ye.li@nxp.com>, Judy Wang <wangjudy@microsoft.com>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>, Rick Chen <rick@andestech.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Aswath Govindraju <a-govindraju@ti.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>, schspa <schspa@gmail.com>,
 Michal Simek <michal.simek@amd.com>, Denys Drozdov <denys.drozdov@toradex.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Andrew Davis <afd@ti.com>, Anastasiia Lukianenko <vicooodin@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Max Merchel <Max.Merchel@tq-group.com>, TsiChung Liew <Tsi-Chung.Liew@nxp.com>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Artem Lapkin <email2tema@gmail.com>, Andrew Scull <ascull@google.com>
Subject: [Uboot-stm32] [PATCH 00/23] blk: Rationalise the block interface
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

The block interface has two separate implementations, one using driver
model and one not. The latter is really only needed for SPL, where
size constraints allegedly don't allow use of driver model. Of course
we still need space for filesystems and other code, so it isn't clear
that driver model is anything more than the straw that breaks the
camel's back.

The driver model version uses a uclass ID for the interface time, but
converts back and forth between that and if_type, which is the legacy
type.

The HAVE_BLOCK_DEVICE define is mostly a hangover from the old days.
At present its main purpose is to enable the legacy block implementation
in SPL.

Finally the use of 'select' to enable BLK does not work very well. It
causes kconfig errors when another option depends on BLK and it is
not recommended by the kconfig style guide.

This series aims to clean things up:
- Enable BLK based on whether different media types are used, but still
  allow boards to disable it
- Rename HAVE_BLOCK_DEVICE to indicates its real purpose
- Drop if_type and use the uclass instead
- Drop some obsolete if_type values

An issue not resolved by this series is that the sandbox host interface
does not actually have a device. At present it uses the root device, which
was convenience for the driver model conversion but not really correct. It
should be possible to clean this up, in a future series.

Another minor issue is the use of UCLASS_USB for a mass-storage device.
This has been the case for a while and is not addresed by this series,
other than to add a comment.

Note that this test relies on Tom Rini's series to drop various boards
including warp and cm_t335

Finally, a patch is included to make binman put fake files in a
subdirectory, since repeated runs of certain boards can cause unrelated
failues (e.g. chromebook_coral) when fake files are left around.


Simon Glass (23):
  binman: Put fake files in a subdirectory
  disk: Correct help for TPL_PARTITIONS
  blk: Enable CONFIG_BLK for all media
  ata: Fix an instance of SPL_SATA_SUPPORT
  sandbox: Avoid defining HAVE_BLOCK_DEVICE in Konfig
  disk: Use Makefile to omit partition drivers
  blk: Use a function for whether block devices are available
  cmd: Drop use of HAVE_BLOCK_DEVICE
  blk: Drop unnecessary #ifdef in in blk_legacy
  blk: Rename HAVE_BLOCK_DEVICE
  blk: Select SPL_LEGACY_BLOCK automatically
  blk: Drop unnecessary CONFIG_SPL_LEGACY_BLOCK in defconfigs
  blk: Hide the BLK and SPL_LEGACY_BLOCK options
  blk: Drop IF_TYPE_DOC
  ide: Use a flag for an ATAPI device
  blk: Drop IF_TYPE_ATAPI
  blk: Drop IF_TYPE_SD
  blk: Rename var in blk_get_devnum_by_typename()
  blk: Rewrite if_type to name functions
  efi: Correct assumption about if_type
  blk: Switch over to using uclass IDs
  blk: Drop if_type
  blk: Rename if_type to uclass_id

 arch/Kconfig                                  |   1 -
 arch/arm/Kconfig                              |   1 -
 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    |   4 +-
 board/st/common/stm32mp_dfu.c                 |   2 +-
 board/toradex/common/tdx-cfg-block.c          |   4 +-
 cmd/Kconfig                                   |   5 -
 cmd/Makefile                                  |   2 +-
 cmd/bcb.c                                     |   4 +-
 cmd/blk_common.c                              |  18 +-
 cmd/ide.c                                     |   2 +-
 cmd/lsblk.c                                   |   2 +-
 cmd/mmc.c                                     |  10 +-
 cmd/mvebu/bubt.c                              |   2 +-
 cmd/nvme.c                                    |   4 +-
 cmd/pvblock.c                                 |   2 +-
 cmd/sata.c                                    |   4 +-
 cmd/scsi.c                                    |   2 +-
 cmd/usb.c                                     |   2 +-
 cmd/virtio.c                                  |   2 +-
 common/spl/Kconfig                            |   2 -
 common/spl/spl_sata.c                         |   2 +-
 common/spl/spl_usb.c                          |   2 +-
 common/usb_storage.c                          |  10 +-
 configs/M5253DEMO_defconfig                   |   1 +
 configs/axm_defconfig                         |   1 -
 configs/bcm968380gerg_ram_defconfig           |   1 -
 .../gardena-smart-gateway-mt7688_defconfig    |   1 -
 configs/nsim_hs38_defconfig                   |   1 -
 configs/qemu-ppce500_defconfig                |   1 -
 disk/Kconfig                                  |   4 +-
 disk/Makefile                                 |   4 +
 disk/disk-uclass.c                            |  11 +-
 disk/part.c                                   | 156 +++++--------
 disk/part_amiga.c                             |   4 -
 disk/part_dos.c                               |   4 -
 disk/part_efi.c                               |   3 -
 disk/part_iso.c                               |   3 -
 disk/part_mac.c                               |   3 -
 doc/develop/driver-model/migration.rst        |   2 +-
 doc/develop/uefi/uefi.rst                     |   2 +-
 doc/usage/partitions.rst                      |   2 +-
 drivers/Makefile                              |   3 +-
 drivers/ata/Kconfig                           |   4 +-
 drivers/ata/dwc_ahsata.c                      |   2 +-
 drivers/ata/fsl_sata.c                        |   2 +-
 drivers/ata/sata.c                            |   2 +-
 drivers/ata/sata_mv.c                         |   2 +-
 drivers/ata/sata_sil.c                        |   2 +-
 drivers/block/Kconfig                         |  20 +-
 drivers/block/Makefile                        |   2 +-
 drivers/block/blk-uclass.c                    | 219 +++++++++---------
 drivers/block/blk_legacy.c                    |  60 +++--
 drivers/block/efi_blk.c                       |   2 +-
 drivers/block/ide.c                           |  16 +-
 drivers/block/sandbox.c                       |  14 +-
 drivers/dfu/dfu_mmc.c                         |   6 +-
 drivers/mmc/Kconfig                           |   1 -
 drivers/mmc/mmc-uclass.c                      |  12 +-
 drivers/mmc/mmc_legacy.c                      |   8 +-
 drivers/mmc/mmc_write.c                       |   4 +-
 drivers/net/fsl_enetc.c                       |  12 +-
 drivers/net/fsl_enetc.h                       |   2 +-
 drivers/nvme/Kconfig                          |   2 -
 drivers/nvme/nvme.c                           |   2 +-
 drivers/scsi/Kconfig                          |   2 -
 drivers/scsi/scsi.c                           |  12 +-
 drivers/tee/optee/rpmb.c                      |   4 +-
 drivers/virtio/Kconfig                        |   1 -
 drivers/virtio/virtio_blk.c                   |   4 +-
 drivers/xen/Kconfig                           |   1 -
 drivers/xen/pvblock.c                         |   6 +-
 env/mmc.c                                     |   4 +-
 fs/fat/fat.c                                  |   4 +-
 include/blk.h                                 | 141 +++++------
 include/efi_api.h                             |   4 +-
 include/efi_loader.h                          |   4 +-
 include/mmc.h                                 |   2 +-
 lib/efi_driver/efi_block_device.c             |   4 +-
 lib/efi_loader/Kconfig                        |   1 -
 lib/efi_loader/efi_device_path.c              |   2 +-
 lib/efi_loader/efi_device_path_to_text.c      |   4 +-
 lib/efi_loader/efi_disk.c                     |  28 +--
 lib/efi_loader/efi_net.c                      |   2 +-
 lib/efi_loader/efi_var_file.c                 |   4 +-
 test/dm/blk.c                                 |  24 +-
 tools/binman/control.py                       |  10 +-
 tools/binman/entry.py                         |  25 +-
 tools/binman/ftest.py                         |  30 ++-
 88 files changed, 492 insertions(+), 523 deletions(-)

-- 
2.37.1.559.g78731f0fdb-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
