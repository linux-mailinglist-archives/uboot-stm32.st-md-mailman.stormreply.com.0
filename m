Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D31D5C71
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 09:28:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2F38C36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 07:28:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B443C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 07:28:33 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9E7QTlQ006852; Mon, 14 Oct 2019 09:28:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=L+f/YZxIlBVUuyTnzA9tBpGZmiqF4Ea9TKBiPDIwwcQ=;
 b=EF2j8Z6VzuHNrDDVDsDVeIEM4S6WfgZaedVXoSX4dQTp9GRIQ6lyCVw54BuUawHuvzJj
 3ULK8vhIlJbYyOYG8/9tarBZA+Jyz4A3Tnirvor1/CqCMbNmQKY0JPqAGaLzvTT0/eP3
 2vtoSlf7Lbi1sCLsIFKFlYOyUKjhMv0+e34S5MUiiy7cXhkJE0XL2j4XOf7R93ZzXDA1
 yLEkTCTQsmZbp9TqnMtK6dbwNNwMfNIxbHozse08+r67mb9eV4vb0mT5NUu/XWfDCExt
 9IQnmte++yDtHQQANWVX3A4ZNb6149G5oJCP+b0BtXFNzdGeS89m63CjEjxgw0dH89L8 Jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vk4a10up6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 09:28:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 11F00100034;
 Mon, 14 Oct 2019 09:28:32 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 07F2E2ADFFB;
 Mon, 14 Oct 2019 09:28:32 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct
 2019 09:28:32 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct 2019 09:28:31
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 14 Oct 2019 09:28:07 +0200
Message-ID: <20191014072812.21843-11-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191014072812.21843-1-patrick.delaunay@st.com>
References: <20191014072812.21843-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_06:2019-10-10,2019-10-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: [Uboot-stm32] [PATCH v3 10/15] dfu: add callback for flush and
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

Changes in v3: None
Changes in v2:
- Update dfu documentation for callbacks
- Update callbacks comment after Lukasz review

 doc/README.dfu    |  8 ++++++++
 drivers/dfu/dfu.c | 19 +++++++++++++++++++
 include/dfu.h     | 22 ++++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/doc/README.dfu b/doc/README.dfu
index 43a6f311d6..558d347c26 100644
--- a/doc/README.dfu
+++ b/doc/README.dfu
@@ -143,6 +143,14 @@ Commands:
        mtd <dev>=<alt1>;....;<altN>
        virt <dev>=<alt1>;....;<altN>
 
+Callbacks:
+  The weak callback functions can be implemented to manage specific behavior
+  - dfu_initiated_callback  : called when the DFU transaction is started,
+                              used to initiase the device
+  - dfu_flush_callback      : called at the end of the DFU write after DFU
+                              manifestation, used to manage the device when
+                              DFU transaction is closed
+
 Host tools:
   When U-Boot runs the dfu stack, the DFU host tools can be used
   to send/receive firmwares on each configurated alternate.
diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
index 2697235c24..38aecd3a05 100644
--- a/drivers/dfu/dfu.c
+++ b/drivers/dfu/dfu.c
@@ -22,6 +22,22 @@ static int dfu_alt_num;
 static int alt_num_cnt;
 static struct hash_algo *dfu_hash_algo;
 
+/*
+ * The purpose of the dfu_flush_callback() function is to
+ * provide callback for dfu user
+ */
+__weak void dfu_flush_callback(struct dfu_entity *dfu)
+{
+}
+
+/*
+ * The purpose of the dfu_initiated_callback() function is to
+ * provide callback for dfu user
+ */
+__weak void dfu_initiated_callback(struct dfu_entity *dfu)
+{
+}
+
 /*
  * The purpose of the dfu_usb_get_reset() function is to
  * provide information if after USB_DETACH request
@@ -263,6 +279,7 @@ int dfu_transaction_initiate(struct dfu_entity *dfu, bool read)
 	}
 
 	dfu->inited = 1;
+	dfu_initiated_callback(dfu);
 
 	return 0;
 }
@@ -282,6 +299,8 @@ int dfu_flush(struct dfu_entity *dfu, void *buf, int size, int blk_seq_num)
 		printf("\nDFU complete %s: 0x%08x\n", dfu_hash_algo->name,
 		       dfu->crc);
 
+	dfu_flush_callback(dfu);
+
 	dfu_transaction_cleanup(dfu);
 
 	return ret;
diff --git a/include/dfu.h b/include/dfu.h
index 4de7d35914..564966333f 100644
--- a/include/dfu.h
+++ b/include/dfu.h
@@ -183,6 +183,28 @@ int dfu_read(struct dfu_entity *de, void *buf, int size, int blk_seq_num);
 int dfu_write(struct dfu_entity *de, void *buf, int size, int blk_seq_num);
 int dfu_flush(struct dfu_entity *de, void *buf, int size, int blk_seq_num);
 
+/**
+ * dfu_initiated_callback - weak callback called on DFU transaction start
+ *
+ * It is a callback function called by DFU stack when a DFU transaction is
+ * initiated. This function allows to manage some board specific behavior on
+ * DFU targets.
+ *
+ * @param dfu - pointer to the dfu_entity, which should be initialized
+ *
+ */
+void dfu_initiated_callback(struct dfu_entity *dfu);
+/**
+ * dfu_flush_callback - weak callback called at the end of the DFU write
+ *
+ * It is a callback function called by DFU stack after DFU manifestation.
+ * This function allows to manage some board specific behavior on DFU targets
+ *
+ * @param dfu - pointer to the dfu_entity, which should be flushed
+ *
+ */
+void dfu_flush_callback(struct dfu_entity *dfu);
+
 /*
  * dfu_defer_flush - pointer to store dfu_entity for deferred flashing.
  *		     It should be NULL when not used.
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
