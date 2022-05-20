Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E4252F0A2
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 18:27:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55C52C5F1EF;
	Fri, 20 May 2022 16:27:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56689C5F1D3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 16:27:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24KAXfor014061;
 Fri, 20 May 2022 18:27:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=2YRJyQa1PagzOLSGMpE/LbbltCpqQWn9LT+gkgTMHSI=;
 b=zgK6sOJ3txd6col6P9F23h3MhdvQj3uzcY9hTbF97Rv10fzIy4pJjNEzyDIoYu55oZxO
 Y09qtjw9ozFj9bKF9pS3J0XRSvIhYjyn2beDItSJCoJwcuVK1r+QJCwxBxx9XWAdWM1r
 Q+0eegxDW94XYE6PvDlTZKXMO6RYt1tnngoLLMH6IX5jWdjVr5EejagzQ88wPba8Sf22
 bQZaXH5t1RpmWSN0ba24/adq1v9AkRnXYBq988j2yHlC7xAgW3uklqTqpjj+omY44RWv
 AZb8ll9/xuazw/epvAI62FJCugq9qrJTZ349L6tkqN0OCipfgtSkiUjiBv519H3IX/0h aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23aj9apu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 18:27:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ADACE10003B;
 Fri, 20 May 2022 18:27:48 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF06024C439;
 Fri, 20 May 2022 18:26:58 +0200 (CEST)
Received: from localhost (10.75.127.46) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 18:26:17 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 20 May 2022 18:24:47 +0200
Message-ID: <20220520182444.v2.9.I202fcb973ba156e8df0d37ac7befbca1916e72af@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520162454.1864832-1-patrick.delaunay@foss.st.com>
References: <20220520162454.1864832-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_04,2022-05-20_02,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 09/16] arm: stm32mp: support 2 MAC address
	for STM32MP13
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

Add support of several MAC address in OTP (3 32bits OTP word for
2 MAC address) for SOCs in  STM32MP13x family: STM32MP133 and STM32MP135.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

(no changes since v1)

 arch/arm/mach-stm32mp/cpu.c                   | 41 ++++++++++++-------
 .../arm/mach-stm32mp/include/mach/sys_proto.h |  1 +
 arch/arm/mach-stm32mp/stm32mp13x.c            | 20 +++++++++
 arch/arm/mach-stm32mp/stm32mp15x.c            |  5 +++
 4 files changed, 52 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 240960ada4..855fc755fe 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -290,16 +290,18 @@ __weak int setup_mac_address(void)
 {
 	int ret;
 	int i;
-	u32 otp[2];
+	u32 otp[3];
 	uchar enetaddr[6];
 	struct udevice *dev;
+	int nb_eth, nb_otp, index;
 
 	if (!IS_ENABLED(CONFIG_NET))
 		return 0;
 
-	/* MAC already in environment */
-	if (eth_env_get_enetaddr("ethaddr", enetaddr))
-		return 0;
+	nb_eth = get_eth_nb();
+
+	/* 6 bytes for each MAC addr and 4 bytes for each OTP */
+	nb_otp = DIV_ROUND_UP(6 * nb_eth, 4);
 
 	ret = uclass_get_device_by_driver(UCLASS_MISC,
 					  DM_DRIVER_GET(stm32mp_bsec),
@@ -307,22 +309,31 @@ __weak int setup_mac_address(void)
 	if (ret)
 		return ret;
 
-	ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_MAC),
-			otp, sizeof(otp));
+	ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_MAC), otp, 4 * nb_otp);
 	if (ret < 0)
 		return ret;
 
-	for (i = 0; i < 6; i++)
-		enetaddr[i] = ((uint8_t *)&otp)[i];
+	for (index = 0; index < nb_eth; index++) {
+		/* MAC already in environment */
+		if (eth_env_get_enetaddr_by_index("eth", index, enetaddr))
+			continue;
+
+		for (i = 0; i < 6; i++)
+			enetaddr[i] = ((uint8_t *)&otp)[i + 6 * index];
 
-	if (!is_valid_ethaddr(enetaddr)) {
-		log_err("invalid MAC address in OTP %pM\n", enetaddr);
-		return -EINVAL;
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
 	}
-	log_debug("OTP MAC address = %pM\n", enetaddr);
-	ret = eth_env_set_enetaddr("ethaddr", enetaddr);
-	if (ret)
-		log_err("Failed to set mac address %pM from OTP: %d\n", enetaddr, ret);
 
 	return 0;
 }
diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
index 829b3feebf..4b564e86dc 100644
--- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
+++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
@@ -64,6 +64,7 @@ void get_soc_name(char name[SOC_NAME_SIZE]);
 /* return boot mode */
 u32 get_bootmode(void);
 
+int get_eth_nb(void);
 int setup_mac_address(void);
 
 /* board power management : configure vddcore according OPP */
diff --git a/arch/arm/mach-stm32mp/stm32mp13x.c b/arch/arm/mach-stm32mp/stm32mp13x.c
index d5e3a787c2..bd3f24c349 100644
--- a/arch/arm/mach-stm32mp/stm32mp13x.c
+++ b/arch/arm/mach-stm32mp/stm32mp13x.c
@@ -51,6 +51,26 @@ u32 get_cpu_type(void)
 	return (get_cpu_dev() << 16) | get_cpu_rpn();
 }
 
+int get_eth_nb(void)
+{
+	int nb_eth = 2;
+
+	switch (get_cpu_type()) {
+	case CPU_STM32MP131Dxx:
+		fallthrough;
+	case CPU_STM32MP131Cxx:
+		fallthrough;
+	case CPU_STM32MP131Axx:
+		nb_eth = 1;
+		break;
+	default:
+		nb_eth = 2;
+		break;
+	}
+
+	return nb_eth;
+}
+
 void get_soc_name(char name[SOC_NAME_SIZE])
 {
 	char *cpu_s, *cpu_r;
diff --git a/arch/arm/mach-stm32mp/stm32mp15x.c b/arch/arm/mach-stm32mp/stm32mp15x.c
index 800fad2f43..a093e6163e 100644
--- a/arch/arm/mach-stm32mp/stm32mp15x.c
+++ b/arch/arm/mach-stm32mp/stm32mp15x.c
@@ -247,6 +247,11 @@ u32 get_cpu_type(void)
 	return (get_cpu_dev() << 16) | get_cpu_rpn();
 }
 
+int get_eth_nb(void)
+{
+	return 1;
+}
+
 /* Get Package options from OTP */
 u32 get_cpu_package(void)
 {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
