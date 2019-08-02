Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E167F5BC
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 13:08:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15EBEC35E03
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 11:08:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E10D0C35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 11:08:17 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72B1Pl8028858; Fri, 2 Aug 2019 13:08:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=vHXVuDPJQIBb7JM/GX0L0ZxQ7x5XIez8rkfAzuZkH1Y=;
 b=aTL00w4niD6znfwEq5AqKoIiqOW6tXDLpIGK8jpk6YNm3rH/XkiG5BqgiA4qgFAvNLX8
 T9tETl+h8g/r+RCFTUWK27O92+0M8Bd31OgjNFLRRT037RdXnvn7+wa1pF26eGklqCDB
 uJaPvBuWLTnNj/l+p+rsclF/cvHJPyJGXbM50OpYSen20j4toh5hBPzzuRJfUa9XqCxx
 xFqwFi1/xYSJmfE4JFPAgu7fORUlCA3tZCV88xF7mzMu1xX7pgOD9lKaPzpqwUVDmr2k
 ZEMJzZUEK08gqf1jVJCxGfsISVJ1TFfiaDfdDMRrYOS/iew+OPon5nveRKtAiq8eTPz+ TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u3vd06vuk-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 13:08:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 021153D;
 Fri,  2 Aug 2019 11:08:12 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ED59F207419;
 Fri,  2 Aug 2019 13:08:12 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 13:08:12 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 13:08:12
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 2 Aug 2019 13:08:02 +0200
Message-ID: <1564744088-16896-2-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564744088-16896-1-git-send-email-patrick.delaunay@st.com>
References: <1564744088-16896-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_05:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 1/7] bsec: update after MISC u-class update
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

Changes in v2:
- udpate bsec patch after rebase (use offs)

 arch/arm/mach-stm32mp/bsec.c | 30 ++++++++++++++++--------------
 drivers/misc/stm32mp_fuse.c  | 30 +++++++++++++++++-------------
 2 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index 8018366..a77c706 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -364,15 +364,13 @@ static int stm32mp_bsec_read(struct udevice *dev, int offset,
 		offs -= STM32_BSEC_OTP_OFFSET;
 		shadow = false;
 	}
-	otp = offs / sizeof(u32);
 
-	if (otp < 0 || (otp + nb_otp - 1) > BSEC_OTP_MAX_VALUE) {
-		dev_err(dev, "wrong value for otp, max value : %i\n",
-			BSEC_OTP_MAX_VALUE);
+	if (offs < 0 || (offs % 4) || (size % 4))
 		return -EINVAL;
-	}
 
-	for (i = otp; i < (otp + nb_otp); i++) {
+	otp = offs / sizeof(u32);
+
+	for (i = otp; i < (otp + nb_otp) && i <= BSEC_OTP_MAX_VALUE; i++) {
 		u32 *addr = &((u32 *)buf)[i - otp];
 
 		if (shadow)
@@ -383,7 +381,10 @@ static int stm32mp_bsec_read(struct udevice *dev, int offset,
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
@@ -400,15 +401,13 @@ static int stm32mp_bsec_write(struct udevice *dev, int offset,
 		offs -= STM32_BSEC_OTP_OFFSET;
 		shadow = false;
 	}
-	otp = offs / sizeof(u32);
 
-	if (otp < 0 || (otp + nb_otp - 1) > BSEC_OTP_MAX_VALUE) {
-		dev_err(dev, "wrong value for otp, max value : %d\n",
-			BSEC_OTP_MAX_VALUE);
+	if (offs < 0 || (offs % 4) || (size % 4))
 		return -EINVAL;
-	}
 
-	for (i = otp; i < otp + nb_otp; i++) {
+	otp = offs / sizeof(u32);
+
+	for (i = otp; i < otp + nb_otp && i <= BSEC_OTP_MAX_VALUE; i++) {
 		u32 *val = &((u32 *)buf)[i - otp];
 
 		if (shadow)
@@ -418,7 +417,10 @@ static int stm32mp_bsec_write(struct udevice *dev, int offset,
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
index 801d946..a1a27d1 100644
--- a/drivers/misc/stm32mp_fuse.c
+++ b/drivers/misc/stm32mp_fuse.c
@@ -20,7 +20,7 @@
  */
 int fuse_read(u32 bank, u32 word, u32 *val)
 {
-	int ret = 0;
+	int ret;
 	struct udevice *dev;
 
 	switch (bank) {
@@ -32,9 +32,10 @@ int fuse_read(u32 bank, u32 word, u32 *val)
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
@@ -67,9 +68,10 @@ int fuse_prog(u32 bank, u32 word, u32 val)
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
@@ -100,9 +102,10 @@ int fuse_sense(u32 bank, u32 word, u32 *val)
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
@@ -135,9 +138,10 @@ int fuse_override(u32 bank, u32 word, u32 val)
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
