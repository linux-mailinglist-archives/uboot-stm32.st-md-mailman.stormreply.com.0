Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 965E46624B0
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jan 2023 12:52:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36C2EC65E4C;
	Mon,  9 Jan 2023 11:52:45 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69A9AC65048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jan 2023 11:52:44 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id cf18so13074740ejb.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Jan 2023 03:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sutRRWuvFcSn5Sj7C/DK95Xhm4BZPTANyXSBpwIeh6E=;
 b=jBsXZwWxjtLRycN8JFK4EbiRy0vafBNWUd33q4kzTnnYnZ6ZIkrlF5Hs9trmomLfkm
 9SIhD3e/plPqTUFB9q9EwjU3WF9mi//qomE41/hiJfR3Ad4Ux7481mgMMbmqhHo7EhGe
 YzszNI+9DWS/69x0t4M6vlLPgBqsrLl3Req/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sutRRWuvFcSn5Sj7C/DK95Xhm4BZPTANyXSBpwIeh6E=;
 b=abOSe98B3iDLEs3o8BYYj0cOl810zcdYzIQ7NYTGNhOMnhNiw3oJkB0AOIjRtsHwEr
 2UrYR6W8+mHZ/RKhRv+3qYqyPbuvoX8+URh9Qa2UKWkB3actULOwt/jBNxOKumK/k52s
 H4gPaKHa6SIkxSTwDQEa6QI4tNgDblFXSUX++oC4f2h8rgAUOISjtPUVEQGL7Gle8870
 FVxxPEa720uHtA1YmYwQ5/X4Ok8vSvlzVB//KhqTicQnkAU4UTyJQcMCyX+3kpznRvMW
 hCj9CuvUykopbNqLTagOyxLVxAPzZVqVJ5EgA7JuzfpXvnnMFZ4dt8TB3K25t+dhmPso
 72uA==
X-Gm-Message-State: AFqh2kqkgvK30ACH2iBpktPS3faEOAJci6IofFUOZd5J7kUyMoAtjfAN
 oZ5WbDVfo0b5ex/i204jSMektQ==
X-Google-Smtp-Source: AMrXdXvMBZwIS3WPjJdvK9OwxY9j5Xt5/h680Pd/5AJYYXQhLfpzPDqVTQ9ORscxAw4/Nbnllp//Vg==
X-Received: by 2002:a17:906:c24f:b0:7c0:efb9:bc0e with SMTP id
 bl15-20020a170906c24f00b007c0efb9bc0emr50564036ejb.62.1673265163862; 
 Mon, 09 Jan 2023 03:52:43 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (mob-5-90-73-100.net.vodafone.it. [5.90.73.100])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a1709060cca00b0082ddfb47d06sm3673195ejh.148.2023.01.09.03.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 03:52:43 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon,  9 Jan 2023 12:52:40 +0100
Message-Id: <20230109115240.85696-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Vikas Manocha <vikas.manocha@st.com>, Simon Glass <sjg@chromium.org>,
 Kamil Lulko <kamil.lulko@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Soeren Moch <smoch@web.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v2] doc: fix references to distro documentation
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

Commit 37c5195dfcd157 ("doc: Move distro boot doc to rST") renamed
doc/README.distro to doc/develop/distro.rst.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

Changes in v2:
- Change 'distro.rst' to 'doc/develop/distro.rst' also for
  doc/board/emulation/qemu-x86.rst and doc/board/tbs/tbs2910.rst files.
- Add 'Reviewed-by' tag of Patrice Chotard.

 doc/README.gpt                   | 2 +-
 doc/README.uniphier              | 2 +-
 doc/board/emulation/qemu-x86.rst | 3 ++-
 doc/board/st/stm32mp1.rst        | 2 +-
 doc/board/tbs/tbs2910.rst        | 2 +-
 5 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/doc/README.gpt b/doc/README.gpt
index 91e397d06f88..394cea0aa875 100644
--- a/doc/README.gpt
+++ b/doc/README.gpt
@@ -177,7 +177,7 @@ To restore GUID partition table one needs to:
      "name=u-boot,size=60MiB;name=boot,size=60Mib,bootable;name=rootfs,size=0"
    It can be used to locate bootable disks with command
    "part list <interface> <dev> -bootable <varname>",
-   please check out doc/README.distro for use.
+   please check out doc/develop/distro.rst for use.
 
 2. Define 'CONFIG_EFI_PARTITION' and 'CONFIG_CMD_GPT'
 
diff --git a/doc/README.uniphier b/doc/README.uniphier
index badfacd66aa5..af746f6c316e 100644
--- a/doc/README.uniphier
+++ b/doc/README.uniphier
@@ -336,7 +336,7 @@ Deployment for Distro Boot
 --------------------------
 
 UniPhier SoC family boot the kernel in a generic manner as described in
-doc/README.distro .
+doc/develop/distro.rst.
 
 To boot the kernel, you need to deploy necesssary components to a file
 system on one of your block devices (eMMC, NAND, USB drive, etc.).
diff --git a/doc/board/emulation/qemu-x86.rst b/doc/board/emulation/qemu-x86.rst
index db842f2ece6e..e7dd4e994d38 100644
--- a/doc/board/emulation/qemu-x86.rst
+++ b/doc/board/emulation/qemu-x86.rst
@@ -57,7 +57,8 @@ to instantiate. Note, the maximum supported CPU number in QEMU is 255.
 U-Boot uses 'distro_bootcmd' by default when booting on x86 QEMU. This tries to
 load a boot script, kernel, and ramdisk from several different interfaces. For
 the default boot order, see 'qemu-x86.h'. For more information, see
-'README.distro'. Most Linux distros can be booted by writing a uboot script.
+'doc/develop/distro.rst'. Most Linux distros can be booted by writing a uboot
+script.
 For example, Debian (stretch) can be booted by creating a script file named
 'boot.txt' with the contents::
 
diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
index 3759df353ee5..0dcc6b783b89 100644
--- a/doc/board/st/stm32mp1.rst
+++ b/doc/board/st/stm32mp1.rst
@@ -478,7 +478,7 @@ or:
   +-------+--------+---------+------------------------+------------------------+
 
 And the 4th partition (Rootfs) is marked bootable with a file extlinux.conf
-following the Generic Distribution feature (doc/README.distro for use).
+following the Generic Distribution feature (doc/develop/distro.rst for use).
 
 The size of fip or ssbl partition must be enough for the associated binary file,
 4MB and 2MB are default values.
diff --git a/doc/board/tbs/tbs2910.rst b/doc/board/tbs/tbs2910.rst
index e97f2b6e6135..9d4be61783ed 100644
--- a/doc/board/tbs/tbs2910.rst
+++ b/doc/board/tbs/tbs2910.rst
@@ -181,7 +181,7 @@ If that fails it will then try to boot from several interfaces using
 'distro_bootcmd': It will first try to boot from the microSD slot, then the
 SD slot, then the internal eMMC, then the SATA interface and finally the USB
 interface. For more information on how to configure your distribution to boot,
-see 'README.distro'.
+see 'doc/develop/distro.rst'.
 
 Links:
 ------
-- 
2.32.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
