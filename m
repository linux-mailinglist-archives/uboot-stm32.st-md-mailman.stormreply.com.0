Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DAE5BB8E5
	for <lists+uboot-stm32@lfdr.de>; Sat, 17 Sep 2022 17:00:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05715C03FC6;
	Sat, 17 Sep 2022 15:00:16 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCB37C035A5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Sep 2022 15:00:14 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id m130so9528909oif.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Sep 2022 08:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=grooLw9NZ8njAUE6awvEUwW59AHiWtA7JXXWh941zXY=;
 b=J5g1Yjlq0BJ+AzCQJFE+ArEwzJLC2BLaRXs62KaarS61Lo+aifIV1eKoG/kpMBgE0D
 D/U9nV03r0A5WDLompqKWtxS/7AmnsTc1FFrvEGAeO05aW6ayxhuSGtlpiKEH8N3Rplz
 WndmB8LMwR4AMgGrXGOBn1gpeiXDQ2ACrcLxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=grooLw9NZ8njAUE6awvEUwW59AHiWtA7JXXWh941zXY=;
 b=eZLzdSyp0BHu42JS0IfIbsPrllSbUEAR8KbiMECRYA8gLWqnA6MYEFp/NjpU9R91zM
 BxD+UolCI0rFWatVskNqd4Lla601cOa5N6I3WvTponoVLghbNgUHzkg6HSpzbjdQdxm5
 P1kiMK4bVsTFjfnmQyLba6oaNd4Mi/Spy3y3YF2A3gy2Pm8gHlZsIe7JzQVJ5tJhRDr7
 96fnII3rkAsrz8zjVnxBGOoK9i3IdrUOMWtkAfsuov4bj4zgN97bCM++6vG/na5Gx3x9
 p3i6gI/uoDAuhazRZZJGyztPi8CwZytnPjVO+7yudCBJCW9NppjCwi2JAxOIACb08dhM
 Hz7g==
X-Gm-Message-State: ACgBeo18+7stg4prRE7uBSJtmsyOiqg4JsnfwMS/RBtRxHU0IYcyrlb6
 BU9rZDt2bQMINQFxYd/EYkFbjg==
X-Google-Smtp-Source: AA6agR52C2o32A3MmQIqXzVCkQvln/figcIOhz4wWqE1UKcunYsf+GZVHPn4q+QbmM+UETEkGgTMiQ==
X-Received: by 2002:a05:6808:13c9:b0:350:109d:4916 with SMTP id
 d9-20020a05680813c900b00350109d4916mr7705353oiw.97.1663426813657; 
 Sat, 17 Sep 2022 08:00:13 -0700 (PDT)
Received: from sjg1.roam.corp.google.com
 (c-67-190-102-125.hsd1.co.comcast.net. [67.190.102.125])
 by smtp.gmail.com with ESMTPSA id
 t190-20020acaaac7000000b003458d346a60sm10462845oie.25.2022.09.17.08.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 08:00:13 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sat, 17 Sep 2022 09:00:08 -0600
Message-Id: <20220917150009.91460-1-sjg@chromium.org>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
MIME-Version: 1.0
Cc: Peng Fan <peng.fan@nxp.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Oleksii Bidnichenko <oleksii.bidnichenko@toradex.com>,
 Gary Bisson <gary.bisson@boundarydevices.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>, Stefan Roese <sr@denx.de>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>, Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Lukasz Majewski <lukma@denx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ricardo Salveti <ricardo@foundries.io>, Ramon Fried <rfried.dev@gmail.com>,
 Marek Vasut <marex@denx.de>, schspa <schspa@gmail.com>,
 Max Merchel <Max.Merchel@tq-group.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH v4 0/1] blk: Rationalise the block interface
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

Changes in v4:
- Fix comments from Takahiro Akashi missed on the previous revision

Changes in v3:
- Drop previously applied patches
- Rebase on -next after EFI changes

Changes in v2:
- Use conv_uclass_id() instead of the confusing uclass_id_to_uclass_id()

Simon Glass (1):
  blk: Rename if_type to uclass_id

 board/st/common/stm32mp_dfu.c |   2 +-
 cmd/bcb.c                     |   4 +-
 cmd/blk_common.c              |  18 ++---
 cmd/lsblk.c                   |   2 +-
 cmd/mmc.c                     |   4 +-
 common/spl/spl_sata.c         |   2 +-
 common/spl/spl_usb.c          |   2 +-
 common/usb_storage.c          |   6 +-
 disk/disk-uclass.c            |   8 +-
 disk/part.c                   |  14 ++--
 doc/usage/partitions.rst      |   2 +-
 drivers/ata/sata.c            |   2 +-
 drivers/block/blk-uclass.c    | 145 +++++++++++++++++-----------------
 drivers/block/blk_legacy.c    |  58 +++++++-------
 drivers/block/ide.c           |   8 +-
 drivers/block/sandbox.c       |   8 +-
 drivers/mmc/mmc-uclass.c      |   2 +-
 drivers/mmc/mmc_legacy.c      |   8 +-
 drivers/net/fsl_enetc.c       |  12 +--
 drivers/net/fsl_enetc.h       |   2 +-
 drivers/scsi/scsi.c           |   6 +-
 drivers/virtio/virtio_blk.c   |   2 +-
 drivers/xen/pvblock.c         |   2 +-
 fs/fat/fat.c                  |   2 +-
 include/blk.h                 | 122 ++++++++++++++--------------
 include/efi_loader.h          |   4 +-
 lib/efi_loader/efi_disk.c     |  12 +--
 lib/efi_loader/efi_var_file.c |   4 +-
 28 files changed, 231 insertions(+), 232 deletions(-)

-- 
2.37.3.968.ga6b4b080e4-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
