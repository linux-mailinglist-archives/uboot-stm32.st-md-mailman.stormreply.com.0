Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E390C5909E9
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Aug 2022 03:35:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A92D8C57183;
	Fri, 12 Aug 2022 01:35:12 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E299C04004
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Aug 2022 01:35:11 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id u9so23307675oiv.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Aug 2022 18:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=MYo6eSYbxYrhLPVhrXdnIpXPyko7GmUVyLIFUg0IT44=;
 b=Fo3T8NFzuY8D6W56FXTm6/86qbXMz/+Ia6kirn6KfFh6S4fyAntQdo760LTGW3h+J7
 F/FaLKx70sQ5PXaPZNmJZ6GdA+Pa2BrSwhrtFexjW/xuOeCP2JsKRPvL2FIFgVMsxj8D
 hcCop9ew5t64xgk8qqagGCguJJ/V6+0lcOcAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=MYo6eSYbxYrhLPVhrXdnIpXPyko7GmUVyLIFUg0IT44=;
 b=FLyfS2F2D1DHI7sRtjZzybiRCUYuDYvqNnA0k+LnoYEu3o+xHdSTHj4gh8B0VHg0DT
 9M6i55y0XQ28J+LxL1FcUfjC3niWjkOxve16SH7hd4AoWjklNwu6AlDpFC6xIZJQEs0Q
 pwvip9761LG1CAIpcYzVJ/+wVIwKh/1NBQdvDjjxycf3QvR1RLN/lFWd8aAHI6TqslQi
 0ols/cAE59ljPfEhJj+NqtVVD8hj3OJiwzaGqE0MqeWMsvq7mm/0Fe6rtmdJv8dkjuiT
 vFxl2xRx5cWCTJfnuQis9hDw9Q4HbIDyJN7aU999Ql4PSlxPM0V1vyI1Pfef2wE5QaM4
 nUrQ==
X-Gm-Message-State: ACgBeo01X4kMjsxxAYATBIer67cPp5ni9qxhq4RpM/4Gpx/o64QKLOvN
 /fqLmHMLNTMc/THu50nip1unfg==
X-Google-Smtp-Source: AA6agR64npv084ccFv8WqzE7gIg1ORrfoy58zWJnmqMNkzlsUMaO7JQ+yVKT7egs1k9Gj2992Xqx2w==
X-Received: by 2002:a05:6808:1717:b0:334:9342:63f1 with SMTP id
 bc23-20020a056808171700b00334934263f1mr4648918oib.77.1660268110420; 
 Thu, 11 Aug 2022 18:35:10 -0700 (PDT)
Received: from sjg1.roam.corp.google.com
 (c-67-190-102-125.hsd1.co.comcast.net. [67.190.102.125])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056870b41500b0010c5005d427sm158518oap.33.2022.08.11.18.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 18:35:09 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Thu, 11 Aug 2022 19:34:39 -0600
Message-Id: <20220812013503.1724919-1-sjg@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
MIME-Version: 1.0
Cc: Peng Fan <peng.fan@nxp.com>,
 Oleksii Bidnichenko <oleksii.bidnichenko@toradex.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Rick Chen <rick@andestech.com>,
 Lukasz Majewski <lukma@denx.de>, Gary Bisson <gary.bisson@boundarydevices.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>, Stefan Roese <sr@denx.de>,
 Wolfgang Denk <wd@denx.de>, =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>, Mark Kettenis <kettenis@openbsd.org>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Alexey Brodkin <abrodkin@synopsys.com>, Huang Jianan <jnhuang95@gmail.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ricardo Salveti <ricardo@foundries.io>, Ramon Fried <rfried.dev@gmail.com>,
 Tony Dinh <mibodhi@gmail.com>, Heiko Schocher <hs@denx.de>,
 Marek Vasut <marex@denx.de>, Ye Li <ye.li@nxp.com>,
 Judy Wang <wangjudy@microsoft.com>, Bharat Gooty <bharat.gooty@broadcom.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
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
 Jens Wiklander <jens.wiklander@linaro.org>, Andrew Scull <ascull@google.com>
Subject: [Uboot-stm32] [PATCH v2 00/24] blk: Rationalise the block interface
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

Changes in v2:
- Update commit message
- Fix SPL_PARTITIONS too
- Add SATA also
- Refer to a suffix, not a prefix
- Add new patch to handle UCLASS_EFI_MEDIA in dev_print()
- Add new patch to drop ifname field from struct efi_disk_obj
- Use conv_uclass_id() instead of the confusing uclass_id_to_uclass_id()

Simon Glass (24):
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
  disk: Handle UCLASS_EFI_MEDIA in dev_print()
  blk: Drop if_type
  efi: Drop ifname field from struct efi_disk_obj
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
 disk/Kconfig                                  |   8 +-
 disk/Makefile                                 |   4 +
 disk/disk-uclass.c                            |  11 +-
 disk/part.c                                   | 161 ++++++-------
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
 lib/efi_loader/efi_disk.c                     |  28 ++-
 lib/efi_loader/efi_net.c                      |   2 +-
 lib/efi_loader/efi_var_file.c                 |   4 +-
 test/dm/blk.c                                 |  24 +-
 85 files changed, 444 insertions(+), 515 deletions(-)

-- 
2.37.1.595.g718a3a8f04-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
