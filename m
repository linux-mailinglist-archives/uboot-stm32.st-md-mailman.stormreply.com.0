Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7A252A1A2
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 May 2022 14:37:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D03F2C03FC9;
	Tue, 17 May 2022 12:37:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7393FC03FC8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 May 2022 12:37:11 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24HAgtF1030396;
 Tue, 17 May 2022 14:37:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=yq3ewnjaTG3/YS8x6wc0VCLknH12t+6vsLT29l+xHVE=;
 b=HouDpwgLcwhqUL7+9WEpq4Dn/7Wf/NHllR67WL+cZm7fvE8d3sywtY3I54ueRN6lRyPu
 DW/XBfnZ1o9grirfz1q+GtPzyur92b3SYRn0kxLqF7LZ8tqSHSK9SpvWWwVs17mIsjdv
 wFQQvan9f1bDRaIWjwtAGrO2ywLnfYzuL6n+5VNjqSvG1k7cs4q41zOoVyfjV2RcBOS+
 CeEXBX9ZqzoQTPRwADXMJiId8xmQSd1PmY5HKvllXdsjPlsK0+ig/1AYLPLW4oWQPbU2
 IeTRBbvMFpxdr4Fn3+mp58cG4RMK8c0SKlLhmD75djTof6s+ks9YySallyphAxy1LDWI Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23s1fsnx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 May 2022 14:37:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 679C910002A;
 Tue, 17 May 2022 14:37:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D0FBD21ED24;
 Tue, 17 May 2022 14:37:07 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 17 May 2022 14:37:07
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 17 May 2022 14:37:05 +0200
Message-ID: <20220517143655.1.I4d61d5a725e965f1476b26412ed1e8329aa9ba98@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-17_03,2022-05-17_02,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH] dm: core: convert of_machine_is_compatible to
	livetree
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

Replace in the function of_machine_is_compatible(), the used API
fdt_node_check_compatible() by ofnode_device_is_compatible()
to support a live tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/core/device.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/core/device.c b/drivers/core/device.c
index 3ab2583df3..3199d6a1b7 100644
--- a/drivers/core/device.c
+++ b/drivers/core/device.c
@@ -1125,9 +1125,7 @@ bool device_is_compatible(const struct udevice *dev, const char *compat)
 
 bool of_machine_is_compatible(const char *compat)
 {
-	const void *fdt = gd->fdt_blob;
-
-	return !fdt_node_check_compatible(fdt, 0, compat);
+	return ofnode_device_is_compatible(ofnode_root(), compat);
 }
 
 int dev_disable_by_path(const char *path)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
