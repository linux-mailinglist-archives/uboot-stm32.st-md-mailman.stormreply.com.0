Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9701E4E8D2
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:22:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61D17C9FE9D
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:22:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2D4BC9FE98
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:22:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDGV0L016310; Fri, 21 Jun 2019 15:22:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=8YoFUV40D+NwU49ETJGyjxJpSidIbNYRW6VP/agW0WU=;
 b=HhJP8440hpBGkb1vYKJ4mmElZU6+lY0lyudOekvxqU3s02QoOZ7IxhwluBic3NErX8+s
 XM8VBdyCHVttbuABi4K1qGvTGzCAXVLlk4n/wyWNY8QpYCOF6b/jBNqCxxOlgeD9FJvm
 9AlJxDPrMh6jnAWlcUx1bw8JtcnGJtLNgtNKGJk2LlwU6LpWhBnFujFdTLYQzXB18148
 15ZwbyeoDmNMsQX8LIQopbb0tJTqhh+UVfuMumExeocUDM8VQXEE7BAUA5G3w/JOaSG4
 4GMc3uDQyTToRdeVApqEg8jtVvqR8VpSZhCdd7dvsMfpf4G7T8dyZGBgyi7CBmZ6CiJY eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t78137sv0-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:22:11 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8900A31;
 Fri, 21 Jun 2019 13:22:10 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 720212A2E;
 Fri, 21 Jun 2019 13:22:10 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:22:10 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:22:10
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:21:42 +0200
Message-ID: <1561123314-709-5-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123314-709-1-git-send-email-patrick.delaunay@st.com>
References: <1561123314-709-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 04/16] stm32mp1: syscon: remove stgen
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

Reduce difference with kernel Linux device tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp157-u-boot.dtsi        | 7 -------
 arch/arm/mach-stm32mp/include/mach/stm32.h | 2 +-
 arch/arm/mach-stm32mp/syscon.c             | 1 -
 drivers/clk/clk_stm32mp1.c                 | 3 +--
 4 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/arm/dts/stm32mp157-u-boot.dtsi b/arch/arm/dts/stm32mp157-u-boot.dtsi
index 09560e2..c9f534e 100644
--- a/arch/arm/dts/stm32mp157-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157-u-boot.dtsi
@@ -31,13 +31,6 @@
 
 	soc {
 		u-boot,dm-pre-reloc;
-
-		stgen: stgen@5C008000 {
-			compatible = "st,stm32-stgen";
-			reg = <0x5C008000 0x1000>;
-			status = "okay";
-			u-boot,dm-pre-reloc;
-		};
 	};
 };
 
diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index 1e3299a..1d4b548 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -15,6 +15,7 @@
 #define STM32_DBGMCU_BASE		0x50081000
 #define STM32_TZC_BASE			0x5C006000
 #define STM32_ETZPC_BASE		0x5C007000
+#define STM32_STGEN_BASE		0x5C008000
 #define STM32_TAMP_BASE			0x5C00A000
 
 #define STM32_USART1_BASE		0x5C000000
@@ -37,7 +38,6 @@
 enum {
 	STM32MP_SYSCON_UNKNOWN,
 	STM32MP_SYSCON_PWR,
-	STM32MP_SYSCON_STGEN,
 	STM32MP_SYSCON_SYSCFG,
 };
 
diff --git a/arch/arm/mach-stm32mp/syscon.c b/arch/arm/mach-stm32mp/syscon.c
index e10c42e..6070837 100644
--- a/arch/arm/mach-stm32mp/syscon.c
+++ b/arch/arm/mach-stm32mp/syscon.c
@@ -10,7 +10,6 @@
 
 static const struct udevice_id stm32mp_syscon_ids[] = {
 	{ .compatible = "st,stm32mp1-pwr", .data = STM32MP_SYSCON_PWR },
-	{ .compatible = "st,stm32-stgen", .data = STM32MP_SYSCON_STGEN },
 	{ .compatible = "st,stm32mp157-syscfg",
 	  .data = STM32MP_SYSCON_SYSCFG },
 	{ }
diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
index f295e48..5f15853 100644
--- a/drivers/clk/clk_stm32mp1.c
+++ b/drivers/clk/clk_stm32mp1.c
@@ -1542,8 +1542,7 @@ static void stgen_config(struct stm32mp1_clk_priv *priv)
 	u32 stgenc, cntfid0;
 	ulong rate;
 
-	stgenc = (u32)syscon_get_first_range(STM32MP_SYSCON_STGEN);
-
+	stgenc = STM32_STGEN_BASE;
 	cntfid0 = readl(stgenc + STGENC_CNTFID0);
 	p = stm32mp1_clk_get_parent(priv, STGEN_K);
 	rate = stm32mp1_clk_get(priv, p);
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
