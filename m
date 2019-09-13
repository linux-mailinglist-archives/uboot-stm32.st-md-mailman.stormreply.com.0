Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD92B21C0
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 16:19:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AE72C35E03
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 14:19:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDAD1C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2019 14:19:48 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8DEGLss017358; Fri, 13 Sep 2019 16:19:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=MyE/L/dj1C2oyNN76DmW5RQcBggFwqDJyuukysfDSxY=;
 b=RJp+mfvZsuSBPYcJRwwhtJxS9erLG4Gzs/cvIZwwGRUQGX/m/UPrTOivmbbwmibzoYCQ
 sOJEVHvofD5KTY9TwBol7XDaaqU+WsI75Kkp7v3k6xyRiORFU8f8a8785xtThrnh14GN
 aDJ1vmppZYeeNkZ4Xbzvdv+/75/SHbfelXxZZKfp3TauwiQmn8JvaAeTmsG6FhHtSkuc
 3SohYgnjd60jB0FLU4gGTKHEgkjBK38pzbgcjt05fEr0V/krGg5YzGpAFYlNG527u7nd
 SRdm97KHc43FSVclDAhFk/paIQfSgJ/cMqxPlJOLcWngqpMNV6JSdX6husprdYdu708f Ng== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uyte2wddh-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 13 Sep 2019 16:19:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DBC5156;
 Fri, 13 Sep 2019 14:19:44 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 98BF42C7F41;
 Fri, 13 Sep 2019 16:19:44 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep
 2019 16:19:44 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep 2019 16:19:44
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 13 Sep 2019 16:19:25 +0200
Message-ID: <20190913141930.15784-10-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913141930.15784-2-patrick.delaunay@st.com>
References: <20190913141930.15784-2-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_07:2019-09-11,2019-09-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: [Uboot-stm32] [PATCH 09/14] dfu: add callback for flush and
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
index 2697235c24..f12c5afc66 100644
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
+ * The purpose of the dfu_flush_callback() function is to
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
index 4de7d35914..5d85cc35ef 100644
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
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
