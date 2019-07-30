Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 066917AF88
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7434C35E02
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11822C35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:28 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHGRuI001299; Tue, 30 Jul 2019 19:17:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ueGblMLurVCQ3UfIkvzqMrWl5M8n03UcQddrzdolQBg=;
 b=l427JzljVFycota3bTEu+2fova+z00JRDdB98i2U6et0L9m4XB2f6artMDqlgMsspXMg
 BoNYKwbq3umYKji4N92NUAJSLYN4KbUUyFV2SqMJS6A4ah1cS6+vbyylire47TFEqrCT
 jEIkQTA3rd/3h4/OCK3UNZ5CkSdiZ0sPGLOl2RO8WKsw20+Hyr+5wYNTA6qsT8uysUuL
 oDPjBA0m+LgTMmcNTVWS/4wCb2LCUC4auXPgM3LUtMYR5h0tuFrZnWMAB7+k2jAN4sv/
 XX6rNDbPXfhqcurE1L/AICkMDJRo5ui67yLAza9tcqBz78F428ZBvy1bAtsTDA8xjld1 SQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0ccwkf9x-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:27 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D243C31;
 Tue, 30 Jul 2019 17:17:26 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE09A29B3;
 Tue, 30 Jul 2019 17:17:26 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:26 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:26
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:31 +0200
Message-ID: <1564507016-16570-24-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 23/48] stm32mp1: configs: add BACKLIGHT_GPIO
	support
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

Backlight of panel raydium RM68200 is controlled by a simple gpio,
thus we activate the support for the needed driver.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/stm32mp15_basic_defconfig   | 1 +
 configs/stm32mp15_optee_defconfig   | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 3 files changed, 3 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 7e5ae45..ca7e91c 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -120,4 +120,5 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0483
 CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_DM_VIDEO=y
+CONFIG_BACKLIGHT_GPIO=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
index 0860a26..f480c3d 100644
--- a/configs/stm32mp15_optee_defconfig
+++ b/configs/stm32mp15_optee_defconfig
@@ -106,4 +106,5 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0483
 CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_DM_VIDEO=y
+CONFIG_BACKLIGHT_GPIO=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 5855c36..585817e 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -105,4 +105,5 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0483
 CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_DM_VIDEO=y
+CONFIG_BACKLIGHT_GPIO=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
