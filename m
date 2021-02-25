Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C88B324FEE
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Feb 2021 13:43:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52A5AC57B58;
	Thu, 25 Feb 2021 12:43:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C329C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 12:43:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11PCaVqJ001995; Thu, 25 Feb 2021 13:43:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=/6CqcYO+s1IteT2QdABzJkAPW/xPtc4Oj/GAeMUzvJY=;
 b=NRCQyP1WHwQuTb/StZSFayXh2b+0ocvr85YliaYEHlaABApKk4Gb0L+kVtL4lzFtHqLR
 uR9HB/yv0KMIPRqduC0ZBk9S9tp2RjOHgk9iInQUgTix44XzERfZkLQfime3kDflvHHC
 ejMP/GyTAW7/xyxihIlY3ygfmE6KHK83nZR78RbjttUjjouM7/S/vDEQ3b6ET+uy/d3X
 mJBQPhJAh8oNvIjpxR8qPntBVbFXE6d8oO3fcvF7i0+yMtYChMUa8cmnjarJ3P6aCbhw
 SiqmSH9NU1LI/TalPlSNMsG/jQhZwuoMSKHR60HuHPG1fKoqvPqLrxWqvEjKq0bngJUE Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66vnpr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 13:43:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 92A4E10002A;
 Thu, 25 Feb 2021 13:43:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89E0222D635;
 Thu, 25 Feb 2021 13:43:10 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 25 Feb 2021 13:43:10
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Feb 2021 13:43:07 +0100
Message-ID: <20210225134305.1.Iec7b40977c201f0a99cbaa730765c4888e950074@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-25_07:2021-02-24,
 2021-02-25 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] stm32mp: bsec: manage clock when present in
	device tree
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

Enable the clocks during bsec probe when they are present in device tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/bsec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index 88c7aec8b4..fe39bd80cf 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -6,6 +6,7 @@
 #define LOG_CATEGORY UCLASS_MISC
 
 #include <common.h>
+#include <clk.h>
 #include <dm.h>
 #include <log.h>
 #include <misc.h>
@@ -490,6 +491,15 @@ static int stm32mp_bsec_probe(struct udevice *dev)
 {
 	int otp;
 	struct stm32mp_bsec_plat *plat;
+	struct clk_bulk clk_bulk;
+	int ret;
+
+	ret = clk_get_bulk(dev, &clk_bulk);
+	if (!ret) {
+		ret = clk_enable_bulk(&clk_bulk);
+		if (ret)
+			return ret;
+	}
 
 	/*
 	 * update unlocked shadow for OTP cleared by the rom code
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
