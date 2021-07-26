Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF723D5665
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Jul 2021 11:21:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE988C597AB;
	Mon, 26 Jul 2021 09:21:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D796C597AB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jul 2021 09:21:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16Q9Bw6j000683; Mon, 26 Jul 2021 11:21:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=3+VhnPX3XVQ0qJ/DNTRWhYhspB5LaTuh/Y3JeSbfp4Y=;
 b=cwYHEm5dkNpBTcuOcTJa1KDPk3r1lpezrmeAzdch0ezPAsV221+GMsUIOwsBTHm9uSOV
 rFYTX7noFTzNg1nIEB1GSiyYAFkxu6t37iiCJYomCsAZCgR4iROcJsFyhP9yTBVksoqJ
 WXQ+M+szJPOFV1PRiVbnULuoMS7cLVqv7h6n7NIDp82utVLwantaT7bDBrpOJF/WAyTB
 9N+fK9lY3HFovuT8fpQ5vQvJ4/Hs6NK/soU/Ia46Zlcv/RusBKLIV4whslnFv5ubQEig
 HH6u4IgmuSG6MWeu9KUNRACDnTZkJIg1KKNc8GrlkovLsLdJLTrufJ7adJsPm212tHuA jA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a1sy1g52r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Jul 2021 11:21:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 24BCC10002A;
 Mon, 26 Jul 2021 11:21:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B6670211F2F;
 Mon, 26 Jul 2021 11:21:44 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 26 Jul 2021 11:21:44
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 26 Jul 2021 11:21:35 +0200
Message-ID: <20210726111931.v3.2.Ib0b251fb6120b1654e40dba8cb37ac128648318e@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726092138.53762-1-patrick.delaunay@foss.st.com>
References: <20210726092138.53762-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-26_05:2021-07-26,
 2021-07-26 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v3 2/5] arm: stm32mp: handle the OP-TEE nodes
	in DT with FIP support
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

With FIP support in TF-A (when CONFIG_STM32MP15x_STM32IMAGE
is not activated), the DT nodes needed by OP-TEE are added by OP-TEE
firmware in U-Boot device tree, present in FIP.

These nodes are only required in trusted boot, when TF-A load the file
u-boot.stm32, including the U-Boot device tree with STM32IMAGE header,
in this case OP-TEE can't update the U-Boot device tree.

Moreover in trusted boot mode with FIP, as the OP-TEE nodes are present
in U-Boot device tree only when needed the function
stm32_fdt_disable_optee can be removed.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

(no changes since v1)

 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi |  3 +++
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi |  3 +++
 arch/arm/mach-stm32mp/fdt.c              | 11 ++++++++++-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index 7dcc96c19c..8b66dace37 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -21,6 +21,8 @@
 		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
 	};
 
+#ifdef CONFIG_STM32MP15x_STM32IMAGE
+	/* only needed for boot with TF-A, witout FIP support */
 	firmware {
 		optee {
 			compatible = "linaro,optee-tz";
@@ -34,6 +36,7 @@
 			no-map;
 		};
 	};
+#endif
 
 	led {
 		red {
diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index 46a43371bd..e5a1cb7084 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -20,6 +20,8 @@
 		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
 	};
 
+#ifdef CONFIG_STM32MP15x_STM32IMAGE
+	/* only needed for boot with TF-A, witout FIP support */
 	firmware {
 		optee {
 			compatible = "linaro,optee-tz";
@@ -33,6 +35,7 @@
 			no-map;
 		};
 	};
+#endif
 
 	led {
 		red {
diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
index ce2fe0206f..a19e954cf7 100644
--- a/arch/arm/mach-stm32mp/fdt.c
+++ b/arch/arm/mach-stm32mp/fdt.c
@@ -332,7 +332,16 @@ int ft_system_setup(void *blob, struct bd_info *bd)
 				       "st,package", pkg, false);
 	}
 
-	if (!CONFIG_IS_ENABLED(OPTEE) ||
+	/*
+	 * TEMP: remove OP-TEE nodes in kernel device tree
+	 *       copied from U-Boot device tree by optee_copy_fdt_nodes
+	 *       when OP-TEE is not detected (probe failed)
+	 * these OP-TEE nodes are present in <board>-u-boot.dtsi
+	 * under CONFIG_STM32MP15x_STM32IMAGE only for compatibility
+	 * when FIP is not used by TF-A
+	 */
+	if (CONFIG_IS_ENABLED(STM32MP15x_STM32IMAGE) &&
+	    CONFIG_IS_ENABLED(OPTEE) &&
 	    !tee_find_device(NULL, NULL, NULL, NULL))
 		stm32_fdt_disable_optee(blob);
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
