Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A739B1739A1
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 15:18:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CD95C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 14:18:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60366C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2020 14:18:30 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01SEDOri025961; Fri, 28 Feb 2020 15:18:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=5ywUjN/5o363bnDWijXo1A0OPC4dsaocqnGuoderqMg=;
 b=NYJe1C1wA2NlBbMGtlGyWi4bonlBflPZFpz+KMaC6SL6MYoSH/rxgaiF1XD9lbE9yudI
 vzzACrhqBHZ+2/8OKfyWDZ2bbOXMcJV/iEPLAz/sVLtkk4EQP0tH3twRDgnuncB70A1Z
 8sERNr74E3onVOlP1fae/9F16UfpQ8G9DOZREwtaUdJJ2dYm7hBlUeWvgBFFjilfVN2M
 cTjg4DI+hFRVMr01FBP+IJkm2+UGP8nIi1f7NewzJAlKge+rROibEiTvYDLOUYe2BIwD
 dpZuv1PFWgy1GTHq3h7AdqNtTOmNLsxXTpRCJKt992OY9ICk8+9ELWfYOICIHgaK7y/d Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yepvvcc4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 15:18:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD7DC10003E;
 Fri, 28 Feb 2020 15:18:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B23AF2BF9D0;
 Fri, 28 Feb 2020 15:18:22 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 28 Feb 2020 15:18:22 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 28 Feb 2020 15:18:14 +0100
Message-ID: <20200228141816.1644-6-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228141816.1644-1-patrick.delaunay@st.com>
References: <20200228141816.1644-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_04:2020-02-28,
 2020-02-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 TsiChung Liew <Tsi-Chung.Liew@nxp.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [Uboot-stm32] [PATCH 5/7] doc: update reference to README.board
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

Update reference in files detected by
scripts/documentation-file-ref-check

doc/README.<board>  => board/<board>/README

Files moved in board directory in
commit 702e6014f15b ("doc: cleanup - move board
READMEs into respective board directories")'

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/cobra5272/README           | 2 +-
 board/freescale/m52277evb/README | 2 +-
 board/freescale/m53017evb/README | 2 +-
 board/freescale/m5373evb/README  | 2 +-
 board/freescale/m54455evb/README | 2 +-
 board/freescale/m547xevb/README  | 2 +-
 include/configs/sbc8548.h        | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/board/cobra5272/README b/board/cobra5272/README
index ae0f148258..1dad7e3eaf 100644
--- a/board/cobra5272/README
+++ b/board/cobra5272/README
@@ -28,7 +28,7 @@ CONFIGURING
 
 
 Please refer to u-boot README (general info, u-boot-x-x-x/README),
-to u-boot-x-x-x/doc/README.COBRA5272 and
+to u-boot-x-x-x/board/cobra5272/README and
 to the comments in u-boot-x-x-x/include/configs/cobra5272.h
 
 Configuring u-boot is done by commenting/uncommenting preprocessor defines.
diff --git a/board/freescale/m52277evb/README b/board/freescale/m52277evb/README
index 76f4789335..8bfd8122dd 100644
--- a/board/freescale/m52277evb/README
+++ b/board/freescale/m52277evb/README
@@ -22,7 +22,7 @@ Changed files:
 - arch/m68k/cpu/mcf5227x/config.mk	config make
 - arch/m68k/cpu/mcf5227x/start.S		start up assembly code
 
-- doc/README.m52277evb		This readme file
+- board/freescale/m52277evb/README	This readme file
 
 - drivers/serial/mcfuart.c	ColdFire common UART driver
 - drivers/rtc/mcfrtc.c		Realtime clock Driver
diff --git a/board/freescale/m53017evb/README b/board/freescale/m53017evb/README
index a7074c9b71..c4b019e2a9 100644
--- a/board/freescale/m53017evb/README
+++ b/board/freescale/m53017evb/README
@@ -23,7 +23,7 @@ Changed files:
 - arch/m68k/cpu/mcf532x/config.mk			config make
 - arch/m68k/cpu/mcf532x/start.S			start up assembly code
 
-- doc/README.m53017evb			This readme file
+- board/freescale/m53017evb/README	his readme file
 
 - drivers/net/mcffec.c			ColdFire common FEC driver
 - drivers/net/mcfmii.c			ColdFire common Mii driver
diff --git a/board/freescale/m5373evb/README b/board/freescale/m5373evb/README
index f0a0631c94..bba5420215 100644
--- a/board/freescale/m5373evb/README
+++ b/board/freescale/m5373evb/README
@@ -23,7 +23,7 @@ Changed files:
 - arch/m68k/cpu/mcf532x/config.mk		config make
 - arch/m68k/cpu/mcf532x/start.S		start up assembly code
 
-- doc/README.m5373evb		This readme file
+- board/freescale/m5373evb/README	This readme file
 
 - drivers/net/mcffec.c		ColdFire common FEC driver
 - drivers/serial/mcfuart.c	ColdFire common UART driver
diff --git a/board/freescale/m54455evb/README b/board/freescale/m54455evb/README
index 260aec9f1b..26d3cc81fd 100644
--- a/board/freescale/m54455evb/README
+++ b/board/freescale/m54455evb/README
@@ -26,7 +26,7 @@ Changed files:
 - arch/m68k/cpu/mcf5445x/config.mk	config make
 - arch/m68k/cpu/mcf5445x/start.S		start up assembly code
 
-- doc/README.m54455evb	This readme file
+- board/freescale/m54455evb/README	This readme file
 
 - drivers/net/mcffec.c		ColdFire common FEC driver
 - drivers/serial/mcfuart.c	ColdFire common UART driver
diff --git a/board/freescale/m547xevb/README b/board/freescale/m547xevb/README
index ce7b27b8b2..6b4fbe5c25 100644
--- a/board/freescale/m547xevb/README
+++ b/board/freescale/m547xevb/README
@@ -24,7 +24,7 @@ Changed files:
 - arch/m68k/cpu/mcf547x_8x/config.mk		config make
 - arch/m68k/cpu/mcf547x_8x/start.S		start up assembly code
 
-- doc/README.m5475evb			This readme file
+- board/freescale/m547xevb/README	This readme file
 
 - drivers/dma/MCD_dmaApi.c		DMA API functions
 - drivers/dma/MCD_tasks.c		DMA Tasks
diff --git a/include/configs/sbc8548.h b/include/configs/sbc8548.h
index f4113e03c4..ae2c0033d0 100644
--- a/include/configs/sbc8548.h
+++ b/include/configs/sbc8548.h
@@ -7,7 +7,7 @@
 
 /*
  * sbc8548 board configuration file
- * Please refer to doc/README.sbc8548 for more info.
+ * Please refer to board/sbc8548/README for more info.
  */
 #ifndef __CONFIG_H
 #define __CONFIG_H
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
