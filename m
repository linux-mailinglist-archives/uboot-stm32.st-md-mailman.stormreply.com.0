Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BC44059C7
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Sep 2021 16:55:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 985B3C5A4F4;
	Thu,  9 Sep 2021 14:55:46 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 677E2C5718D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Sep 2021 14:55:45 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id w144so2787829oie.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Sep 2021 07:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HdE5htSNkemSPGIgu53khKlom/ipOJhrthW4WHLcC+o=;
 b=IJ8ntiCMuQyOO/rcG67GyYO3e1CnPll5lfMNzrcJrmG90XtsAv2sXB963ErIfA3MEp
 0h2v66C5/M+B+Ppwg+bLjXyg4eQF2gRg3j4RMaNOz0g5vlgRJfrID7k32Ua3ZV++SFXp
 PqASN+r4q/ei0UKtqHwOZG0OvuVVnDB1WYNQ2F2DqOXgBk772zObQCgGQoSbYMBX621C
 zJCkfCHz062JA/SsYyQztszi9MMnukE8ZfNClp4K8uxe1C6IICTWDuUUljxEJ8eIL0e5
 SSE/HOIbgpp3NTI6Az2iwpL4aJwuYT4U52AOuWKoDvAHEzJID5/aySc8kofa4FWwLXHl
 uGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HdE5htSNkemSPGIgu53khKlom/ipOJhrthW4WHLcC+o=;
 b=Ji82GEF4UcBazfiPdS1XQaERlfCt9O1hSMUdvRKW5+y/+aB6ws7mGZfS7dQW5duJOu
 ZMvy399o73E2864i4Dh5j3MA7J0UpPb7qyVXRCq8JeQ934xjgk3gfA48gPjg6p+O2Dl5
 89duDJgwalsNzYSFnWAd2Dll9OQhnlXnX19O0onl8plyIrtFaKxZlpMj2NXa+ROHJcrR
 zH84WLMHbBu2l8sxbNsyqHtEkgPt7bDOf72vEgs6eJm9QJiUhXYYNb+r5Yuskr9ZpypK
 kbYd0t0e1/P2LVw9Kf4Ru/7Yxtbx7CdsqFjUT5pqtu3m2YneL3XXtk/Y4R0y+qCAEl6O
 fiRw==
X-Gm-Message-State: AOAM532tB3dBaPY5o8Sg9LCynu3oMyDqNBsQG5OWNCw1lRLhZpfdCN7H
 7vY+YHwOQ/52V/vIolhIjlQ=
X-Google-Smtp-Source: ABdhPJygcKtZRDkgp6NVgHrVEyTSpmOEwZ1RUrvMU20YfVjeIMO6t679cfX6C1c0pTQPlJ0pfijpxQ==
X-Received: by 2002:a05:6808:214:: with SMTP id
 l20mr127210oie.134.1631199344327; 
 Thu, 09 Sep 2021 07:55:44 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id l21sm447898oop.22.2021.09.09.07.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 07:55:43 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de,
	patrick.delaunay@foss.st.com
Date: Thu,  9 Sep 2021 09:55:34 -0500
Message-Id: <20210909145536.2979951-2-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909145536.2979951-1-mr.nuke.me@gmail.com>
References: <20210909145536.2979951-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, marex@denx.de,
 etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH 1/3] stm32mp: Rename FIP config to
	stm32mp15_tfaboot_fip_defconig
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

STM32MP has several possible boot flows with either SPL or TF-A. The
word from STM is that they only want to support TF-A with FIP images,
and this should be default. We don't disagree. However, this argument
is orthogonal to naming our defconfigs clearly.

I'm concerned that users might be confused by the current naming. When
given the choice between "basic", "trusted", or "<empty>", someone
used with how u-boot works will think that the "<empty>" config is the
customary "SPL + u-boot". However, such confusion is far less likely
when the choices are "basic", "trusted", and "tfaboot_fip".

