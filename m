Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63515199AD7
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 18:05:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BF88C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 16:05:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1464AC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 16:05:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VG4lxu027840; Tue, 31 Mar 2020 18:05:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=toD1Ks50CPJ+tHt9xdysIgXAOVBqk+DwLTMtmxx/Gk4=;
 b=O0NOcLPPfuo33IbVVOwP46ktoFcRXQLv87V0dsEaL51vz/yUOCgdP9lUr+E1siNb0tn3
 L3b/Dt9vGiVx6dtvX5ORKPr0fB1ZJKzZfQb+ZarERd1Q5MPLDLB7RSdKuQZSSVIGKBmg
 LYHgEze/2pgVHoZiWsSM0N+DhYK7aT7uSKoJ+QwR5I5PRw+4AKm7Jut6xvPMVHMNpI9a
 LkHFk7L4HfaZBo0Fh5QwMBodCXE/ks20YvgBQVwNIOvzzzkk9x/uCnNYmegjLlqoxAUs
 2dBrZkK+pVV2yi/003ploaq4jaAHeBHkqqvMVk1udGm2FiUs2Jl+0l5MwVVdnIGXzMER fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301xbmfyuk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 18:05:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2463410003D;
 Tue, 31 Mar 2020 18:04:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C7E82BEC6D;
 Tue, 31 Mar 2020 18:04:59 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 31 Mar 2020 18:04:58 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 31 Mar 2020 18:04:23 +0200
Message-ID: <20200331180330.6.I41a641a07fd12da45b392920fc3407e608926396@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_05:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 06/16] arm: stm32mp: spl: display error in
	board_init_f
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

Update board_init_f and try to display error message
when console is available.

This patch adds trace to debug a spl boot issue when DEBUG
and DEBUG_UART is not activated, after uart probe.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/spl.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
index ca4231cd0d..dfdb5bb7e9 100644
--- a/arch/arm/mach-stm32mp/spl.c
+++ b/arch/arm/mach-stm32mp/spl.c
@@ -79,37 +79,36 @@ void spl_display_print(void)
 void board_init_f(ulong dummy)
 {
 	struct udevice *dev;
-	int ret;
+	int ret, clk, reset, pinctrl;
 
 	arch_cpu_init();
 
 	ret = spl_early_init();
 	if (ret) {
-		debug("spl_early_init() failed: %d\n", ret);
+		debug("%s: spl_early_init() failed: %d\n", __func__, ret);
 		hang();
 	}
 
-	ret = uclass_get_device(UCLASS_CLK, 0, &dev);
-	if (ret) {
-		debug("Clock init failed: %d\n", ret);
-		return;
-	}
+	clk = uclass_get_device(UCLASS_CLK, 0, &dev);
+	if (clk)
+		debug("%s: Clock init failed: %d\n", __func__, clk);
 
-	ret = uclass_get_device(UCLASS_RESET, 0, &dev);
-	if (ret) {
-		debug("Reset init failed: %d\n", ret);
-		return;
-	}
+	reset = uclass_get_device(UCLASS_RESET, 0, &dev);
+	if (reset)
+		debug("%s: Reset init failed: %d\n", __func__, reset);
 
-	ret = uclass_get_device(UCLASS_PINCTRL, 0, &dev);
-	if (ret) {
-		debug("%s: Cannot find pinctrl device\n", __func__);
-		return;
-	}
+	pinctrl = uclass_get_device(UCLASS_PINCTRL, 0, &dev);
+	if (pinctrl)
+		debug("%s: Cannot find pinctrl device: %d\n",
+		      __func__, pinctrl);
 
 	/* enable console uart printing */
 	preloader_console_init();
 
+	if (clk || reset || pinctrl)
+		printf("%s: probe failed clk=%d reset=%d pinctrl=%d\n",
+		       __func__, clk, reset, pinctrl);
+
 	ret = uclass_get_device(UCLASS_RAM, 0, &dev);
 	if (ret) {
 		printf("DRAM init failed: %d\n", ret);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
