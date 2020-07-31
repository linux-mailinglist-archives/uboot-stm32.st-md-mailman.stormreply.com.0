Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D241123408E
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 09:54:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AABAC36B36
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 07:54:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67B13C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 07:54:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06V7mWGK016701; Fri, 31 Jul 2020 09:54:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=a/nSY0aWXr2zbqWe/XzNm83fASmFRn7/0ara7KCZBYc=;
 b=yWcUJq3l8IDHz4HvXOxWTwKF8V2hfLi7szvKpj+uu+IGdtT9DowIK1dC0X9uA8qAFrke
 1CS7qTygZCvk/l11FN6su/BvkYhl6kJ25nKjV9nImDKJPmO81UH/m0nfPy4HgCelgX5N
 mrzMnF+BDY8s+vx/8fTTyNxpq78U9xb4G+xABpAdPMwXaIi5qu4kP4omXZpUDOE7QT6X
 kT+aIv3xvyJyb/kN3ksOGwrlDPib/rkitkX5r9o2DM9HFUX5M9QgD+wDNsBl9Px6k+kp
 Q8iJ0STuvRfUxPomq/dsGv5s+Wdv2i5Z6md9Y8v2VVPRgXIUenZImZrrDk6WMTyQspZP YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gbmgn6vg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 09:54:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EF9D2100034;
 Fri, 31 Jul 2020 09:54:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E76C322109C;
 Fri, 31 Jul 2020 09:54:51 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jul 2020 09:54:51 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Jul 2020 09:53:36 +0200
Message-ID: <1596182024-18181-4-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
References: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_02:2020-07-31,
 2020-07-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 03/11] mtd: rawnand: stm32_fmc2: use
	FMC2_TIMEOUT_5S for timeouts
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

FMC2_TIMEOUT_5S will be used each time that we need to wait.
It was seen, during stress tests in an overloaded system,
that we could be close to 1 second, even if we never met this
value. To be safe, FMC2_TIMEOUT_MS is set to 5 seconds.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index f43e3ec..2e947a3 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -131,6 +131,8 @@
 
 #define FMC2_NSEC_PER_SEC		1000000000L
 
+#define FMC2_TIMEOUT_5S			5000000
+
 enum stm32_fmc2_ecc {
 	FMC2_ECC_HAM = 1,
 	FMC2_ECC_BCH4 = 4,
@@ -339,7 +341,7 @@ static int stm32_fmc2_ham_calculate(struct mtd_info *mtd, const u8 *data,
 	int ret;
 
 	ret = readl_poll_timeout(fmc2->io_base + FMC2_SR, sr,
-				 sr & FMC2_SR_NWRF, 10000);
+				 sr & FMC2_SR_NWRF, FMC2_TIMEOUT_5S);
 	if (ret < 0) {
 		pr_err("Ham timeout\n");
 		return ret;
@@ -424,7 +426,7 @@ static int stm32_fmc2_bch_calculate(struct mtd_info *mtd, const u8 *data,
 
 	/* Wait until the BCH code is ready */
 	ret = readl_poll_timeout(fmc2->io_base + FMC2_BCHISR, bchisr,
-				 bchisr & FMC2_BCHISR_EPBRF, 10000);
+				 bchisr & FMC2_BCHISR_EPBRF, FMC2_TIMEOUT_5S);
 	if (ret < 0) {
 		pr_err("Bch timeout\n");
 		return ret;
@@ -472,7 +474,7 @@ static int stm32_fmc2_bch_correct(struct mtd_info *mtd, u8 *dat,
 
 	/* Wait until the decoding error is ready */
 	ret = readl_poll_timeout(fmc2->io_base + FMC2_BCHISR, bchisr,
-				 bchisr & FMC2_BCHISR_DERF, 10000);
+				 bchisr & FMC2_BCHISR_DERF, FMC2_TIMEOUT_5S);
 	if (ret < 0) {
 		pr_err("Bch timeout\n");
 		return ret;
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
