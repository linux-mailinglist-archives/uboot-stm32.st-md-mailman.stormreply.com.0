Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2490A3D0A1D
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Jul 2021 09:56:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D55C5C597BD;
	Wed, 21 Jul 2021 07:56:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5B22CFAC5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 07:56:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16L7l36E030566; Wed, 21 Jul 2021 09:56:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=8u0acEqLrhYspXGRSXP5VeZu/BL5VgqnBGbWFZv8Nls=;
 b=tD/eMFUJDIH/G/l2+Me4KbJKSruwAYUuSlkmMobzdv7wsbCxSBW1VbbWCaY9iJM54whe
 aQxM8O+f/426tyI9xU1FMVdFbU543Jo490e4TN7vanBgFbq22Cy0USlrUpC2tJYXMqpb
 iDn9wzAtJgHDak9Q5ISWEaIcMdWJcuptsLGn0CKhgMqpooGj+EIcf/I0aK+VmhSJH640
 u47M75+xSieh0NBfmyOgx/JGkHEVIAHxbq419Z/QoLqtEBP3qWk6cXMD9GLPypncEveV
 ZL75rSItm+Gw+q7FcHnBDSACp6fVxeAniig+ycb1h3hsEOG9Yi4C91yvflQk11legl6Y Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39wtu2pap4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 09:56:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 37860100034;
 Wed, 21 Jul 2021 09:56:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 13A7E2178F1;
 Wed, 21 Jul 2021 09:56:22 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 21 Jul 2021 09:56:21
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 21 Jul 2021 09:56:07 +0200
Message-ID: <20210721095553.RESEND.1.I550b95f6d12d59aeef5b744d837dbb360037d39e@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-21_04:2021-07-21,
 2021-07-21 signatures=0
Cc: Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [RESEND PATCH] build: remove the variable NM in
	gen_ll_addressable_symbols.sh
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

With LTO activated, the buildman tools failed with an error on my
configuration (Ubuntu 20.04, stm32mp15_trusted_defconfig) with the error:

../arm-linux-gnueabi/bin/nm:
	scripts/gen_ll_addressable_symbols.sh: file format not recognized

It seems the shell variable initialization NM=$(NM) is not correctly
interpreted when shell is started in the Makefile, but I have not this
issue when I compile the same target without buildman.

I don't found the root reason of the problem but I solve it by
providing $(NM) as script parameter instead using a shell variable.

The command executed is identical:

cmd_keep-syms-lto.c := NM=arm-none-linux-gnueabihf-gcc-nm \
u-boot/scripts/gen_ll_addressable_symbols.sh arch/arm/cpu/built-in.o \
.... net/built-in.o >keep-syms-lto.c

cmd_keep-syms-lto.c := u-boot/scripts/gen_ll_addressable_symbols.sh \
arm-none-linux-gnueabihf-gcc-nm arch/arm/cpu/built-in.o \
... net/built-in.o > keep-syms-lto.c

Reviewed-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
Resend with correct commit message for patman
  s/Serie-cc/Series-cc/


 Makefile                              | 2 +-
 scripts/Makefile.spl                  | 2 +-
 scripts/gen_ll_addressable_symbols.sh | 5 ++++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index ca2432c8ce..140dea09f4 100644
--- a/Makefile
+++ b/Makefile
@@ -1736,7 +1736,7 @@ u-boot-keep-syms-lto_c := $(patsubst %.o,%.c,$(u-boot-keep-syms-lto))
 
 quiet_cmd_keep_syms_lto = KSL     $@
       cmd_keep_syms_lto = \
-	NM=$(NM) $(srctree)/scripts/gen_ll_addressable_symbols.sh $^ >$@
+	$(srctree)/scripts/gen_ll_addressable_symbols.sh $(NM) $^ > $@
 
 quiet_cmd_keep_syms_lto_cc = KSLCC   $@
       cmd_keep_syms_lto_cc = \
diff --git a/scripts/Makefile.spl b/scripts/Makefile.spl
index 5be1a9ba1b..25a3e7fa52 100644
--- a/scripts/Makefile.spl
+++ b/scripts/Makefile.spl
@@ -459,7 +459,7 @@ u-boot-spl-keep-syms-lto_c := \
 
 quiet_cmd_keep_syms_lto = KSL     $@
       cmd_keep_syms_lto = \
-	NM=$(NM) $(srctree)/scripts/gen_ll_addressable_symbols.sh $^ >$@
+	$(srctree)/scripts/gen_ll_addressable_symbols.sh $(NM) $^ > $@
 
 quiet_cmd_keep_syms_lto_cc = KSLCC   $@
       cmd_keep_syms_lto_cc = \
diff --git a/scripts/gen_ll_addressable_symbols.sh b/scripts/gen_ll_addressable_symbols.sh
index 3978a39d97..b8840dd011 100755
--- a/scripts/gen_ll_addressable_symbols.sh
+++ b/scripts/gen_ll_addressable_symbols.sh
@@ -5,8 +5,11 @@
 # Generate __ADDRESSABLE(symbol) for every linker list entry symbol, so that LTO
 # does not optimize these symbols away
 
+# The expected parameter of this script is the command requested to have
+# the U-Boot symbols to parse, for example: $(NM) $(u-boot-main)
+
 set -e
 
 echo '#include <common.h>'
-$NM "$@" 2>/dev/null | grep -oe '_u_boot_list_2_[a-zA-Z0-9_]*_2_[a-zA-Z0-9_]*' | \
+$@ 2>/dev/null | grep -oe '_u_boot_list_2_[a-zA-Z0-9_]*_2_[a-zA-Z0-9_]*' | \
 	sort -u | sed -e 's/^\(.*\)/extern char \1[];\n__ADDRESSABLE(\1);/'
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
