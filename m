Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6777B199ACC
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 18:05:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2386BC36B10
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 16:05:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF28EC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 16:05:03 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VG3mA5020035; Tue, 31 Mar 2020 18:05:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=G4MllO8zHp8pKihoVV1vTxbcBRu+a5VPn0dW0HG8z+E=;
 b=M74Pa9AV+Vab3ou9jr35L5ATILH7PbZ1QjXMZWfrgdjJAFwDAD7vSJsx9h1M/ErGX/xp
 Z9/I/SNO4lq8zlaNXurhVjtARgGhFdKXsXTW07fJ8HkJGmAraQdSYrkE58YXNiTNlAs4
 UUb909kwFdJYc1P8yal5YzACEwRJLwabqff18+WGYZ+/7bxRzxkjO/7vP71i4eE34yro
 Z5AKtRCvPKmlNtBVs7jmRcvv2uFZYZJCcanXdb3MZ9tE7zRTg/6gbkk1mvGl0F/YBtVp
 HpPisifJKV1N6kpDfooEC4eR/IEJAM1inSevrFFxUfqqQXq/IOhynW9of432QOAoV2nh nA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301w8100pq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 18:05:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1A2010003A;
 Tue, 31 Mar 2020 18:04:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C832F2BEC6D;
 Tue, 31 Mar 2020 18:04:56 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 31 Mar 2020 18:04:56 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 31 Mar 2020 18:04:20 +0200
Message-ID: <20200331180330.3.I8f6df6d28ce5b4b601ced711af3699d95e1576fb@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_05:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 03/16] arm: stm32mp: reset to default
	environment when serial# change
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

Serial number is first checked and, in case of mismatch, all
environment variables are reset to their default value.

This patch allows to detect that environment is saved in a removable
device, as a SD card, and reused on a other board, potentially with
incompatible variables.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/cpu.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 9aa5794334..365c2aa4f7 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -511,8 +511,9 @@ __weak int setup_mac_address(void)
 		return -EINVAL;
 	}
 	pr_debug("OTP MAC address = %pM\n", enetaddr);
-	ret = !eth_env_set_enetaddr("ethaddr", enetaddr);
-	if (!ret)
+
+	ret = eth_env_set_enetaddr("ethaddr", enetaddr);
+	if (ret)
 		pr_err("Failed to set mac address %pM from OTP: %d\n",
 		       enetaddr, ret);
 #endif
@@ -522,13 +523,13 @@ __weak int setup_mac_address(void)
 
 static int setup_serial_number(void)
 {
+	char *serial_env;
 	char serial_string[25];
 	u32 otp[3] = {0, 0, 0 };
 	struct udevice *dev;
 	int ret;
 
-	if (env_get("serial#"))
-		return 0;
+	serial_env = env_get("serial#");
 
 	ret = uclass_get_device_by_driver(UCLASS_MISC,
 					  DM_GET_DRIVER(stm32mp_bsec),
@@ -542,6 +543,15 @@ static int setup_serial_number(void)
 		return ret;
 
 	sprintf(serial_string, "%08X%08X%08X", otp[0], otp[1], otp[2]);
+
+	if (serial_env) {
+		if (!strcmp(serial_string, serial_env))
+			return 0;
+		/* For invalid enviromnent (serial# change), reset to default */
+		env_set_default("serial number mismatch", 0);
+	}
+
+	/* save serial number */
 	env_set("serial#", serial_string);
 
 	return 0;
@@ -549,9 +559,9 @@ static int setup_serial_number(void)
 
 int arch_misc_init(void)
 {
+	setup_serial_number();
 	setup_boot_mode();
 	setup_mac_address();
-	setup_serial_number();
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