To this effect, avoid having a naked config name and rename it to
"stm32mp15_tfaboot_fip_defconig".

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 board/st/stm32mp1/MAINTAINERS                    |  2 +-
 ...defconfig => stm32mp15_tfaboot_fip_defconfig} |  0
 doc/board/st/stm32mp1.rst                        | 16 ++++++++--------
 3 files changed, 9 insertions(+), 9 deletions(-)
 rename configs/{stm32mp15_defconfig => stm32mp15_tfaboot_fip_defconfig} (100%)

diff --git a/board/st/stm32mp1/MAINTAINERS b/board/st/stm32mp1/MAINTAINERS
index 0e6d80fb45..e2da11b46d 100644
--- a/board/st/stm32mp1/MAINTAINERS
+++ b/board/st/stm32mp1/MAINTAINERS
@@ -5,7 +5,7 @@ T:	git https://source.denx.de/u-boot/custodians/u-boot-stm.git
 S:	Maintained
 F:	arch/arm/dts/stm32mp15*
 F:	board/st/stm32mp1/
-F:	configs/stm32mp15_defconfig
 F:	configs/stm32mp15_basic_defconfig
 F:	configs/stm32mp15_trusted_defconfig
+F:	configs/stm32mp15_tfaboot_fip_defconfig
 F:	include/configs/stm32mp1.h
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_tfaboot_fip_defconfig
similarity index 100%
rename from configs/stm32mp15_defconfig
rename to configs/stm32mp15_tfaboot_fip_defconfig
diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
index 42bb94148d..89981023be 100644
--- a/doc/board/st/stm32mp1.rst
+++ b/doc/board/st/stm32mp1.rst
@@ -76,7 +76,7 @@ The **Trusted** boot chain with TF-A_
 `````````````````````````````````````
 
 defconfig_file :
-   + **stm32mp15_defconfig** (for TF-A_ with FIP support)
+   + **stm32mp15_tfaboot_fip_defconfig** (for TF-A_ with FIP support)
    + **stm32mp15_trusted_defconfig** (for TF-A_ without FIP support)
 
     +-------------+--------------------------+------------+-------+
@@ -184,7 +184,7 @@ Build Procedure
 
    with <defconfig_file>:
 
-   - For **trusted** boot mode : **stm32mp15_defconfig** or
+   - For **trusted** boot mode : **stm32mp15_tfaboot_fip_defconfig** or
      stm32mp15_trusted_defconfig
    - For basic boot mode: stm32mp15_basic_defconfig
 
@@ -197,7 +197,7 @@ Build Procedure
   a) trusted boot with FIP on ev1::
 
      # export KBUILD_OUTPUT=stm32mp15
-     # make stm32mp15_defconfig
+     # make stm32mp15_tfaboot_fip_defconfig
      # make DEVICE_TREE=stm32mp157c-ev1 all
 
   b) trusted boot without FIP on dk2::
@@ -235,7 +235,7 @@ Build Procedure
    So in the output directory (selected by KBUILD_OUTPUT),
    you can found the needed U-Boot files:
 
-     - stm32mp15_defconfig = **u-boot-nodtb.bin** and **u-boot.dtb**
+     - stm32mp15_tfaboot_fip_defconfig = **u-boot-nodtb.bin** and **u-boot.dtb**
 
      - stm32mp15_trusted_defconfig = u-boot.stm32
 
@@ -248,11 +248,11 @@ Build Procedure
 
 7. TF-A_ compilation
 
-   This step is required only for **Trusted** boot (stm32mp15_defconfig and
-   stm32mp15_trusted_defconfig); see OP-TEE_ and TF-A_ documentation for build
-   commands.
+   This step is required only for **Trusted** boot
+   (stm32mp15_tfaboot_fip_defconfig and stm32mp15_trusted_defconfig); see
+   OP-TEE_ and TF-A_ documentation for build commands.
 
-   - For TF-A_ with FIP support: **stm32mp15_defconfig**
+   - For TF-A_ with FIP support: **stm32mp15_tfaboot_fip_defconfig**
 
      - with OP-TEE_ support, compile the OP-TEE to generate the binary included
        in FIP
-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
