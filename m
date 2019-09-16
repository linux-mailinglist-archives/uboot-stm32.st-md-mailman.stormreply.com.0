Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C78B4B36B9
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Sep 2019 10:57:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7663BC36B3F
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Sep 2019 08:57:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A14D4C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Sep 2019 08:57:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8G8u68m002519; Mon, 16 Sep 2019 10:57:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=ViV+aKbqHcLH3S7BbnIhnRJvMXtDs+dADFRcoWZ1kdg=;
 b=laI35aTS6cz+SA0+wpfKvHp2j+PXLo+zf+x434xilUjlVpBtoqp8jB+Zzr6xjwv2+oxb
 H/zSi8D+GfnKIYMInjqaukRi+iuynZbenLl1u5GztIs7k5UV5NEcbPdH5Qljw+Sh7kQS
 LQnR2oBr4ZrQZ9SkRqrthnfKIRKmO3huac/Y1mXIxP/C6z+LoXqO+ux4C7Qu6HFnze+v
 75Cixj8ov/6/2WCjQBNrKgNwBuSu2I54gSA7TFYIfsIYt05tcvYeB26mnE9ErubPpiIl
 V2V5nHHOzxsoEPF6Vm8gBZBhBpXmdD6GmP9Tm/d4sREojAABsnfJkKC0aaEhe962VaBW iQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v0q3fj17x-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 16 Sep 2019 10:57:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9EBBF4D;
 Mon, 16 Sep 2019 08:57:00 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 639A02B8ED9;
 Mon, 16 Sep 2019 10:56:59 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 16 Sep
 2019 10:56:59 +0200
Received: from localhost (10.201.23.73) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 16 Sep 2019 10:56:57
 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 16 Sep 2019 10:56:51 +0200
Message-ID: <20190916085651.5009-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.23.73]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-16_05:2019-09-11,2019-09-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH] configs: stm32f746-disco: Fix ramdisk_addr_r
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

Set ramdisk_addr_r to 0xC0600000.

Reported-by: Christophe Priouzeau <christophe.priouzeau@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 include/configs/stm32f746-disco.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
index a24127d1a7..cc26f83e74 100644
--- a/include/configs/stm32f746-disco.h
+++ b/include/configs/stm32f746-disco.h
@@ -55,7 +55,7 @@
 			"pxefile_addr_r=0xC0008000\0" \
 			"fdt_high=0xffffffffffffffff\0"		\
 			"initrd_high=0xffffffffffffffff\0"	\
-			"ramdisk_addr_r=0xD0900000\0"		\
+			"ramdisk_addr_r=0xC0600000\0"		\
 			BOOTENV
 
 /*
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
