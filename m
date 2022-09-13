Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2255B6C55
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Sep 2022 13:24:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A49AC640F0;
	Tue, 13 Sep 2022 11:24:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB390C01577
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Sep 2022 11:24:03 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DB9HZg001287;
 Tue, 13 Sep 2022 13:23:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=IVpjVCNcSlp/CgJ/mywLiwUkGrc7MFbuQjrjpQZmZ1s=;
 b=Vps8C7GC9I+3L5ea6jv1LC/LVnxMxGIWnayDSw78kbTnUmtrz/V3xp2kHEKH2EJ4wWU+
 5H1VC/Qp7/RLOB37lywYLOHqA9GZVZ+u329xkz7PJwge36BqqHhFpK8gThGWRXE6TG3M
 NzjD9SKwLjnCfGmj8+2frHAkHGLXZo3UZ29KH+4NkyJuVtQ//8QCw0SsNyHnejoxFaTn
 t2As18f21uGGeaN3VLip+RoNp8A2wxWOmt7W+4g4Ks1iw/cOhC1/ph1sCXPQJZupr1td
 rFzZQwWP06S7773vkyAua0gWcLJxiLgg+/Q5jinl4hazJAScaSLE+/Xx49H4tnQTd6Ik yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjwv8mhg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 13:23:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6D13D10002A;
 Tue, 13 Sep 2022 13:23:57 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 68CFC222CA8;
 Tue, 13 Sep 2022 13:23:57 +0200 (CEST)
Received: from localhost (10.75.127.44) by EQNDAG1NODE5.st.com (10.75.129.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 13 Sep
 2022 13:23:57 +0200
From: Yann Gautier <yann.gautier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 13 Sep 2022 13:23:46 +0200
Message-ID: <20220913112346.301480-3-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913112346.301480-1-yann.gautier@foss.st.com>
References: <20220913112346.301480-1-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE5.st.com
 (10.75.129.134)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_05,2022-09-13_01,2022-06-22_01
Cc: Peng Fan <peng.fan@nxp.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 3/3] mmc: stm32_sdmmc2: manage vqmmc
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

The SDMMC IOs can be in an IO domain, that has to be enabled.
This is done by enabling vqmmc in the driver.
This has no impact on configurations not using an IO domain, the check
can then be executed on all platforms managing regulator, and the vqmmc
regulator enabled on all platforms having it in their DT.

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>

---
There are 2 checkpatch warnings:
drivers/mmc/stm32_sdmmc2.c:40: warning: Use 'if (IS_ENABLED(CONFIG...))'
 instead of '#if or #ifdef' where possible
drivers/mmc/stm32_sdmmc2.c:580: warning: Use 'if (IS_ENABLED(CONFIG...))'
 instead of '#if or #ifdef' where possible
But this cannot be changed as the vqmmc_supply field in struct mmc is
under flag: #if CONFIG_IS_ENABLED(DM_REGULATOR). For platforms not
enabling this flag there would be a compilation error.

 drivers/mmc/stm32_sdmmc2.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
index e1240b0cf3..1195134844 100644
--- a/drivers/mmc/stm32_sdmmc2.c
+++ b/drivers/mmc/stm32_sdmmc2.c
@@ -25,6 +25,7 @@
 #include <asm/io.h>
 #include <asm/gpio.h>
 #include <linux/iopoll.h>
+#include <power/regulator.h>
 #include <watchdog.h>
 
 struct stm32_sdmmc2_plat {
@@ -36,6 +37,9 @@ struct stm32_sdmmc2_plat {
 	struct gpio_desc cd_gpio;
 	u32 clk_reg_msk;
 	u32 pwr_reg_msk;
+#if CONFIG_IS_ENABLED(DM_REGULATOR)
+	bool vqmmc_enabled;
+#endif
 };
 
 struct stm32_sdmmc2_ctx {
@@ -572,6 +576,15 @@ static void stm32_sdmmc2_pwron(struct stm32_sdmmc2_plat *plat)
 	       plat->base + SDMMC_POWER);
 
 	/* during the first 74 SDMMC_CK cycles the SDMMC is still disabled. */
+
+#if CONFIG_IS_ENABLED(DM_REGULATOR)
+	if (plat->mmc.vqmmc_supply && !plat->vqmmc_enabled) {
+		if (regulator_set_enable_if_allowed(plat->mmc.vqmmc_supply, true))
+			dev_dbg(plat->mmc.dev, "failed to enable vqmmc-supply\n");
+		else
+			plat->vqmmc_enabled = true;
+	}
+#endif
 }
 
 #define IS_RISING_EDGE(reg) (reg & SDMMC_CLKCR_NEGEDGE ? 0 : 1)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
