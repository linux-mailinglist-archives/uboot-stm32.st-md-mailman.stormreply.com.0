Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB5A60E170
	for <lists+uboot-stm32@lfdr.de>; Wed, 26 Oct 2022 15:05:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2080DC03FC6;
	Wed, 26 Oct 2022 13:05:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 617F5C035BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Oct 2022 13:05:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29QCENSj020320;
 Wed, 26 Oct 2022 15:05:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=AnE1ioUQfRXar/lXL2acAG5O5LsIP1XrXO/kn8VGht8=;
 b=nnEgWlj0ZU+8aeIXC5zBv8nDW/oCXCg6ZUL2Ju8nUMWLsuSmF8xwSYGonREGwhvlkKCu
 BVrU8rbbEaFwH3YKO5ZW98IbfKUevr9V9Pjl3QqE3068KfXya2tc42oyKeNJSMsQHiqI
 23r/MunfvKJKWL1gzo1U9uFbaMSZ/RAkXi446mD82SWGEkel94V3FpCduT95V5vzx5vu
 LhFfX+3u310r3lXbfIwLGV7iqAT3IN/Wa36ilA98PEKeWzlOxAKPk7oNyxV7nOZfyjFZ
 uG0PXKrTf9F08lBf5o5zK0izLa8IpFsSYROdliuxT1f1QIWQM6UiXaCY87V75kXafMZ5 +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kebqtt91k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 15:05:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9B812100038;
 Wed, 26 Oct 2022 15:05:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 970E9227885;
 Wed, 26 Oct 2022 15:05:19 +0200 (CEST)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 15:05:18 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 26 Oct 2022 15:05:10 +0200
Message-ID: <20221026150508.1.I1b5ffc3bca09502549c075039f405dceb1646084@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_06,2022-10-26_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] dm: pmic: ignore disabled node in
	pmic_bind_children
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

Ignore the disabled children node in pmic_bind_children() so the
disabled regulators in device tree are not registered.

This patch is based on the dm_scan_fdt_node() code - only the
activated nodes are bound -  and it solves possible issue when a
deactivated regulator is bound, error for duplicated regulator name
for example.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
This patch solves the errors for duplicated regulator names on STM32MP15x
boards since the alignment with Linux device tree with the commit
9157a4ce36b18 ("ARM: dts: stm32: update SCMI dedicated file").

When SCMI is activated in "<board>-scmi.dts" device tree, the 3 regulators
reg11, reg18, usb33 are duplicated (children of scmi_reguls and of
pwr_regulators) even if the children of pwr_regulators are deactivated in
the file arch/arm/dts/stm32mp15-scmi.dtsi.

 drivers/power/pmic/pmic-uclass.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/power/pmic/pmic-uclass.c b/drivers/power/pmic/pmic-uclass.c
index 5dcf6d8079d2..0e2f5e1f4111 100644
--- a/drivers/power/pmic/pmic-uclass.c
+++ b/drivers/power/pmic/pmic-uclass.c
@@ -39,6 +39,10 @@ int pmic_bind_children(struct udevice *pmic, ofnode parent,
 		node_name = ofnode_get_name(node);
 
 		debug("* Found child node: '%s'\n", node_name);
+		if (!ofnode_is_enabled(node)) {
+			debug("  - ignoring disabled device\n");
+			continue;
+		}
 
 		child = NULL;
 		for (info = child_info; info->prefix && info->driver; info++) {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
