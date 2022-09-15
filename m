Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C8B5B9F6A
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Sep 2022 18:11:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCFBDC640E7;
	Thu, 15 Sep 2022 16:11:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3049EC03FE0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 16:11:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28FFce5n009807;
 Thu, 15 Sep 2022 18:11:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=nAiwoT7o1gZla0A4fZNUW0U9mjiKoSe3pHN+AXcEJfE=;
 b=p1jdbdnxPJA0k35f8lAjb7hdewbJ4tCv69fsCJBCRKyEadEKh+Cs9tT/a4rJ/E9axREy
 dUeI/vBbM9T+6r4bOBmSZwO2ZA6uivZEn/TQwyfKdZlhQTn3fv75Akm0Y+VdCxa51o+p
 Sk/I8v01YTZmCOjp3TEKGr7WeNBiQFJhxh6Kd801mLmrPFm72HiduWy/RknUWCmbMxfF
 msPHAmcCQLkAER5OEvnUqKY4TfB8Oxs7vCvFkbinxZBOHL+Fk4NudRjhDfavx4S0G4ss
 kgWxAiIjZjaMttle+OKarLvhtVZcuXRg9RvzIA/iKBga3pIreJH7PFw2gDYplcxlMcV0 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jjxxaxnc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Sep 2022 18:11:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DBB31100034;
 Thu, 15 Sep 2022 18:11:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D6E38235F18;
 Thu, 15 Sep 2022 18:11:50 +0200 (CEST)
Received: from localhost (10.75.127.51) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Thu, 15 Sep
 2022 18:11:48 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 15 Sep 2022 18:11:38 +0200
Message-ID: <20220915181132.1.I717164f1b092cbabb30dc2b1397e078027a69a65@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915161141.301299-1-patrick.delaunay@foss.st.com>
References: <20220915161141.301299-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_10,2022-09-14_04,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/4] arm: stm32mp: add defines for BSEC_LOCK
	status in stm32key command
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

Add defines for value used in stm32key for BSEC permanent lock status
and error.

This patch is a preliminary step to support more lock status in BSEC
driver.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32key.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
index 68f28922d1e..1899d91ecb5 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32key.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -19,6 +19,9 @@
 #define STM32_OTP_HASH_KEY_START	24
 #define STM32_OTP_HASH_KEY_SIZE		8
 
+#define BSEC_LOCK_ERROR			(-1)
+#define BSEC_LOCK_PERM			BIT(0)
+
 static int get_misc_dev(struct udevice **dev)
 {
 	int ret;
@@ -60,14 +63,14 @@ static int read_hash_otp(bool print, bool *locked, bool *closed)
 			val = ~0x0;
 		ret = misc_read(dev, STM32_BSEC_LOCK(word), &lock, 4);
 		if (ret != 4)
-			lock = -1;
+			lock = BSEC_LOCK_ERROR;
 		if (print)
-			printf("OTP HASH %i: %x lock : %d\n", word, val, lock);
+			printf("OTP HASH %i: %x lock : %x\n", word, val, lock);
 		if (val == ~0x0)
 			nb_invalid++;
 		else if (val == 0x0)
 			nb_zero++;
-		if (lock == 1)
+		if (lock & BSEC_LOCK_PERM)
 			nb_lock++;
 	}
 
@@ -77,13 +80,13 @@ static int read_hash_otp(bool print, bool *locked, bool *closed)
 		val = 0x0;
 	ret = misc_read(dev, STM32_BSEC_LOCK(word), &lock, 4);
 	if (ret != 4)
-		lock = -1;
+		lock = BSEC_LOCK_ERROR;
 
 	status = (val & STM32_OTP_CLOSE_MASK) == STM32_OTP_CLOSE_MASK;
 	if (closed)
 		*closed = status;
 	if (print)
-		printf("OTP %d: closed status: %d lock : %d\n", word, status, lock);
+		printf("OTP %d: closed status: %d lock : %x\n", word, status, lock);
 
 	status = (nb_lock == STM32_OTP_HASH_KEY_SIZE);
 	if (locked)
@@ -128,7 +131,7 @@ static int fuse_hash_value(u32 addr, bool print)
 			return ret;
 		}
 		/* on success, lock the OTP for HASH key */
-		val = 1;
+		val = BSEC_LOCK_PERM;
 		ret = misc_write(dev, STM32_BSEC_LOCK(word), &val, 4);
 		if (ret != 4) {
 			log_err("Lock OTP %i failed\n", word);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
