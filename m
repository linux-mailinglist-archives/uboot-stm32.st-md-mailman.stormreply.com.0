Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94479A9C9EC
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Apr 2025 15:16:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 538ADC78F96;
	Fri, 25 Apr 2025 13:16:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0A21C78F88
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Apr 2025 13:16:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P7eWTc009005;
 Fri, 25 Apr 2025 15:16:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 FEdZ5J3wNv/KrAfjjKNDT8C0byQ6yCMPoTHaNNPyQ10=; b=5C+n3bZV5RBezRkR
 2ZHSiP7uWDmP2AwahCCPUoLnfsoi2HSvGUQs6+NaxHciszesNoO2v0UXS+Z3Gj7Z
 2CGtIe+CtlXH51X5nHbWl74ke4Ji7/E2OwzV0NK8kDOt2rjDnuTSkWMk3MqQFEh3
 ocnT0xXNoDbzGYrKlyZ7CqByFGrY0XzAYYVNJyWx8CSgSfpPUFZw3P0fVnWimzxU
 WSNTQLwZGaQKda92yIsn8xu3vZAWKoRFRiOrmqsA7NfxrLEME/Ydds0EWT1l7jq/
 bhkxNUQh3vY7MVdIfz/aPy5ioGc40gNYIfbg5p9v5fjAuFqfX9qax8g0ivw+RaRf
 VZkD0g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jjxm8hy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 15:16:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0B9D74005C;
 Fri, 25 Apr 2025 15:16:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 20CC690A65F;
 Fri, 25 Apr 2025 15:15:57 +0200 (CEST)
Received: from localhost (10.252.18.92) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 15:15:56 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 25 Apr 2025 15:15:31 +0200
Message-ID: <20250425131533.392747-21-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250425131533.392747-1-patrice.chotard@foss.st.com>
References: <20250425131533.392747-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.18.92]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v2 20/22] arm: stm32mp: stm32prog: PTA BSEC is
	not supported on closed device
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

From: Patrick Delaunay <patrick.delaunay@foss.st.com>

On closed device the PTA BSEC is never supported and the current check if
PTA BSEC is supported cause a OP-TEE error:

  E/TC tee_ta_open_session

This patch removed this warning on closed device, because the check is
skipped.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

(no changes since v1)

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 353aecc09de..f6395bad0ec 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -13,6 +13,7 @@
 #include <part.h>
 #include <tee.h>
 #include <asm/arch/stm32mp1_smc.h>
+#include <asm/arch/sys_proto.h>
 #include <asm/global_data.h>
 #include <dm/device_compat.h>
 #include <dm/uclass.h>
@@ -1357,7 +1358,7 @@ static int dfu_init_entities(struct stm32prog_data *data)
 
 	alt_nb = 1; /* number of virtual = CMD*/
 
-	if (IS_ENABLED(CONFIG_CMD_STM32PROG_OTP)) {
+	if (IS_ENABLED(CONFIG_CMD_STM32PROG_OTP) && !stm32mp_is_closed()) {
 		/* OTP_SIZE_SMC = 0 if SMC is not supported */
 		otp_size = OTP_SIZE_SMC;
 		/* check if PTA BSEC is supported */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
