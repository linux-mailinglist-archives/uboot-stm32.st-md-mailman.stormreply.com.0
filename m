Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFB782DAF5
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jan 2024 15:07:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 256F9C6DD74;
	Mon, 15 Jan 2024 14:07:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 003C2C6DD74
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 14:07:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40FDSt6R021194; Mon, 15 Jan 2024 15:07:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=j+pXr5WjxdbUCEhnnxwiYttQ/60izlAqsAV6ZhFwhQc=; b=1r
 PgiM+SYhV3dhOuTEeVnb3YkmTWUcEslgpi/57t6vJZ6/wfsW2lzBkQq8l42J7zcx
 5IKwa/uhl5qWNGvlSYF/stTAimacV2Rafq3y4PcHyf/2gskD4fT4H2P7Jiht5PuN
 vde+2IkELEgJll2nT2EFp6RBSJ0V9Q3KbPmlQiZf9uYWhccSjRYNFYsV2Y2yjl+k
 uPVIvxEbZnbbnN9S0/yD9j1wJjqJ+hA9eb3B6URk0WZPevpIAsJBdLOgFq0fiP+K
 ieleRw2bIuCEDSCJvmUXA7aJ2beYrNqmpHvnApw+jj8V9lyKw79qhTpNbsOBQdzB
 3xrhFhfoeraMgB3JYoSA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmddru59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jan 2024 15:07:22 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DF41F10002A;
 Mon, 15 Jan 2024 15:07:21 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D5EBF298667;
 Mon, 15 Jan 2024 15:07:21 +0100 (CET)
Received: from localhost (10.201.22.165) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Jan
 2024 15:07:21 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jan 2024 15:05:51 +0100
Message-ID: <20240115150451.v2.8.Ifc2389c624c7de76bda3fa91484d4be8fc71ba1f@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240115140557.57448-1-patrick.delaunay@foss.st.com>
References: <20240115140557.57448-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Simon Glass <sjg@chromium.org>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 08/14] smt32mp: add setup_mac_address for
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

Add a function setup_mac_address() to update the MAC address from the
default location in OTP for stm32mp2 platform.

The max number of OTP for MAC address is increased to 8 for STM32MP25,
defined with get_eth_nb() and checked in setup_mac_address.

The MAC address FF:FF:FF:FF:FF:FF, the broadcast ethaddr, is a invalid
value used for unused MAC address slot in OTP, for example for board
with STM32MP25x part number allows up to 5 ethernet ports but it is not
supported by the hardware, without switch; the associated variable
"enetaddr%d" is not created.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 arch/arm/mach-stm32mp/soc.c          | 70 ++++++++++++++++++++++++++++
 arch/arm/mach-stm32mp/stm32mp1/cpu.c | 58 +----------------------
 arch/arm/mach-stm32mp/stm32mp2/cpu.c |  1 +
 3 files changed, 72 insertions(+), 57 deletions(-)

diff --git a/arch/arm/mach-stm32mp/soc.c b/arch/arm/mach-stm32mp/soc.c
index ff70ebe97464..fa56b0d2e0f1 100644
--- a/arch/arm/mach-stm32mp/soc.c
+++ b/arch/arm/mach-stm32mp/soc.c
@@ -5,10 +5,14 @@
 
 #include <env.h>
 #include <misc.h>
+#include <net.h>
 #include <asm/arch/sys_proto.h>
 #include <dm/device.h>
 #include <dm/uclass.h>
 
+/* max: 8 OTP for 5 mac address on stm32mp2*/
+#define MAX_NB_OTP	8
+
 /* used when CONFIG_DISPLAY_CPUINFO is activated */
 int print_cpuinfo(void)
 {
@@ -46,3 +50,69 @@ int setup_serial_number(void)
 
 	return 0;
 }
