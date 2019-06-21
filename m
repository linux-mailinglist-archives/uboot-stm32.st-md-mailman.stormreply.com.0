Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5644E909
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:27:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A6F7CA027E
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:27:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A67A0CA027E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:27:07 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDGutr032282; Fri, 21 Jun 2019 15:27:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=VSwgmBofzuWq7rVM/Qsm7HjYHwlOM+eRuM1s79+MgAg=;
 b=LtdzCWnFxBVxgo22Hk+ZpSd5Hql0yI7kZ0VQgPgVhaWJy9eK4UZ9JDsSlqTQZGp4jiML
 Vwa1SP1SCm+DmSFNTM8GfJujXry9DksgtZGtGDHp6dc+HLb4CsVV6Eqw7GFyN7vsPMQ5
 NiWc8IqH4ibvG+ePn3s91d1c/xc15fn26K9uqgRv3yWvIymAhGYecsi7z0yFf2W//nEt
 PPY+8Ad3PeoxcewvlF6PTx6HXC/2SvelT/2khdgVxtOTXa/DEizikOHq5QjXf0FaNKdN
 doRx8jILvTc22RKJPOCz01OAhLwHynOUGjj1A3RoZbQhMyU8zUdryZq73cwJw7j7Gx3t Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7wxss9hp-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:27:06 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 227EB58;
 Fri, 21 Jun 2019 13:27:06 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09A5C2A50;
 Fri, 21 Jun 2019 13:27:06 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:27:05 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:27:05
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:26:43 +0200
Message-ID: <1561123618-2029-5-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 05/20] stm32mp1: bsec: Fix warnings when
	compiling with W=1
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

This patch solves the following warnings:

arch/arm/mach-stm32mp/bsec.c: In function 'stm32mp_bsec_read':
warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
  if (offset >= STM32_BSEC_OTP_OFFSET) {
             ^~
arch/arm/mach-stm32mp/bsec.c: In function 'stm32mp_bsec_write':
warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
  if (offset >= STM32_BSEC_OTP_OFFSET) {
             ^~
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/bsec.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index 0166649..8018366 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -358,12 +358,13 @@ static int stm32mp_bsec_read(struct udevice *dev, int offset,
 	bool shadow = true;
 	int nb_otp = size / sizeof(u32);
 	int otp;
+	unsigned int offs = offset;
 
-	if (offset >= STM32_BSEC_OTP_OFFSET) {
-		offset -= STM32_BSEC_OTP_OFFSET;
+	if (offs >= STM32_BSEC_OTP_OFFSET) {
+		offs -= STM32_BSEC_OTP_OFFSET;
 		shadow = false;
 	}
-	otp = offset / sizeof(u32);
+	otp = offs / sizeof(u32);
 
 	if (otp < 0 || (otp + nb_otp - 1) > BSEC_OTP_MAX_VALUE) {
 		dev_err(dev, "wrong value for otp, max value : %i\n",
@@ -393,12 +394,13 @@ static int stm32mp_bsec_write(struct udevice *dev, int offset,
 	bool shadow = true;
 	int nb_otp = size / sizeof(u32);
 	int otp;
+	unsigned int offs = offset;
 
-	if (offset >= STM32_BSEC_OTP_OFFSET) {
-		offset -= STM32_BSEC_OTP_OFFSET;
+	if (offs >= STM32_BSEC_OTP_OFFSET) {
+		offs -= STM32_BSEC_OTP_OFFSET;
 		shadow = false;
 	}
-	otp = offset / sizeof(u32);
+	otp = offs / sizeof(u32);
 
 	if (otp < 0 || (otp + nb_otp - 1) > BSEC_OTP_MAX_VALUE) {
 		dev_err(dev, "wrong value for otp, max value : %d\n",
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
