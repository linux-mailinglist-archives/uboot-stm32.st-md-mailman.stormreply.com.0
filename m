Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F1F3B5E32
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Jun 2021 14:42:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F73EC58D7F;
	Mon, 28 Jun 2021 12:42:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F17A6C58D78
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 12:42:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15SCcUCi027183; Mon, 28 Jun 2021 14:42:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=sBHkgqs+5BMKNhDppQJe5xz5v8RlgxMesFV5s2+qYkg=;
 b=wRNLKa4C2W3DYsXcVxjZwuLxR/JciZat//Tr0GjvrXCK9ESmyFcBs/GKS7XXeFt8R73j
 kiJHipmpYHuzaaEdIlPfgFPHdIQNK6ZLpZlzEZGQ/LaUQeCUv/dhse58GqVXjdFewdHG
 PcXG6URayDscdyXgQZfdbg1kgW7iPW/2o7uOsIBZ9dc/k3UI9H1iuYxwIjQFep/wHIgA
 Ss2Xi9KlEXvfTSfoG4bFRVVcnjZzzpGg+Zc8SaYEK8FtJ8RoRuDYABeEYXe7+Svn7dSN
 u/MSMBp9yH780KSMV39LXc9VYqlS5vce7mc/BjSW7nPPLjQiJuxwGQNJ/ELFme6sYjDd EQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39f94c2cvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 14:42:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9DA9910002A;
 Mon, 28 Jun 2021 14:42:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8996D226FC5;
 Mon, 28 Jun 2021 14:42:17 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 28 Jun 2021 14:42:17
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 28 Jun 2021 14:42:08 +0200
Message-ID: <20210628144151.1.I5e93758388130e77d97fc9904105c8e69363705b@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_11:2021-06-25,
 2021-06-28 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH] configs: stm32mp1: remove splashimage and add
	fdtoverlay_addr_r
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

Add the variable used by PXE command for fdtoverlays support
since the commit 69076dff2284 ("cmd: pxe: add support for FDT overlays").

Reused the unused "splashimage" address as CONFIG_SPLASH_SOURCE and
CONFIG_VIDEO_LOGO are not activated and U-Boot display the "BACKGROUND"
image found in extlinux.conf to manage splashscreen on stm32mp1 boards.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 include/configs/stm32mp1.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index 440efa1a55..2e7f49e7bb 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -155,7 +155,7 @@
 
 /*
  * memory layout for 32M uncompressed/compressed kernel,
- * 1M fdt, 1M script, 1M pxe and 1M for splashimage
+ * 1M fdt, 1M script, 1M pxe and 1M for overlay
  * and the ramdisk at the end.
  */
 #define CONFIG_EXTRA_ENV_SETTINGS \
@@ -163,7 +163,7 @@
 	"fdt_addr_r=0xc4000000\0" \
 	"scriptaddr=0xc4100000\0" \
 	"pxefile_addr_r=0xc4200000\0" \
-	"splashimage=0xc4300000\0"  \
+	"fdtoverlay_addr_r=0xc4300000\0" \
 	"ramdisk_addr_r=0xc4400000\0" \
 	"altbootcmd=run bootcmd\0" \
 	"env_check=if env info -p -d -q; then env save; fi\0" \
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