+
+/*
+ * If there is no MAC address in the environment, then it will be initialized
+ * (silently) from the value in the OTP.
+ */
+__weak int setup_mac_address(void)
+{
+	int ret;
+	int i;
+	u32 otp[MAX_NB_OTP];
+	uchar enetaddr[ARP_HLEN];
+	struct udevice *dev;
+	int nb_eth, nb_otp, index;
+
+	if (!IS_ENABLED(CONFIG_NET))
+		return 0;
+
+	nb_eth = get_eth_nb();
+	if (!nb_eth)
+		return 0;
+
+	/* 6 bytes for each MAC addr and 4 bytes for each OTP */
+	nb_otp = DIV_ROUND_UP(ARP_HLEN * nb_eth, 4);
+	if (nb_otp > MAX_NB_OTP) {
+		log_err("invalid number of OTP = %d, max = %d\n", nb_otp, MAX_NB_OTP);
+		return -EINVAL;
+	}
+
+	ret = uclass_get_device_by_driver(UCLASS_MISC,
+					  DM_DRIVER_GET(stm32mp_bsec),
+					  &dev);
+	if (ret)
+		return ret;
+
+	ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_MAC), otp, 4 * nb_otp);
+	if (ret < 0)
+		return ret;
+
+	for (index = 0; index < nb_eth; index++) {
+		/* MAC already in environment */
+		if (eth_env_get_enetaddr_by_index("eth", index, enetaddr))
+			continue;
+
+		for (i = 0; i < ARP_HLEN; i++)
+			enetaddr[i] = ((uint8_t *)&otp)[i + ARP_HLEN * index];
+
+		/* skip FF:FF:FF:FF:FF:FF */
+		if (is_broadcast_ethaddr(enetaddr))
+			continue;
+
+		if (!is_valid_ethaddr(enetaddr)) {
+			log_err("invalid MAC address %d in OTP %pM\n",
+				index, enetaddr);
+			return -EINVAL;
+		}
+		log_debug("OTP MAC address %d = %pM\n", index, enetaddr);
+		ret = eth_env_set_enetaddr_by_index("eth", index, enetaddr);
+		if (ret) {
+			log_err("Failed to set mac address %pM from OTP: %d\n",
+				enetaddr, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
diff --git a/arch/arm/mach-stm32mp/stm32mp1/cpu.c b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
index f84cb26fa565..524778f00c67 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/cpu.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
@@ -14,8 +14,8 @@
 #include <log.h>
 #include <lmb.h>
 #include <misc.h>
-#include <net.h>
 #include <spl.h>
+#include <asm/cache.h>
 #include <asm/io.h>
 #include <asm/arch/stm32.h>
 #include <asm/arch/sys_proto.h>
@@ -280,62 +280,6 @@ static void setup_boot_mode(void)
 	clrsetbits_le32(TAMP_BOOT_CONTEXT, TAMP_BOOT_FORCED_MASK, BOOT_NORMAL);
 }
 
-/*
- * If there is no MAC address in the environment, then it will be initialized
- * (silently) from the value in the OTP.
- */
-__weak int setup_mac_address(void)
-{
-	int ret;
-	int i;
-	u32 otp[3];
-	uchar enetaddr[6];
-	struct udevice *dev;
-	int nb_eth, nb_otp, index;
-
-	if (!IS_ENABLED(CONFIG_NET))
-		return 0;
-
-	nb_eth = get_eth_nb();
-
-	/* 6 bytes for each MAC addr and 4 bytes for each OTP */
-	nb_otp = DIV_ROUND_UP(6 * nb_eth, 4);
-
-	ret = uclass_get_device_by_driver(UCLASS_MISC,
-					  DM_DRIVER_GET(stm32mp_bsec),
-					  &dev);
-	if (ret)
-		return ret;
-
-	ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_MAC), otp, 4 * nb_otp);
-	if (ret < 0)
-		return ret;
-
-	for (index = 0; index < nb_eth; index++) {
-		/* MAC already in environment */
-		if (eth_env_get_enetaddr_by_index("eth", index, enetaddr))
-			continue;
-
-		for (i = 0; i < 6; i++)
-			enetaddr[i] = ((uint8_t *)&otp)[i + 6 * index];
-
-		if (!is_valid_ethaddr(enetaddr)) {
-			log_err("invalid MAC address %d in OTP %pM\n",
-				index, enetaddr);
-			return -EINVAL;
-		}
-		log_debug("OTP MAC address %d = %pM\n", index, enetaddr);
-		ret = eth_env_set_enetaddr_by_index("eth", index, enetaddr);
-		if (ret) {
-			log_err("Failed to set mac address %pM from OTP: %d\n",
-				enetaddr, ret);
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
 __weak void stm32mp_misc_init(void)
 {
 }
diff --git a/arch/arm/mach-stm32mp/stm32mp2/cpu.c b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
index 301e365cf4f4..9530aa8534b7 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/cpu.c
+++ b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
@@ -70,6 +70,7 @@ void enable_caches(void)
 int arch_misc_init(void)
 {
 	setup_serial_number();
+	setup_mac_address();
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
