Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BDB6091A
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jul 2019 17:20:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EBB7C36B3F
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jul 2019 15:20:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07992C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2019 15:20:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65FGCR5002463; Fri, 5 Jul 2019 17:20:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=aDRp81Xa9Qeh/Xu0lEo045yLXSP7Pch20JS3brsG3k0=;
 b=yAz+1zAlfphzZ20wmZ6QXQEwscE5ca8K7W/ixj6sGwYDKNsW8raJ1tQGQiSEo1zy9bcj
 jhoK2/Ol4jtfJhW7Bv4Yhr8Lq5LSdLdSmVyhrsCqMotRDYYBxgaMgFNRN4nq3nFL+tSM
 CfMaSRFfmhyCdVH0lIJVJuGoua57Tb060R+8s0SFYDbwWHCWkYwmQd7e5vZcw7POjwsE
 y2M/B05G1US0ALC9aLVO6sIh6J49K5UJeSWS5Gm/nCCh+Aa4EHa2UVBUL2+xWvnqKlbB
 zakZUBV6KCQWp6y06b9S1fd39AueXLx6Xlyu1NTgE9zRJEf/49c6TaXsZKuBqwmkDcaU jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tdxvjkgb6-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 05 Jul 2019 17:20:29 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 818FE31;
 Fri,  5 Jul 2019 15:20:28 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6F0D84FB8;
 Fri,  5 Jul 2019 15:20:28 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019
 17:20:28 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019 17:20:27
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Jul 2019 17:20:08 +0200
Message-ID: <1562340023-8516-2-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
References: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-05_05:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 01/16] stm32mp1: deactivate WATCHDOG in
	defconfig
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

Deactivate WATCHDOG by default in u-boot to avoid issue to boot kernel
and rootfs without the needed daemon to reload it.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 configs/stm32mp15_basic_defconfig   | 2 --
 configs/stm32mp15_trusted_defconfig | 2 --
 2 files changed, 4 deletions(-)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 4aa184f..b1fc3a2 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -110,5 +110,3 @@ CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0483
 CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
 CONFIG_USB_GADGET_DWC2_OTG=y
-CONFIG_WDT=y
-CONFIG_WDT_STM32MP=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 5fe9477..ae9bc76 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -100,5 +100,3 @@ CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0483
 CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
 CONFIG_USB_GADGET_DWC2_OTG=y
-CONFIG_WDT=y
-CONFIG_WDT_STM32MP=y
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
