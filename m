Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFE07AF7E
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A7ECC36B3E
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 076E1C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHGRM1031349; Tue, 30 Jul 2019 19:17:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=DHdssG5hUccazmUBsdLzh385rEhqOwIhm+Q8K4omoE8=;
 b=ex6PLG1VwI9ghdyavO5ECmX7xRosbLXvLQnh9E0ldSz/gNvCP/X8a4lXB1kHuYzN3+Y4
 yU1pTd+3Ms906UPiNnhWxmWmMqE7kdCCWEHZrP0uzT9VtT9TMbdLK9yJixfWUYSdrUPa
 Ey+UNW70/IJHzLlTu7shpMMFK3hGPDLJTcedZnbSw6ugn53WDapVMufzHML0mmupxEUQ
 0M3G8vNx3W3Tr7yZujS6w1T7JY7vpQM+3KbGlEshOvK4Bhpwlae1HwQBvlwoGoTa/2ZI
 IjrY15IbS8FOpicK6YcQquRwmZQc/7ijx+qp5OyVU4MuzxF4wBF3/iQyAkvEoHDjOLts ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u0br9yp3t-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D96DE31;
 Tue, 30 Jul 2019 17:17:14 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D0AC0CEA01;
 Tue, 30 Jul 2019 19:17:14 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:14 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:14
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:20 +0200
Message-ID: <1564507016-16570-13-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Albert Aribaud <albert.u.boot@aribaud.net>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH 12/48] stpmic1: program pmic to keep only the
	debug unit on
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

Depending on backup register value, we maintain the debug unit
powered-on for debugging purpose.
Only BUCK1 is required for powering the debug unit, so revert
the setting for all the other power lanes, except BUCK3 that
has to be always on.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/include/mach/stm32.h |  1 +
 board/st/stm32mp1/spl.c                    | 14 ++++++++++++++
 include/power/stpmic1.h                    |  5 +++--
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index 1d4b548..b3e9ccc 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -94,6 +94,7 @@ enum boot_device {
 #define TAMP_BOOT_DEVICE_MASK		GENMASK(7, 4)
 #define TAMP_BOOT_INSTANCE_MASK		GENMASK(3, 0)
 #define TAMP_BOOT_FORCED_MASK		GENMASK(7, 0)
+#define TAMP_BOOT_DEBUG_ON		BIT(16)
 
 enum forced_boot_mode {
 	BOOT_NORMAL = 0x00,
diff --git a/board/st/stm32mp1/spl.c b/board/st/stm32mp1/spl.c
index e19be0f..e65ff28 100644
--- a/board/st/stm32mp1/spl.c
+++ b/board/st/stm32mp1/spl.c
@@ -27,5 +27,19 @@ void spl_board_init(void)
 				STPMIC1_BUCKS_MRST_CR,
 				STPMIC1_MRST_BUCK(STPMIC1_BUCK3),
 				STPMIC1_MRST_BUCK(STPMIC1_BUCK3));
+
+	/* Check if debug is enabled to program PMIC according to the bit */
+	if ((readl(TAMP_BOOT_CONTEXT) & TAMP_BOOT_DEBUG_ON) && !ret) {
+		printf("Keep debug unit ON\n");
+
+		pmic_clrsetbits(dev, STPMIC1_BUCKS_MRST_CR,
+				STPMIC1_MRST_BUCK_DEBUG,
+				STPMIC1_MRST_BUCK_DEBUG);
+
+		if (STPMIC1_MRST_LDO_DEBUG)
+			pmic_clrsetbits(dev, STPMIC1_LDOS_MRST_CR,
+					STPMIC1_MRST_LDO_DEBUG,
+					STPMIC1_MRST_LDO_DEBUG);
+	}
 #endif
 }
diff --git a/include/power/stpmic1.h b/include/power/stpmic1.h
index 0e6721d..d90a1a9 100644
--- a/include/power/stpmic1.h
+++ b/include/power/stpmic1.h
@@ -22,11 +22,12 @@
 
 /* BUCKS_MRST_CR */
 #define STPMIC1_MRST_BUCK(buck)		BIT(buck)
-#define STPMIC1_MRST_BUCK_ALL		GENMASK(3, 0)
+#define STPMIC1_MRST_BUCK_DEBUG		(STPMIC1_MRST_BUCK(STPMIC1_BUCK1) | \
+					 STPMIC1_MRST_BUCK(STPMIC1_BUCK3))
 
 /* LDOS_MRST_CR */
 #define STPMIC1_MRST_LDO(ldo)		BIT(ldo)
-#define STPMIC1_MRST_LDO_ALL		GENMASK(6, 0)
+#define STPMIC1_MRST_LDO_DEBUG		0
 
 /* BUCKx_MAIN_CR (x=1...4) */
 #define STPMIC1_BUCK_ENA		BIT(0)
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
