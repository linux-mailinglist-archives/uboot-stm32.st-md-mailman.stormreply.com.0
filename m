Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DD943E6EF
	for <lists+uboot-stm32@lfdr.de>; Thu, 28 Oct 2021 19:13:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55053C5E2C4;
	Thu, 28 Oct 2021 17:13:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1511DC5E2C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Oct 2021 17:13:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SCR0aV000352; 
 Thu, 28 Oct 2021 19:13:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=XlN+ZTydFnjrd8YLWYOAKADpcQRkXA68fdj5ND/NZRM=;
 b=DGUxiRxxzDjJ1qly+6eQmGIeCVOQfRiqDlOvTJOx/rEAxrzW/6v+1YKt0bNGEGXQWnBj
 2k/QwW8wAYyDofpWtTW974m3cIRkmUeQNdpTNLW+pdSd4HCYHuuoZ48FLXZmya6YhyXG
 EMf3aKBYu0hiU9YOYwOZ0unNnwJBEn+gaqbtfQc1UkTq62+/gltuf8hiWGYi60AQxrEz
 6yAIkoJ2rdN0EpR6m08vGlgAKIxmhRpNYUtkthfXFf3FtkuwhuX+Adp7E/Zo2Dz6QVvt
 Frsviv8mwOCf8p2v+EKILU7ri/LQk24sBYUGyc4avlfWHQ+5JfybbNVsxrrzvsKNZJo3 zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bym0gm9ku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 19:13:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 07BD310002A;
 Thu, 28 Oct 2021 19:13:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F22A8226FD0;
 Thu, 28 Oct 2021 19:13:30 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 28 Oct 2021 19:13:30
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 28 Oct 2021 19:13:15 +0200
Message-ID: <20211028191222.v3.4.Ib2e58ee67f4d023823d8b5404332dc4d7e847277@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028191222.v3.1.I8edf9d3b9867194e233bba15ce32a1477ce4@changeid>
References: <20211028191222.v3.1.I8edf9d3b9867194e233bba15ce32a1477ce4@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_04,2021-10-26_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>, Wolfgang Denk <wd@denx.de>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 4/5] firmware: scmi: add configs to select
	the supported agents
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

Add two configs CONFIG_SCMI_AGENT_MAILBOX and CONFIG_SCMI_AGENT_SMCCC
to select the supported agents as all the agents are not supported.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
---

Changes in v3:
- add missing CONFIG_ header in makefile variable

Changes in v2:
- fix typo s/compatibble/compatible/
- add acked by Etienne Carriere for the series

 drivers/firmware/scmi/Kconfig  | 16 ++++++++++++++++
 drivers/firmware/scmi/Makefile |  4 ++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/scmi/Kconfig b/drivers/firmware/scmi/Kconfig
index c3a109beac..c33de87cd0 100644
--- a/drivers/firmware/scmi/Kconfig
+++ b/drivers/firmware/scmi/Kconfig
@@ -17,3 +17,19 @@ config SCMI_FIRMWARE
 	  based on message exchange. Messages can be exchange over tranport
 	  channels as a mailbox device or an Arm SMCCC service with some
 	  piece of identified shared memory.
+
+config SCMI_AGENT_MAILBOX
+	bool "Enable SCMI agent mailbox"
+	depends on SCMI_FIRMWARE && DM_MAILBOX
+	default y
+	help
+	  Enable the SCMI communication channel based on mailbox
+	  for compatible "arm,scmi".
+
+config SCMI_AGENT_SMCCC
+	bool "Enable SCMI agent SMCCC"
+	depends on SCMI_FIRMWARE && ARM_SMCCC
+	default y
+	help
+	  Enable the SCMI communication channel based on Arm SMCCC service for
+	  compatible "arm,scmi-smc".
diff --git a/drivers/firmware/scmi/Makefile b/drivers/firmware/scmi/Makefile
index 966475ec10..7d6f4df1de 100644
--- a/drivers/firmware/scmi/Makefile
+++ b/drivers/firmware/scmi/Makefile
@@ -1,5 +1,5 @@
 obj-y	+= scmi_agent-uclass.o
 obj-y	+= smt.o
-obj-$(CONFIG_ARM_SMCCC)		+= smccc_agent.o
-obj-$(CONFIG_DM_MAILBOX)	+= mailbox_agent.o
+obj-$(CONFIG_SCMI_AGENT_SMCCC)		+= smccc_agent.o
+obj-$(CONFIG_SCMI_AGENT_MAILBOX)	+= mailbox_agent.o
 obj-$(CONFIG_SANDBOX)		+= sandbox-scmi_agent.o sandbox-scmi_devices.o
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
