Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A633879A4
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 May 2021 15:12:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBB6FC59792;
	Tue, 18 May 2021 13:12:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C275C5978A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 13:12:29 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IDBi90025084; Tue, 18 May 2021 15:12:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=TP/qkfuu2KsG+cL6MbxBFB9+NrjGiO7WMMV1BUlBx8Q=;
 b=UUGmZDFl+f69yOWOPnClrOpQmege6XXaTKTa9BVGyI2J3dwRonApVuOn34q8GWM8jmq4
 Fpz6hWM1DE8+mU/mURTQM9gCCb3iTU2R8Kmq8X5y52+IKLTjaPklgv1AeeKCMnW85we0
 DUgWYUYYP059GHWzxmoQP7bnB2jw/p4OyjK1bkqoxZVmaj2PmNowk8Pdd8XAl2DDiPga
 GN6bT4gj8OBkICBIbx+xZINVTjJtxWhltoshXdllkbzyEfntnADRZTTOeCGQDSd0/pQo
 1+ePro1pToUV3gw7CZ74eCQx439pd24FW+EyKvLRPY+i19aRReOyd7iAvQM/voP9lSaB Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38m4673ex6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 15:12:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9D59A10003B;
 Tue, 18 May 2021 15:12:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94D1C2275E1;
 Tue, 18 May 2021 15:12:27 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May 2021 15:12:26
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 May 2021 15:12:12 +0200
Message-ID: <20210518151206.9.I36ae186249a121969b9ab6d3a7f62752091cf472@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
References: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-18,
 2021-05-18 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: [Uboot-stm32] [PATCH 09/10] dfu: add error callback
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

Add error callback in dfu stack to manage some board specific
behavior on DFU targets.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/dfu/dfu.c | 12 ++++++++++++
 include/dfu.h     | 11 +++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
index 213a20e7bc..ff1859d946 100644
--- a/drivers/dfu/dfu.c
+++ b/drivers/dfu/dfu.c
@@ -44,6 +44,14 @@ __weak void dfu_initiated_callback(struct dfu_entity *dfu)
 {
 }
 
+/*
+ * The purpose of the dfu_error_callback() function is to
+ * provide callback for dfu user
+ */
+__weak void dfu_error_callback(struct dfu_entity *dfu, const char *msg)
+{
+}
+
 /*
  * The purpose of the dfu_usb_get_reset() function is to
  * provide information if after USB_DETACH request
@@ -342,6 +350,7 @@ int dfu_write(struct dfu_entity *dfu, void *buf, int size, int blk_seq_num)
 		printf("%s: Wrong sequence number! [%d] [%d]\n",
 		       __func__, dfu->i_blk_seq_num, blk_seq_num);
 		dfu_transaction_cleanup(dfu);
+		dfu_error_callback(dfu, "Wrong sequence number");
 		return -1;
 	}
 
@@ -366,6 +375,7 @@ int dfu_write(struct dfu_entity *dfu, void *buf, int size, int blk_seq_num)
 		ret = dfu_write_buffer_drain(dfu);
 		if (ret) {
 			dfu_transaction_cleanup(dfu);
+			dfu_error_callback(dfu, "DFU write error");
 			return ret;
 		}
 	}
@@ -375,6 +385,7 @@ int dfu_write(struct dfu_entity *dfu, void *buf, int size, int blk_seq_num)
 		pr_err("Buffer overflow! (0x%p + 0x%x > 0x%p)\n", dfu->i_buf,
 		      size, dfu->i_buf_end);
 		dfu_transaction_cleanup(dfu);
+		dfu_error_callback(dfu, "Buffer overflow");
 		return -1;
 	}
 
@@ -386,6 +397,7 @@ int dfu_write(struct dfu_entity *dfu, void *buf, int size, int blk_seq_num)
 		ret = dfu_write_buffer_drain(dfu);
 		if (ret) {
 			dfu_transaction_cleanup(dfu);
+			dfu_error_callback(dfu, "DFU write error");
 			return ret;
 		}
 	}
diff --git a/include/dfu.h b/include/dfu.h
index d18b701728..1963e9ffb9 100644
--- a/include/dfu.h
+++ b/include/dfu.h
@@ -383,6 +383,17 @@ void dfu_initiated_callback(struct dfu_entity *dfu);
  */
 void dfu_flush_callback(struct dfu_entity *dfu);
 
+/**
+ * dfu_error_callback() - weak callback called at the DFU write error
+ *
+ * It is a callback function called by DFU stack after DFU write error.
+ * This function allows to manage some board specific behavior on DFU targets
+ *
+ * @dfu:	pointer to the dfu_entity which cause the error
+ * @msg:	the message of the error
+ */
+void dfu_error_callback(struct dfu_entity *dfu, const char *msg);
+
 int dfu_transaction_initiate(struct dfu_entity *dfu, bool read);
 void dfu_transaction_cleanup(struct dfu_entity *dfu);
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
