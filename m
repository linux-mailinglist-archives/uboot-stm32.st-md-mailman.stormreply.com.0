Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93620661F65
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jan 2023 08:43:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34695C65E4C;
	Mon,  9 Jan 2023 07:43:56 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 936E1C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Jan 2023 10:07:40 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id lc27so3948259ejc.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 08 Jan 2023 02:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4Ls8Oyt5zShYmiXI6PjuP0n3sP1QrFKY5o2LmwvADNk=;
 b=hrf3a0T5Kd3yYDtTUXO89vuskZsEJb4BTMW+JMYSywRDF77CQhsKdcacER8G2b9F4R
 NX+elzVTjfr6f5wE0IMN9u7EmxT/pBC/HvLwrzbFkepAkSZYcHDwyMP9HttIVAjhlMIo
 3ezy0HhH+Ffv9XqGdKAQetREpsVq78e1NMQKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Ls8Oyt5zShYmiXI6PjuP0n3sP1QrFKY5o2LmwvADNk=;
 b=kZyoyT4XzvAwcFhaRLiT/iluK+/y4TdgCZesutKkbXZL8/UzgQ3kskdQhFgUlX6zP9
 oAHmtMVKZIqrtBD9nFFYx2oFSL2k88Gp1DWotizyNP2OSethO7spGHk/lDUJ6apNJQly
 LEllpH93rbXdnn5h8UBgG9WIEKEs1v0cwD30FkUZMrirAO6FYMM4HnzACl6k24dTu/cr
 Y+fZdwO/iX3jrf5N053IjvNKHzdyM3TPs/QIcm8b/W0aAmh+gbx6enJAVkFkfOpi4ZGg
 SyuyzASXjdaIJm99aGQSuVTvuawSjZM0zLG9tuiA5QlJ/DMWrcHJDjg+rujCUFFcHwc9
 xvzA==
X-Gm-Message-State: AFqh2koeNWD5WOLXX0x5KNpt2hgaKJnfzQILtSn2LHeO7ZM29Wi7HpdS
 h/pK2o6+FlT6SuPp+S3aZwG2Bg==
X-Google-Smtp-Source: AMrXdXtehnKPdR2kZncl/FSUwl+XEKx/rz4mrsZ6d8EqFboBHtGoM0rkkGp/JlTJBQ3qb0FWGxROFw==
X-Received: by 2002:a17:906:71b:b0:7c1:9462:2dd3 with SMTP id
 y27-20020a170906071b00b007c194622dd3mr50877407ejb.70.1673172460035; 
 Sun, 08 Jan 2023 02:07:40 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-180-23-57.retail.telecomitalia.it. [80.180.23.57])
 by smtp.gmail.com with ESMTPSA id
 fu17-20020a170907b01100b0084c723b4c40sm2364097ejc.103.2023.01.08.02.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 02:07:39 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  8 Jan 2023 11:07:35 +0100
Message-Id: <20230108100735.3684180-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Jan 2023 07:43:55 +0000
Cc: Vikas Manocha <vikas.manocha@st.com>, Simon Glass <sjg@chromium.org>,
 Kamil Lulko <kamil.lulko@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Soeren Moch <smoch@web.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH] doc: fix references to distro documentation
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
---

 doc/README.gpt                   | 2 +-
 doc/README.uniphier              | 2 +-
 doc/board/emulation/qemu-x86.rst | 2 +-
 doc/board/st/stm32mp1.rst        | 2 +-
 doc/board/tbs/tbs2910.rst        | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

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
index db842f2ece6e..e605ae3ab32e 100644
--- a/doc/board/emulation/qemu-x86.rst
+++ b/doc/board/emulation/qemu-x86.rst
@@ -57,7 +57,7 @@ to instantiate. Note, the maximum supported CPU number in QEMU is 255.
 U-Boot uses 'distro_bootcmd' by default when booting on x86 QEMU. This tries to
 load a boot script, kernel, and ramdisk from several different interfaces. For
 the default boot order, see 'qemu-x86.h'. For more information, see
-'README.distro'. Most Linux distros can be booted by writing a uboot script.
+'distro.rst'. Most Linux distros can be booted by writing a uboot script.
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
index e97f2b6e6135..4760922a93e6 100644
--- a/doc/board/tbs/tbs2910.rst
+++ b/doc/board/tbs/tbs2910.rst
@@ -181,7 +181,7 @@ If that fails it will then try to boot from several interfaces using
 'distro_bootcmd': It will first try to boot from the microSD slot, then the
 SD slot, then the internal eMMC, then the SATA interface and finally the USB
 interface. For more information on how to configure your distribution to boot,
-see 'README.distro'.
+see 'distro.rst'.
 
 Links:
 ------
-- 
2.32.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
