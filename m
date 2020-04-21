Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E69E91B2AB9
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 17:11:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E28EC36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 15:11:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33167C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 15:11:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LF8Ckx014134; Tue, 21 Apr 2020 17:11:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=kYIyelRxl1CcA3x02aa6pQpQq1/M4s3isyonXWtgGkA=;
 b=k0AwrHSFyMMs09Fp9XYnC/ODEPxLn6J5OZdfNObJLlx/sds5OMijyrkxw3hF/CYVxSPB
 CTHVqGwLEL98bKLlmXVUMla0NkdCTZhN6Rstt68wZfDEkwhuDubwT4vjvF1XD/IXWlat
 JD8FWHX5e6mwuk0ZfmNB5AkZdek9YYKjXFdK0zrjoNag85UsKi+A4VYMleh2nxxv2ugr
 3BmJvkGyfpzYFmqRqbiC4UXDHXtZ58Eki+8UCeGpo9bNX27HO0VZWDGY4yF9RlIdGGo0
 B+4uiHZjwl+Vbf3oXgUq+v73UL99GYvx+bZDzbqoaIlUX8t1T/HwvwADbneq/i9xdB6U ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fpp8s674-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 17:11:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0B7A6100034;
 Tue, 21 Apr 2020 17:11:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F1B9A2B187B;
 Tue, 21 Apr 2020 17:11:45 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Apr 2020 17:11:45 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 Apr 2020 17:11:20 +0200
Message-ID: <20200421171123.1.I7a042a9ffbb5c2668034eddf5ace91271bb53c5f@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421151128.18072-1-patrick.delaunay@st.com>
References: <20200421151128.18072-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_05:2020-04-20,
 2020-04-21 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Wolfgang Denk <wd@denx.de>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/9] arm: stm32mp: spl: add bsec driver in SPL
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
---

I already sent in unrelated serie

http://patchwork.ozlabs.org/patch/1264829/

Patrick


 arch/arm/dts/stm32mp15-u-boot.dtsi |  2 +-
 arch/arm/mach-stm32mp/Makefile     |  2 +-
 arch/arm/mach-stm32mp/bsec.c       | 11 ++++++-----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
index 8f9535a4db..e0b1223de8 100644
--- a/arch/arm/dts/stm32mp15-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
@@ -40,7 +40,7 @@
 };
 
 &bsec {
-	u-boot,dm-pre-proper;
+	u-boot,dm-pre-reloc;
 };
 
 &clk_csi {
diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
index eee39c27c3..f29d6f795f 100644
--- a/arch/arm/mach-stm32mp/Makefile
+++ b/arch/arm/mach-stm32mp/Makefile
@@ -6,11 +6,11 @@
 obj-y += cpu.o
 obj-y += dram_init.o
 obj-y += syscon.o
+obj-y += bsec.o
 
 ifdef CONFIG_SPL_BUILD
 obj-y += spl.o
 else
-obj-y += bsec.o
 obj-$(CONFIG_CMD_STM32KEY) += cmd_stm32key.o
 obj-$(CONFIG_ARMV7_PSCI) += psci.o
 endif
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
