Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A927743E467
	for <lists+uboot-stm32@lfdr.de>; Thu, 28 Oct 2021 16:57:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 705FDC5E2BB;
	Thu, 28 Oct 2021 14:57:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E399C5E2BB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Oct 2021 14:57:35 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SCR0LI000352; 
 Thu, 28 Oct 2021 16:57:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=W5CstY8mLxDQqXRgHr0o9ye/QwyAWNy2INon+VRr8P0=;
 b=BcNjrtXG4KRBkd/HGACWXfI4azHQplfWUbfmq+w7p8RHSVZs1GDs+5Hbz/k0JezxTjlj
 Zs972LU51npHak/LcUQ8eDzrTLpB6Bio9U2Odm9C2HtUdNGdukUvwNGpuKsvWeg8H0c4
 jfFjGesPW2sYt+qGqgvLoA99dxnK19j35Cj7yNUWVWEk42pq+NpBgOQ3RLvSs+Ko9PwV
 Sxh+pL7rQi1abgdrvRubBdrB0nGRtv9lwAmuMX4c1XNMmMmrjEJQrsmVkp3tqRZvSY8h
 WOCE/E8tMeNBuj9ZQdQjchNX5Ua3UADHu6GsvgNZMeTh6HX6iPdAgOVh6fIqci5lLz2W 0g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bym0gkqet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 16:57:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 61B5310002A;
 Thu, 28 Oct 2021 16:57:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 59D4F21152E;
 Thu, 28 Oct 2021 16:57:33 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 28 Oct 2021 16:57:32
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 28 Oct 2021 16:57:26 +0200
Message-ID: <20211028165656.v2.5.I5eac50ee83efb64ab5b2b00e0884f9f3d5153b7d@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028165656.v2.1.I8edf9d3b9867194e233bba15ce32a1477ce4@changeid>
References: <20211028165656.v2.1.I8edf9d3b9867194e233bba15ce32a1477ce4@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_01,2021-10-26_01,2020-04-07_01
Cc: Jean-Philippe ROMAIN <jean-philippe.romain@st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 5/5] stm32mp15: deactivate
	CONFIG_SCMI_AGENT_MAILBOX
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

Deactivate the SCMI agent mailbox which is not used on STM32MP15
platforms.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
---

(no changes since v1)

 configs/stm32mp15_defconfig         | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index 701b1510c5..e4989efad1 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -75,6 +75,7 @@ CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
 CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
+# CONFIG_SCMI_AGENT_MAILBOX is not set
 CONFIG_GPIO_HOG=y
 CONFIG_DM_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_STM32=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index b4ed090e3f..a3d2a6e1b4 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -76,6 +76,7 @@ CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
 CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
+# CONFIG_SCMI_AGENT_MAILBOX is not set
 CONFIG_GPIO_HOG=y
 CONFIG_DM_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_STM32=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
