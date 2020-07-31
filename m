Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3B82347D6
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 16:32:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9AEAC36B35
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 14:32:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2CD8C36B35
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:32:02 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VESk2T019622; Fri, 31 Jul 2020 16:32:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=e6jTEfaYpsaptI0Gg6NHxg2/RO3YBvz3Trkc2/mNxpE=;
 b=dkGuNnEF0xGz07W52HV06SXgCHbQYTGiAPUS+9QiUKjb3BSzEIvcokiBpGj5qgbc2Chf
 M//qzB5FHtN13XVEl+P10r+Zsfv1JfG0b7LzOeRHAYlV/SzKjB1C+/5Ll6zNWz7Mxh9o
 dDuzh1gvutsWI4q6Bom+xRdQ+XsFxEwYllHdWB8h/C+yCKDNNJrmW3/cr2Ss23lRPeeK
 qq1ifxir/ffBpwLDXIhWZZVjlT2oTtn32BaiIcUlBKUXQYwJwLDZ9W1LO11q4H5xLXWb
 0BGdEkXHOXNiM+XOR03pEzOlWmmKKZDhhl2fujOd7caMfz6+P3z9+LFrBIswdLFHiRkN hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga72dw2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 16:32:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 04A7A100034;
 Fri, 31 Jul 2020 16:32:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0ECB2B1899;
 Fri, 31 Jul 2020 16:32:01 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jul 2020 16:32:01 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Jul 2020 16:31:48 +0200
Message-ID: <20200731143152.8812-7-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731143152.8812-1-patrick.delaunay@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_05:2020-07-31,
 2020-07-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 07/11] board: stm32mp1: use IS_ENABLED to
	prevent ifdef in board_late_init
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

Use IS_ENABLED to prevent ifdef in board_late_init.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 60 ++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 985233f2b3..a9705baa24 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -654,47 +654,47 @@ int board_init(void)
 
 int board_late_init(void)
 {
-#ifdef CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG
 	const void *fdt_compat;
 	int fdt_compat_len;
 	int ret;
 	u32 otp;
 	struct udevice *dev;
 	char buf[10];
+	char dtb_name[256];
+	int buf_len;
+
+	if (IS_ENABLED(CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG)) {
+		fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
+					 &fdt_compat_len);
+		if (fdt_compat && fdt_compat_len) {
+			if (strncmp(fdt_compat, "st,", 3) != 0) {
+				env_set("board_name", fdt_compat);
+			} else {
+				env_set("board_name", fdt_compat + 3);
 
-	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
-				 &fdt_compat_len);
-	if (fdt_compat && fdt_compat_len) {
-		if (strncmp(fdt_compat, "st,", 3) != 0) {
-			env_set("board_name", fdt_compat);
-		} else {
-			char dtb_name[256];
-			int buf_len = sizeof(dtb_name);
+				buf_len = sizeof(dtb_name);
+				strncpy(dtb_name, fdt_compat + 3, buf_len);
+				buf_len -= strlen(fdt_compat + 3);
+				strncat(dtb_name, ".dtb", buf_len);
+				env_set("fdtfile", dtb_name);
+			}
+		}
+		ret = uclass_get_device_by_driver(UCLASS_MISC,
+						  DM_GET_DRIVER(stm32mp_bsec),
+						  &dev);
 
-			env_set("board_name", fdt_compat + 3);
+		if (!ret)
+			ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
+					&otp, sizeof(otp));
+		if (ret > 0 && otp) {
+			snprintf(buf, sizeof(buf), "0x%04x", otp >> 16);
+			env_set("board_id", buf);
 
-			strncpy(dtb_name, fdt_compat + 3, buf_len);
-			buf_len -= strlen(fdt_compat + 3);
-			strncat(dtb_name, ".dtb", buf_len);
-			env_set("fdtfile", dtb_name);
+			snprintf(buf, sizeof(buf), "0x%04x",
+				 ((otp >> 8) & 0xF) - 1 + 0xA);
+			env_set("board_rev", buf);
 		}
 	}
-	ret = uclass_get_device_by_driver(UCLASS_MISC,
-					  DM_GET_DRIVER(stm32mp_bsec),
-					  &dev);
-
-	if (!ret)
-		ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
-				&otp, sizeof(otp));
-	if (ret > 0 && otp) {
-		snprintf(buf, sizeof(buf), "0x%04x", otp >> 16);
-		env_set("board_id", buf);
-
-		snprintf(buf, sizeof(buf), "0x%04x",
-			 ((otp >> 8) & 0xF) - 1 + 0xA);
-		env_set("board_rev", buf);
-	}
-#endif
 
 	/* for DK1/DK2 boards */
 	board_check_usb_power();
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
