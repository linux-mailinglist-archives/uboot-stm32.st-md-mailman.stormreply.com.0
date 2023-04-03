Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC69D6D3D1B
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Apr 2023 08:04:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75B8DC65E58;
	Mon,  3 Apr 2023 06:04:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34BF3C65E56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 06:04:53 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3335hv4l020278; Mon, 3 Apr 2023 08:04:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=8/NFp7S+ev5YzI0IegVsmHhtxiePXW9C2rqqTtiDcr4=;
 b=bFHM9ZMGv1Ogc4/ndyVWtix0g7PXuUnyPnG1G6I7i2ALmL8WD1VtpwL6HhoLSL2WNK4c
 bU+K8yWsQZzJWOBjR2UsNI0nzSYDi8/2QOFbkCtQ1vMeN1YVhK0CsyzlxaZwJNoAhAlL
 pCNucgqdfbhITkoX6VbtoQoyURwkDdK101spfOOrLagWucyY2iYtlwsoN3njC0xuqT9m
 5WBrztPs+KJbrZU79P91Ks96FfL3TgiCzwcw7Kz+IXywl82h3gwxr8JfFu23JjVjF8L1
 TlOSveolrQfxfnPQI5HEbhZuw7pCy8OBYqOfZO/t5hIJESLgmK/rgTJLbBulMckpc47E Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ppa1m83wp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 08:04:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F69F100038;
 Mon,  3 Apr 2023 08:04:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9589820F2B4;
 Mon,  3 Apr 2023 08:04:51 +0200 (CEST)
Received: from localhost (10.201.21.26) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 3 Apr
 2023 08:04:51 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 3 Apr 2023 08:04:43 +0200
Message-ID: <20230403060444.224091-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_03,2023-03-31_01,2023-02-09_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH] spi: stm32_qspi: Remove useless struct
	stm32_qspi_flash
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

Currently, in stm32_qspi_claim_bus(), QSPI_CR and QSPI_DCR registers
are saved in stm32_ospi_flash struct on first flash memory initialization
and restored on each flash accesses.

As the logic of spi-uclass.c changed since 'commit 741280e9accd
("spi: spi-uclass: Fix spi_claim_bus() speed/mode setup logic")'
set_speed() and set_mode() callbacks are called systematically when bus
speed or bus mode need to be updated, QSPI_CR and QSPI_DCR registers are
set accordingly.

So stm32_qspi_claim_bus() can be updated by removing QSPI_CR and QSPI_DCR
save/restore code and struct stm32_ospi_flash can be removed as well.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/spi/stm32_qspi.c | 27 +++------------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/spi/stm32_qspi.c b/drivers/spi/stm32_qspi.c
index 90c207d5184..eb52ff73b23 100644
--- a/drivers/spi/stm32_qspi.c
+++ b/drivers/spi/stm32_qspi.c
@@ -115,15 +115,8 @@ struct stm32_qspi_regs {
 #define STM32_BUSY_TIMEOUT_US		100000
 #define STM32_ABT_TIMEOUT_US		100000
 
-struct stm32_qspi_flash {
-	u32 cr;
-	u32 dcr;
-	bool initialized;
-};
-
 struct stm32_qspi_priv {
 	struct stm32_qspi_regs *regs;
-	struct stm32_qspi_flash flash[STM32_QSPI_MAX_CHIP];
 	void __iomem *mm_base;
 	resource_size_t mm_size;
 	ulong clock_rate;
@@ -407,25 +400,11 @@ static int stm32_qspi_claim_bus(struct udevice *dev)
 		return -ENODEV;
 
 	if (priv->cs_used != slave_cs) {
-		struct stm32_qspi_flash *flash = &priv->flash[slave_cs];
-
 		priv->cs_used = slave_cs;
 
-		if (flash->initialized) {
-			/* Set the configuration: speed + cs */
-			writel(flash->cr, &priv->regs->cr);
-			writel(flash->dcr, &priv->regs->dcr);
-		} else {
-			/* Set chip select */
-			clrsetbits_le32(&priv->regs->cr, STM32_QSPI_CR_FSEL,
-					priv->cs_used ? STM32_QSPI_CR_FSEL : 0);
-
-			/* Save the configuration: speed + cs */
-			flash->cr = readl(&priv->regs->cr);
-			flash->dcr = readl(&priv->regs->dcr);
-
-			flash->initialized = true;
-		}
+		/* Set chip select */
+		clrsetbits_le32(&priv->regs->cr, STM32_QSPI_CR_FSEL,
+				priv->cs_used ? STM32_QSPI_CR_FSEL : 0);
 	}
 
 	setbits_le32(&priv->regs->cr, STM32_QSPI_CR_EN);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
