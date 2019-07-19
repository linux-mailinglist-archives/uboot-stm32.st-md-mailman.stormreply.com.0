Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7731B6E5F2
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 14:57:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46F6EC0692B
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 12:57:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6E57C030D4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 12:57:45 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6JCqjFr014622; Fri, 19 Jul 2019 14:57:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=bW+ZW59g78pWpqGQVloIEAQk6ZYHOm9coHVC+xP1/3c=;
 b=VpVKf5tvigJBfWzAbVCnC4fi8EGUY44W7MjzfyRhU4wtzp34EXzFi3tENRiLcYHM0thu
 aCOpy3c3NhPxJgHaslBXbUQ+ykcTt6GfuSIJRPigMwf+e9/LW8p2pPTZnyksgsqH5u5H
 kvlzS1i/ny80+5204pF0VKOKN6UxMVbxfOM0FxC9+fWsHl/M/F2pPDPB+x/IsnI7qVpG
 VtnCBX4K2emi3bgRMWxV/pzk4QRE11xBF/pBcPOtAZGvv7EtoEQmBp+MSJxWbxNJnKjG
 ua7ZH6/By50lu8RyxPEemx6iyxr7PEaElbYpbQU1w4/tFde8dEjL+aBidOSSTGc2n8AL zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tq4s28gvb-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 14:57:41 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 94ED75C;
 Fri, 19 Jul 2019 12:57:40 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E9EB2D52;
 Fri, 19 Jul 2019 12:57:40 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul
 2019 14:57:40 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul 2019 14:57:40
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jul 2019 14:57:21 +0200
Message-ID: <1563541046-6432-10-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
References: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: [Uboot-stm32] [RFC PATCH 09/14] dfu: add callback for flush and
	initiated operation
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

Add weak callback to allow board specific behavior
- flush
- initiated

This patch prepare usage of DFU back end for communication with
STM32CubeProgrammer on stm32mp1 platform with stm32prog command.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/dfu/dfu.c | 19 +++++++++++++++++++
 include/dfu.h     |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
index a960b6e..e642b09 100644
--- a/drivers/dfu/dfu.c
+++ b/drivers/dfu/dfu.c
@@ -22,6 +22,22 @@ static int alt_num_cnt;
 static struct hash_algo *dfu_hash_algo;
 
 /*
+ * The purpose of the dfu_flush_callback() function is to
+ * provide callback for dfu user
+ */
+__weak void dfu_flush_callback(struct dfu_entity *dfu)
+{
+}
+
+/*
+ * The purpose of the dfu_flush_callback() function is to
+ * provide callback for dfu user
+ */
+__weak void dfu_initiated_callback(struct dfu_entity *dfu)
+{
+}
+
+/*
  * The purpose of the dfu_usb_get_reset() function is to
  * provide information if after USB_DETACH request
  * being sent the dfu-util performed reset of USB
@@ -262,6 +278,7 @@ int dfu_transaction_initiate(struct dfu_entity *dfu, bool read)
 	}
 
 	dfu->inited = 1;
+	dfu_initiated_callback(dfu);
 
 	return 0;
 }
@@ -281,6 +298,8 @@ int dfu_flush(struct dfu_entity *dfu, void *buf, int size, int blk_seq_num)
 		printf("\nDFU complete %s: 0x%08x\n", dfu_hash_algo->name,
 		       dfu->crc);
 
+	dfu_flush_callback(dfu);
+
 	dfu_transaction_cleanup(dfu);
 
 	return ret;
diff --git a/include/dfu.h b/include/dfu.h
index 4de7d35..5d85cc3 100644
--- a/include/dfu.h
+++ b/include/dfu.h
@@ -182,6 +182,8 @@ bool dfu_usb_get_reset(void);
 int dfu_read(struct dfu_entity *de, void *buf, int size, int blk_seq_num);
 int dfu_write(struct dfu_entity *de, void *buf, int size, int blk_seq_num);
 int dfu_flush(struct dfu_entity *de, void *buf, int size, int blk_seq_num);
+void dfu_flush_callback(struct dfu_entity *dfu);
+void dfu_initiated_callback(struct dfu_entity *dfu);
 
 /*
  * dfu_defer_flush - pointer to store dfu_entity for deferred flashing.
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
