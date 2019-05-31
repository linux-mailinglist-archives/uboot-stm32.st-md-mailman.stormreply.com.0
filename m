Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A0230E9A
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 May 2019 15:12:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41535C0855A
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 May 2019 13:12:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 563C5C08554
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2019 13:11:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4VDA60Q005076; Fri, 31 May 2019 15:11:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=yhm4yihKvd+MHvpUooUH7ul59BB2jb1W/BasDHrDfI4=;
 b=gYSQry9NMEQrG5RITKThmT3vP8gHQSjUq3dQp+8HiEeDjq9zwVKVJt3TeKAw6HyXqjnL
 FWqQwVgnum1wwL4AEZDy0YwHiBrKFwCnX+oBegJgkKba6UIYwUJYEC3KecmdHklt5fNA
 rfG7YGMy3W3CYGygdm5a33cCtYe45i4CvDlGpNm4ky5TjVjBK4nOH60Q0v9ofvclSfYF
 8zcrp6Z4jN2TdvozjjhXqNyzmzCTVU2agorqtrQHMrqM90VwErn/wexIiHiEZ1hPyHYp
 45V4jGGD3M2ehamWH76yncoLQk+kuf5p8aDQLgnUOnC3CaSOsGfghkeNOn8wdD7+ZTQa 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2spu60vaa1-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 31 May 2019 15:11:58 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0727831;
 Fri, 31 May 2019 13:11:52 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E4F4229C5;
 Fri, 31 May 2019 13:11:51 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 31 May
 2019 15:11:51 +0200
Received: from localhost (10.201.23.25) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 31 May 2019 15:11:51
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>
Date: Fri, 31 May 2019 15:11:36 +0200
Message-ID: <1559308296-17027-8-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
References: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-31_08:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH v3 7/7] configs: stm32mp15: enable stm32
	remoteproc
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

Activate the remote processor support for stm32mp15 configs.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 configs/stm32mp15_basic_defconfig   | 2 ++
 configs/stm32mp15_trusted_defconfig | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 0ea9dff..5185072 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -67,6 +67,8 @@ CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_DM_REGULATOR_GPIO=y
 CONFIG_DM_REGULATOR_STM32_VREFBUF=y
 CONFIG_DM_REGULATOR_STPMIC1=y
+CONFIG_REMOTEPROC=y
+CONFIG_REMOTEPROC_STM32_COPRO=y
 CONFIG_SERIAL_RX_BUFFER=y
 CONFIG_STM32_SERIAL=y
 CONFIG_USB=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 3c2bb75..037d7e8 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -57,6 +57,8 @@ CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_DM_REGULATOR_GPIO=y
 CONFIG_DM_REGULATOR_STM32_VREFBUF=y
 CONFIG_DM_REGULATOR_STPMIC1=y
+CONFIG_REMOTEPROC=y
+CONFIG_REMOTEPROC_STM32_COPRO=y
 CONFIG_SERIAL_RX_BUFFER=y
 CONFIG_STM32_SERIAL=y
 CONFIG_USB=y
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
