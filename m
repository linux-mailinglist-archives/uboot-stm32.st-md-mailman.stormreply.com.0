Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4404C82D90F
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jan 2024 13:49:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 088B0C6DD7E;
	Mon, 15 Jan 2024 12:49:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02A2FC6DD75
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 12:49:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40F8N7Zr008279; Mon, 15 Jan 2024 13:49:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=A/rRg/9nfb3zfaMuN2sAKKKJzTkQs4wYV1NRqCr0vlE=; b=GK
 Z0GoN3Ekdu4CeZXeoPLxywKDuYshG2mzAkWaGpt1lke8MKvL2Fx7PXkUtbHDG8DB
 9J+PxggC4eorEmQz2oMaPfggt8hRfuJ6S0S1120iLZsPvz24YhKH8tke4i4eIYf+
 0yauHm1OJWwoTSY61vla01oswzsKDKcar9a/vnS+XPPGielCwz1qJgd1xefYUHZg
 uqzJ4OmeaIuh2TqdqDASB6xo9wsrOoU1ssJpRX0QudKeJptjUlgr7emnoS2g5Dym
 8h7HMhd7FO2gu2zysNKdRkaxNJ0M9p7eaTMgbS95qvKGiLg/qy0yAeWUD/AOmpf3
 UwyAeg9IFVDlK9AvFNlA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmddrf8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jan 2024 13:49:37 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4318910002A;
 Mon, 15 Jan 2024 13:49:37 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B53F2721D5;
 Mon, 15 Jan 2024 13:49:37 +0100 (CET)
Received: from localhost (10.201.22.165) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Jan
 2024 13:49:36 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jan 2024 13:46:55 +0100
Message-ID: <20240115134642.10.I7e8d4ae242605f7c9d276a858f336d13681528d9@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240115124657.39109-1-patrick.delaunay@foss.st.com>
References: <20240115124657.39109-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Igor Opaniuk <igor.opaniuk@foundries.io>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 10/12] stm32mp: activate the command stboard
	for stm32mp25 boards
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

Activate the command stboard for stm32mp25 STMicroelectronics boards,
add the default used OTP identifier and the associated board identifier:
- stm32mp25xx-ev1 = MB1936
- stm32mp25xx-dk = MB1605

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/include/mach/stm32.h | 1 +
 board/st/common/Kconfig                    | 2 +-
 board/st/common/cmd_stboard.c              | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index 45c929aa605d..726c390977e3 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -198,6 +198,7 @@ enum forced_boot_mode {
 #define BSEC_OTP_SERIAL	5
 #define BSEC_OTP_RPN	9
 #define BSEC_OTP_PKG	122
+#define BSEC_OTP_BOARD	246
 #define BSEC_OTP_MAC	247
 #endif
 
diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
index c1c254d07354..5efac658cf4d 100644
--- a/board/st/common/Kconfig
+++ b/board/st/common/Kconfig
@@ -1,7 +1,7 @@
 config CMD_STBOARD
 	bool "stboard - command for OTP board information"
 	depends on ARCH_STM32MP
-	default y if TARGET_ST_STM32MP15x || TARGET_ST_STM32MP13x
+	default y if TARGET_ST_STM32MP25X || TARGET_ST_STM32MP15X || TARGET_ST_STM32MP13X
 	help
 	  This compile the stboard command to
 	  read and write the board in the OTP.
diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
index 853ab78bbf16..cb103e69b369 100644
--- a/board/st/common/cmd_stboard.c
+++ b/board/st/common/cmd_stboard.c
@@ -49,7 +49,9 @@ static bool check_stboard(u16 board)
 		0x1298,
 		0x1341,
 		0x1497,
+		0x1605, /* stm32mp25xx-dk */
 		0x1635,
+		0x1936, /* stm32mp25xx-ev1 */
 	};
 
 	for (i = 0; i < ARRAY_SIZE(st_board_id); i++)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
