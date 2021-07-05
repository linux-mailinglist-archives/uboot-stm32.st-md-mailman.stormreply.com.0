Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DA73BB7FE
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Jul 2021 09:39:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A4B6C57B5B;
	Mon,  5 Jul 2021 07:39:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39DCCC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jul 2021 07:39:07 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1657RE6E009104; Mon, 5 Jul 2021 09:39:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=xD7iASd5Ua1oHYLnH2Ysx5fn2vuG8j/PMMuMZrp6rS8=;
 b=J63wXlzzFxjPUvUwxbepjTmw+MilRTV/mfUWRs+5u0MZI1XexSmRpkLye5JmAjjKl8UI
 RzLPrzJXX7L8lVzV93QObIZi8PWDS9QjCazBkmhZpHnH9tiu6gBacz8xOZQgCgrqXwl+
 0zIzznCXm9+dzLkXHnDW0TM2uoyjzGeZeeMjC3ta4XuySmbnv85f6MAEhilYGRkSI6aF
 yfznxfn1SGMrcwMgZGU0iQHXjtXScOfS3mHCWu8CeyscFtPxk1vwTdKNq96zfIvfUZsN
 FIWd2j5gVJN3DVSSnDT0ilAH3bHbVgIrXZVixCXkBJlpR1Z6iIHBbiGF0VOQgm9gIOV5 xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39k9dgc819-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jul 2021 09:39:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF30A10002A;
 Mon,  5 Jul 2021 09:39:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B3613215147;
 Mon,  5 Jul 2021 09:39:04 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 5 Jul 2021 09:39:04
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 5 Jul 2021 09:39:01 +0200
Message-ID: <20210705093834.1.I36ee8ad60f6e0ee9c3021a5e2f0fcc1863bb648e@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-05_04:2021-07-02,
 2021-07-05 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH] stm32mp: stm32prog: use defines for virtual
	partition size
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

Use the existing defines PMIC_SIZE and OTP_SIZE and a new define
CMD_SIZE for virtual partition size.

This patch corrects the size for OTP partition in alternate name
(1024 instead of 512) and avoids other alignment issues.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c     | 6 +++---
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h     | 1 +
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 4c4d8a7a69..8288646bb7 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -1195,13 +1195,13 @@ static int dfu_init_entities(struct stm32prog_data *data)
 	}
 
 	if (!ret)
-		ret = stm32prog_alt_add_virt(dfu, "virtual", PHASE_CMD, 512);
+		ret = stm32prog_alt_add_virt(dfu, "virtual", PHASE_CMD, CMD_SIZE);
 
 	if (!ret)
-		ret = stm32prog_alt_add_virt(dfu, "OTP", PHASE_OTP, 512);
+		ret = stm32prog_alt_add_virt(dfu, "OTP", PHASE_OTP, OTP_SIZE);
 
 	if (!ret && CONFIG_IS_ENABLED(DM_PMIC))
-		ret = stm32prog_alt_add_virt(dfu, "PMIC", PHASE_PMIC, 8);
+		ret = stm32prog_alt_add_virt(dfu, "PMIC", PHASE_PMIC, PMIC_SIZE);
 
 	if (ret)
 		stm32prog_err("dfu init failed: %d", ret);
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index 581b10d0ac..6282c34bcc 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -19,6 +19,7 @@
 
 #define DEFAULT_ADDRESS		0xFFFFFFFF
 
+#define CMD_SIZE		512
 #define OTP_SIZE		1024
 #define PMIC_SIZE		8
 
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
index bc44d9fc8f..3c0cc6a187 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
@@ -178,7 +178,7 @@ int stm32prog_get_medium_size_virt(struct dfu_entity *dfu, u64 *size)
 
 	switch (dfu->data.virt.dev_num) {
 	case PHASE_CMD:
-		*size = 512;
+		*size = CMD_SIZE;
 		break;
 	case PHASE_OTP:
 		*size = OTP_SIZE;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
