Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAC67AF90
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60D7BC35E01
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61865C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:35 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHG4ud012688; Tue, 30 Jul 2019 19:17:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ciTQk/ThsQ4npbU2aA1mhyJ7kRWu63a1qbn52Wt/jTk=;
 b=vfak/ZRqa6zjDO1l8+5RefRKPEaZwZiXGkcPPgtk9CpoDf2nSMb74fHOQphZWYgzU0f8
 r5oy3bAicR8n6W10JUq2H89PTjVO/kYPwCv+di4s/46KKL9KnheLkpUzn8De/4P7nYUI
 1+2Xccxc41okXPrvqz6BEuudXWoLHQ455DzECQGBVu9GLLQeAjGjuBER1cQUY2nxYmOJ
 63Hb25XWr79dfTLGlliXUMDCZYoBBQcNO2waphpah3RsBniDfGGUj71AKcPtcVsZyu4b
 150zioVJySX4yDqPs2aXfU++9JT0N3ynaJzgU+VgWasM1l2+iasNn6uNPbb7DCbInshQ tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0c2ybj45-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E2B5531;
 Tue, 30 Jul 2019 17:17:33 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DC4AACEA01;
 Tue, 30 Jul 2019 19:17:33 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:33 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:33
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:37 +0200
Message-ID: <1564507016-16570-30-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 29/48] stm32mp1: board: add environment
	variable for board id and board rev
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

Add variable to identify board with HW id (read from OTP)
and revision.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index b99c6c0..ad3db31 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -538,6 +538,10 @@ int board_late_init(void)
 #ifdef CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG
 	const void *fdt_compat;
 	int fdt_compat_len;
+	int ret;
+	u32 otp;
+	struct udevice *dev;
+	char buf[10];
 
 	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
 				 &fdt_compat_len);
@@ -547,6 +551,21 @@ int board_late_init(void)
 		else
 			env_set("board_name", fdt_compat + 3);
 	}
+	ret = uclass_get_device_by_driver(UCLASS_MISC,
+					  DM_GET_DRIVER(stm32mp_bsec),
+					  &dev);
+
+	if (!ret)
+		ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
+				&otp, sizeof(otp));
+	if (!ret && otp) {
+		snprintf(buf, sizeof(buf), "0x%04x", otp >> 16);
+		env_set("board_id", buf);
+
+		snprintf(buf, sizeof(buf), "0x%04x",
+			 ((otp >> 8) & 0xF) - 1 + 0xA);
+		env_set("board_rev", buf);
+	}
 #endif
 
 	/* for DK1/DK2 boards */
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
