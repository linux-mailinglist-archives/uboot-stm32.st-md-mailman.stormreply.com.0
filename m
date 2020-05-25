Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C09181E0B93
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 May 2020 12:20:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 485F1C36B29
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 May 2020 10:20:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8079AC36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 10:19:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04PAHlAd026084; Mon, 25 May 2020 12:19:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=vP9LhUgqAkZQuYDaof2ty4eydZnC96WhhVzBTDDEfo8=;
 b=ATea7ox+edxO/baXEelhY3sV2AjemZgGvUSYyOQJnxDzjICaFP8qzKlfk+ufuMRMStQl
 J86ISOy/tWOMgSHgKNppu0vVWQxCzG/N15opnDi149cSEJ4oj0qShcFi5sDTsM2sx/DW
 HgDq7E5MCz/L53KhMBl0R6/MdKzsCYfsYaXowMRorsGfk4f5jz61sUmbjHlhUj00xbRM
 ArjH63SCWS0U6gw2a02r2FKpLgM9L39kgH3HLXVTD+InZ2MuZ5cBdzCIdCBjkRnbfWz/
 JlZZXhH+oeinVlF88flBR5T3nZ3s4k7eKWL6vCavizGRuTjGmj0lUdJvJLjAkfE7vOBU wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316sa1steh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 May 2020 12:19:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA65B100034;
 Mon, 25 May 2020 12:19:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E08FC20B847;
 Mon, 25 May 2020 12:19:54 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 25 May 2020 12:19:54 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 25 May 2020 12:19:41 +0200
Message-ID: <20200525101949.15944-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200525101949.15944-1-patrick.delaunay@st.com>
References: <20200525101949.15944-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-25_04:2020-05-25,
 2020-05-25 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 1/9] arm: stm32mp: spl: add bsec driver in
	SPL
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

Add the bsec driver in SPL, as it is needed by SOC part number detection
to found the supported OPP.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

Changes in v2: None

 arch/arm/dts/stm32mp15-u-boot.dtsi |  2 +-
 arch/arm/mach-stm32mp/Makefile     |  2 +-
 arch/arm/mach-stm32mp/bsec.c       | 11 ++++++-----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
index 1279589a56..a0d971ad88 100644
--- a/arch/arm/dts/stm32mp15-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
@@ -65,7 +65,7 @@
 };
 
 &bsec {
-	u-boot,dm-pre-proper;
+	u-boot,dm-pre-reloc;
 };
 
 &clk_csi {
diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
index 66bb8cf92f..c8aa24d489 100644
--- a/arch/arm/mach-stm32mp/Makefile
+++ b/arch/arm/mach-stm32mp/Makefile
@@ -6,12 +6,12 @@
 obj-y += cpu.o
 obj-y += dram_init.o
 obj-y += syscon.o
+obj-y += bsec.o
 
 ifdef CONFIG_SPL_BUILD
 obj-y += spl.o
 else
 obj-$(CONFIG_CMD_STM32PROG) += cmd_stm32prog/
-obj-y += bsec.o
 obj-$(CONFIG_CMD_STM32KEY) += cmd_stm32key.o
 obj-$(CONFIG_ARMV7_PSCI) += psci.o
 obj-$(CONFIG_TFABOOT) += boot_params.o
diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index 0d5850b4a9..98a950c640 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -473,20 +473,23 @@ static int stm32mp_bsec_ofdata_to_platdata(struct udevice *dev)
 	return 0;
 }
 
-#ifndef CONFIG_TFABOOT
 static int stm32mp_bsec_probe(struct udevice *dev)
 {
+#if !defined(CONFIG_TFABOOT) && !defined(CONFIG_SPL_BUILD)
 	int otp;
 	struct stm32mp_bsec_platdata *plat = dev_get_platdata(dev);
 
-	/* update unlocked shadow for OTP cleared by the rom code */
+	/*
+	 * update unlocked shadow for OTP cleared by the rom code
+	 * only executed in U-Boot proper when TF-A is not used
+	 */
 	for (otp = 57; otp <= BSEC_OTP_MAX_VALUE; otp++)
 		if (!bsec_read_SR_lock(plat->base, otp))
 			bsec_shadow_register(plat->base, otp);
+#endif
 
 	return 0;
 }
-#endif
 
 static const struct udevice_id stm32mp_bsec_ids[] = {
 	{ .compatible = "st,stm32mp15-bsec" },
@@ -500,7 +503,5 @@ U_BOOT_DRIVER(stm32mp_bsec) = {
 	.ofdata_to_platdata = stm32mp_bsec_ofdata_to_platdata,
 	.platdata_auto_alloc_size = sizeof(struct stm32mp_bsec_platdata),
 	.ops = &stm32mp_bsec_ops,
-#ifndef CONFIG_TFABOOT
 	.probe = stm32mp_bsec_probe,
-#endif
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
