Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6099C199AD3
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 18:05:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03709C36B16
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 16:05:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F128C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 16:05:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VG4ne8027845; Tue, 31 Mar 2020 18:05:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=m4H0jYkA7tuP8l8Q1TwnxXdOCR4vyJxdzbTSNGbJurY=;
 b=Kcxcs8f71dbt040+/tBwcbdUoj4exDzdSWBb1U9Lilhw5YI/DbUi8CDaPA6tTNH4JrSs
 h+IS92B1N8yH68zkXYCKkcz1/8UErbGtwfawG/mkDRVozqqg43+8Wvmy3XOWZgIomHd2
 +FD0xbZWhU2qmxlRwYX4efn7DGWn3PSSfNZwS488XsXiC6UYWfcOQ2pk9gOburudZNX5
 hRwwC3z6rQ8ZYaKGxUPj933cOJTgNmKuvV4+LsgO68ooAO9ltVTvDeQJf+Lj0kuMCkkc
 737p94M9uUWN3FxkVRAFBkzk39wYmEw+kDiquxRP1qTvBE8zWoVydWY07oEnafk4Ng3F Qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301xbmfyud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 18:05:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5DCD510003B;
 Tue, 31 Mar 2020 18:04:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55A592BEC6D;
 Tue, 31 Mar 2020 18:04:58 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 31 Mar 2020 18:04:57 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 31 Mar 2020 18:04:22 +0200
Message-ID: <20200331180330.5.I7a042a9ffbb5c2668034eddf5ace91271bb53c5f@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_05:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 05/16] arm: stm32mp: spl: add bsec driver in
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

Add the bsec driver in SPL, as it is needed by SOC part number detection.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp15-u-boot.dtsi | 2 +-
 arch/arm/mach-stm32mp/Makefile     | 2 +-
 arch/arm/mach-stm32mp/bsec.c       | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

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
index 3b923f088e..1bd287e8bf 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -473,7 +473,7 @@ static int stm32mp_bsec_ofdata_to_platdata(struct udevice *dev)
 	return 0;
 }
 
-#ifndef CONFIG_STM32MP1_TRUSTED
+#if !defined(CONFIG_STM32MP1_TRUSTED) && !defined(CONFIG_SPL_BUILD)
 static int stm32mp_bsec_probe(struct udevice *dev)
 {
 	int otp;
@@ -500,7 +500,7 @@ U_BOOT_DRIVER(stm32mp_bsec) = {
 	.ofdata_to_platdata = stm32mp_bsec_ofdata_to_platdata,
 	.platdata_auto_alloc_size = sizeof(struct stm32mp_bsec_platdata),
 	.ops = &stm32mp_bsec_ops,
-#ifndef CONFIG_STM32MP1_TRUSTED
+#if !defined(CONFIG_STM32MP1_TRUSTED) && !defined(CONFIG_SPL_BUILD)
 	.probe = stm32mp_bsec_probe,
 #endif
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
