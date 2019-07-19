Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAC66E390
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 11:39:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7497C61F9C
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 09:39:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6017C61F8E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 09:39:49 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6J9acUF004472; Fri, 19 Jul 2019 11:39:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=z/zZtjpRoN0B0Z8QMfYtdFeYgSqXdABZbqWAQWvofnU=;
 b=gpub4091bfCG4SAu51QrQ1nzDzSrbiTga0PjbXb1z4zlt0h2Ub2veH69GUfhLANrwrFb
 GOhc/uDVwwv3ea5ADEJQxAk/3zZ/NK+twQ05IkmtdSEcO5U3tlt47rnGExtkLoNOogmf
 Bf6jKS9PObDY6ZUPWd6ClsuXGRm4ZcuPMD9gZPeIEkV/iIJnYUgDfWCjf+6kgDV5VMTE
 QvRwNDDQlJP6EhBWIjPdXEfeGPY16pDYvDjTJuW1qD6gX1ksuU6o5H07ynLaF1P3beIR
 91Tg/UKGBXLwoR27V0uqPQStHXTRKd/6CncnA4ZG3vD9pfC22I8kJUcsWg0hY6oqpFGI TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tq4s27he9-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 11:39:44 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F11C470;
 Fri, 19 Jul 2019 09:39:42 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C238B27E8;
 Fri, 19 Jul 2019 09:39:42 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul
 2019 11:39:42 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul 2019 11:39:42
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jul 2019 11:39:27 +0200
Message-ID: <1563529171-16796-2-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563529171-16796-1-git-send-email-patrick.delaunay@st.com>
References: <1563529171-16796-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_07:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/5] bsec: update after MISC u-class update
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

Since the commit 8729b1ae2cbd ("misc: Update read() and
write() methods to return bytes xfered"); The misc bsec driver
need to be adapted to reflect the number of transferred bytes.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/bsec.c | 31 ++++++++++++++++---------------
 drivers/misc/stm32mp_fuse.c  | 30 +++++++++++++++++-------------
 2 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index 0166649..50ff636 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -363,15 +363,13 @@ static int stm32mp_bsec_read(struct udevice *dev, int offset,
 		offset -= STM32_BSEC_OTP_OFFSET;
 		shadow = false;
 	}
-	otp = offset / sizeof(u32);
 
-	if (otp < 0 || (otp + nb_otp - 1) > BSEC_OTP_MAX_VALUE) {
-		dev_err(dev, "wrong value for otp, max value : %i\n",
-			BSEC_OTP_MAX_VALUE);
+	if (offset < 0 || (offset % 4) || (size % 4))
 		return -EINVAL;
-	}
 
-	for (i = otp; i < (otp + nb_otp); i++) {
+	otp = offset / sizeof(u32);
+
+	for (i = otp; i < (otp + nb_otp) && i <= BSEC_OTP_MAX_VALUE; i++) {
 		u32 *addr = &((u32 *)buf)[i - otp];
 
 		if (shadow)
@@ -382,7 +380,10 @@ static int stm32mp_bsec_read(struct udevice *dev, int offset,
 		if (ret)
 			break;
 	}
-	return ret;
+	if (ret)
+		return ret;
+	else
+		return (i - otp) * 4;
 }
 
 static int stm32mp_bsec_write(struct udevice *dev, int offset,
@@ -398,15 +399,12 @@ static int stm32mp_bsec_write(struct udevice *dev, int offset,
 		offset -= STM32_BSEC_OTP_OFFSET;
 		shadow = false;
 	}
-	otp = offset / sizeof(u32);
-
-	if (otp < 0 || (otp + nb_otp - 1) > BSEC_OTP_MAX_VALUE) {
-		dev_err(dev, "wrong value for otp, max value : %d\n",
-			BSEC_OTP_MAX_VALUE);
+	if (offset < 0 || (offset % 4) || (size % 4))
 		return -EINVAL;
-	}
 
-	for (i = otp; i < otp + nb_otp; i++) {
+	otp = offset / sizeof(u32);
+
+	for (i = otp; i < otp + nb_otp && i <= BSEC_OTP_MAX_VALUE; i++) {
 		u32 *val = &((u32 *)buf)[i - otp];
 
 		if (shadow)
@@ -416,7 +414,10 @@ static int stm32mp_bsec_write(struct udevice *dev, int offset,
 		if (ret)
 			break;
 	}
-	return ret;
+	if (ret)
+		return ret;
+	else
+		return (i - otp) * 4;
 }
 
 static const struct misc_ops stm32mp_bsec_ops = {
diff --git a/drivers/misc/stm32mp_fuse.c b/drivers/misc/stm32mp_fuse.c
index 8dc246b..ac33130 100644
--- a/drivers/misc/stm32mp_fuse.c
+++ b/drivers/misc/stm32mp_fuse.c
@@ -19,7 +19,7 @@
  */
 int fuse_read(u32 bank, u32 word, u32 *val)
 {
-	int ret = 0;
+	int ret;
 	struct udevice *dev;
 
 	switch (bank) {
@@ -31,9 +31,10 @@ int fuse_read(u32 bank, u32 word, u32 *val)
 			return ret;
 		ret = misc_read(dev, word * 4 + STM32_BSEC_SHADOW_OFFSET,
 				val, 4);
-		if (ret < 0)
-			return ret;
-		ret = 0;
+		if (ret != 4)
+			ret = -EINVAL;
+		else
+			ret = 0;
 		break;
 
 #ifdef CONFIG_PMIC_STPMIC1
@@ -66,9 +67,10 @@ int fuse_prog(u32 bank, u32 word, u32 val)
 			return ret;
 		ret = misc_write(dev, word * 4 + STM32_BSEC_OTP_OFFSET,
 				 &val, 4);
-		if (ret < 0)
-			return ret;
-		ret = 0;
+		if (ret != 4)
+			ret = -EINVAL;
+		else
+			ret = 0;
 		break;
 
 #ifdef CONFIG_PMIC_STPMIC1
@@ -99,9 +101,10 @@ int fuse_sense(u32 bank, u32 word, u32 *val)
 		if (ret)
 			return ret;
 		ret = misc_read(dev, word * 4 + STM32_BSEC_OTP_OFFSET, val, 4);
-		if (ret < 0)
-			return ret;
-		ret = 0;
+		if (ret != 4)
+			ret = -EINVAL;
+		else
+			ret = 0;
 		break;
 
 #ifdef CONFIG_PMIC_STPMIC1
@@ -134,9 +137,10 @@ int fuse_override(u32 bank, u32 word, u32 val)
 			return ret;
 		ret = misc_write(dev, word * 4 + STM32_BSEC_SHADOW_OFFSET,
 				 &val, 4);
-		if (ret < 0)
-			return ret;
-		ret = 0;
+		if (ret != 4)
+			ret = -EINVAL;
+		else
+			ret = 0;
 		break;
 
 #ifdef CONFIG_PMIC_STPMIC1
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
