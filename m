Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F49E9C6F
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 14:38:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7303AC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 13:38:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C7BDC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 13:38:48 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9UDboMh008191; Wed, 30 Oct 2019 14:38:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=UkOIBLoaoVS951mArkeiPBztrOouEEjsYjXeetQKMjI=;
 b=nHaDphk8ykVk80GtUj8n/jJd1XUlMwvprmRHwgjEbg0uE9pgul6oI2W8K4MfC3bUYbmI
 /zQcAPcjVL36fOQqwzkGJa+tIuhEVoRoujSEFp/fMrIeDAAr2S1ZSack+bXNjF92xawc
 PT0mKeTyXIBDu2MfORR2TyKkLysFzBWtw6YbQx2Mt+jbKySgzxsB1A241uuRtN0wdFMc
 4VUih4G1ttgUe9NE67PQCcaUBgGR9AsfyQxZKqjMDA337W9WjqEOKnObgsK4AdKjm2+J
 s20Hc8DMk9Xg5mYoaKSHq8tycjbMB+aXE3wYxY/oqH8Y15FOWXpUNR7y0A1mKFjVzPX+ 7g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vxwhe3xuk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 14:38:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AA5E7100034;
 Wed, 30 Oct 2019 14:38:46 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A07132BEC75;
 Wed, 30 Oct 2019 14:38:46 +0100 (CET)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 30 Oct
 2019 14:38:46 +0100
Received: from localhost (10.201.23.25) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 30 Oct 2019 14:38:45
 +0100
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, "Lokesh
 Vutla" <lokeshvutla@ti.com>, Suman Anna <s-anna@ti.com>
Date: Wed, 30 Oct 2019 14:38:29 +0100
Message-ID: <1572442713-26353-3-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572442713-26353-1-git-send-email-fabien.dessenne@st.com>
References: <1572442713-26353-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-30_06:2019-10-30,2019-10-30 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH v2 2/6] stm32mp1: declare backup registers for
	coprocessor
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

Use the backup register #17 as coprocessor resource table address and
backup register #18 as coprocessor state.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 arch/arm/mach-stm32mp/include/mach/stm32.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index b3e9ccc..88126b8 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -86,9 +86,18 @@ enum boot_device {
 #define TAMP_BACKUP_REGISTER(x)		(STM32_TAMP_BASE + 0x100 + 4 * x)
 #define TAMP_BACKUP_MAGIC_NUMBER	TAMP_BACKUP_REGISTER(4)
 #define TAMP_BACKUP_BRANCH_ADDRESS	TAMP_BACKUP_REGISTER(5)
+#define TAMP_COPRO_RSC_TBL_ADDRESS	TAMP_BACKUP_REGISTER(17)
+#define TAMP_COPRO_STATE		TAMP_BACKUP_REGISTER(18)
 #define TAMP_BOOT_CONTEXT		TAMP_BACKUP_REGISTER(20)
 #define TAMP_BOOTCOUNT			TAMP_BACKUP_REGISTER(21)
 
+#define TAMP_COPRO_STATE_OFF		0
+#define TAMP_COPRO_STATE_INIT		1
+#define TAMP_COPRO_STATE_CRUN		2
+#define TAMP_COPRO_STATE_CSTOP		3
+#define TAMP_COPRO_STATE_STANDBY	4
+#define TAMP_COPRO_STATE_CRASH		5
+
 #define TAMP_BOOT_MODE_MASK		GENMASK(15, 8)
 #define TAMP_BOOT_MODE_SHIFT		8
 #define TAMP_BOOT_DEVICE_MASK		GENMASK(7, 4)
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
