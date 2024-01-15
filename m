Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB2B82D908
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jan 2024 13:48:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6207C6DD74;
	Mon, 15 Jan 2024 12:48:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C1DCC6DD75
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 12:48:28 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40F8N7Zk008279; Mon, 15 Jan 2024 13:48:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=Rw2k3BG/YcHU4jTgLEMZm1OuQ/+87SgB6majJlk/KSM=; b=hv
 Ivh1FRHKXXuOpUooowgRQnz9vL9Y39TWCgh+0WSKcHwPThuYm+lpr1yo/TkbZlOq
 8kiLn4qY/bkxzdd/oIYRC08MhaJj6dzvGtaCU1/TO0V/hg+yAl1WDxxBwPTdiTds
 XXVRXeEU+i4cvdDWXGzKi/TwRKPhkpx0KqdyEk3HdJfyQHcDBlqdWdjw25Umcc5u
 S/txfC9poIxq8zFqIFWh/kXNOdYWml93lDF0KA5iz2x7aVFJT8a+HiPDLOWr/2Ba
 bwSAsb2S1Xqt3V52/sakJx9To3VE5fX3aA+P7fWkPZuGCZRdqpHD0VrrwfKY6ZsH
 C0cZEVp93nOYv67eJixA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmddrf3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jan 2024 13:48:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A73B10002A;
 Mon, 15 Jan 2024 13:48:26 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3421B2721D7;
 Mon, 15 Jan 2024 13:48:26 +0100 (CET)
Received: from localhost (10.201.22.165) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Jan
 2024 13:48:25 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jan 2024 13:46:54 +0100
Message-ID: <20240115134642.9.Iad107c8eaf11680ad8debbedc8d48327f31fd866@changeid>
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
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 09/12] stm32mp: stm32prog: add support of
	stm32mp25
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

Change OTP number to 364 for STM32MP25 as it is done in bsec driver.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index ae4bd8842f53..eda98eb61d76 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -28,7 +28,15 @@
 #else
 #define OTP_SIZE_SMC		0
 #endif
-#define OTP_SIZE_TA		776
+/* size of the OTP struct in NVMEM PTA */
+#define _OTP_SIZE_TA(otp)	(((otp) * 2 + 2) * 4)
+#if defined(CONFIG_STM32MP13x) || defined(CONFIG_STM32MP15x)
+/* STM32MP1 with BSEC2 */
+#define OTP_SIZE_TA		_OTP_SIZE_TA(96)
+#else
+/* STM32MP2 with BSEC3 */
+#define OTP_SIZE_TA		_OTP_SIZE_TA(368)
+#endif
 #define PMIC_SIZE		8
 
 enum stm32prog_target {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
