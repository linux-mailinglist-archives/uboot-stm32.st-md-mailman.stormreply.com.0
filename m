Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3922B4F0
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 May 2019 14:23:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9068C0615C
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 May 2019 12:23:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86F56C5B658
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2019 12:23:24 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4RCLaBk001501; Mon, 27 May 2019 14:23:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=J9yz5xAHbO8O1uB5nqt6E30wljCP6TqU7CCIwE7sGLY=;
 b=QroM7DGqYXocxheT9AM/kc5lBf+ldFVQRfqNJijRg72+O9wx4YwqV8cC0yq+Ufw4wZXO
 9fbaC3otGdg9aaZ2IGwA1xaSGAoj5ddm4tYXutYjUcuV+zP44iVi12ZGw2BdhYa76Let
 VTMjgNGQftItz2BK2JgmPZS75fhOCq740JS7GyVx1bW7c1CQIJb2vsgVsMyPayKwXRQn
 d8DYx8c7CrHg5B4S1vpqzwthqv3tb4pf0S93vR9Zl9cunHAeAshZu+fq+S7yRBDEWY7N
 peHVSqzKGLpG9qAu3uSzoYWhahtFFy7F70Ck06kMABYyIJ/fJnI2pGNt0BbJC1KJrNJd dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2spuftjv6g-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 27 May 2019 14:23:23 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE7F731;
 Mon, 27 May 2019 12:23:22 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9C8522A56;
 Mon, 27 May 2019 12:23:22 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 27 May
 2019 14:23:22 +0200
Received: from localhost (10.201.23.25) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 27 May 2019 14:23:22
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>
Date: Mon, 27 May 2019 14:23:12 +0200
Message-ID: <1558959797-15299-3-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558959797-15299-1-git-send-email-fabien.dessenne@st.com>
References: <1558959797-15299-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-27_07:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH v2 2/7] remoteproc: fix function headers
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

Add full function comment headers.
Fix rproc_is_initialized() return value description.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 include/remoteproc.h | 104 +++++++++++++++++++++++++++++++++------------------
 1 file changed, 68 insertions(+), 36 deletions(-)

diff --git a/include/remoteproc.h b/include/remoteproc.h
index a59dba8..aa90a67 100644
--- a/include/remoteproc.h
+++ b/include/remoteproc.h
@@ -45,32 +45,73 @@ struct dm_rproc_uclass_pdata {
 };
 
 /**
- * struct dm_rproc_ops - Operations that are provided by remote proc driver
- * @init:	Initialize the remoteproc device invoked after probe (optional)
- *		Return 0 on success, -ve error on fail
- * @load:	Load the remoteproc device using data provided(mandatory)
- *		This takes the following additional arguments.
- *			addr- Address of the binary image to be loaded
- *			size- Size of the binary image to be loaded
- *		Return 0 on success, -ve error on fail
- * @start:	Start the remoteproc device (mandatory)
- *		Return 0 on success, -ve error on fail
- * @stop:	Stop the remoteproc device (optional)
- *		Return 0 on success, -ve error on fail
- * @reset:	Reset the remote proc device (optional)
- *		Return 0 on success, -ve error on fail
- * @is_running:	Check if the remote processor is running(optional)
- *		Return 0 on success, 1 if not running, -ve on others errors
- * @ping:	Ping the remote device for basic communication check(optional)
- *		Return 0 on success, 1 if not responding, -ve on other errors
+ * struct dm_rproc_ops - Driver model remote proc operations.
+ *
+ * This defines the operations provided by remote proc driver.
  */
 struct dm_rproc_ops {
+	/**
+	 * init() - Initialize the remoteproc device (optional)
+	 *
+	 * This is called after the probe is completed allowing the remote
+	 * processor drivers to split up the initializations between probe and
+	 * init if needed.
+	 *
+	 * @dev:	Remote proc device
+	 * @return 0 if all ok, else appropriate error value.
+	 */
 	int (*init)(struct udevice *dev);
+
+	/**
+	 * load() - Load the remoteproc device using data provided (mandatory)
+	 *
+	 * Load the remoteproc device with an image, do not start the device.
+	 *
+	 * @dev:	Remote proc device
+	 * @addr:	Address of the image to be loaded
+	 * @size:	Size of the image to be loaded
+	 * @return 0 if all ok, else appropriate error value.
+	 */
 	int (*load)(struct udevice *dev, ulong addr, ulong size);
+
+	/**
+	 * start() - Start the remoteproc device (mandatory)
+	 *
+	 * @dev:	Remote proc device
+	 * @return 0 if all ok, else appropriate error value.
+	 */
 	int (*start)(struct udevice *dev);
+
+	/**
+	 * stop() - Stop the remoteproc device (optional)
+	 *
+	 * @dev:	Remote proc device
+	 * @return 0 if all ok, else appropriate error value.
+	 */
 	int (*stop)(struct udevice *dev);
+
+	/**
+	 * reset() - Reset the remoteproc device (optional)
+	 *
+	 * @dev:	Remote proc device
+	 * @return 0 if all ok, else appropriate error value.
+	 */
 	int (*reset)(struct udevice *dev);
+
+	/**
+	 * is_running() - Check if the remote processor is running (optional)
+	 *
+	 * @dev:	Remote proc device
+	 * @return 0 if running, 1 if not running, -ve on error.
+	 */
 	int (*is_running)(struct udevice *dev);
+
+	/**
+	 * ping() - Ping the remote device for basic communication (optional)
+	 *
+	 * @dev:	Remote proc device
+	 * @return 0 on success, 1 if not responding, -ve on other errors.
+	 */
 	int (*ping)(struct udevice *dev);
 };
 
@@ -80,23 +121,20 @@ struct dm_rproc_ops {
 #ifdef CONFIG_REMOTEPROC
 /**
  * rproc_init() - Initialize all bound remote proc devices
- *
- * Return: 0 if all ok, else appropriate error value.
+ * @return 0 if all ok, else appropriate error value.
  */
 int rproc_init(void);
 
 /**
  * rproc_dev_init() - Initialize a remote proc device based on id
  * @id:		id of the remote processor
- *
- * Return: 0 if all ok, else appropriate error value.
+ * @return 0 if all ok, else appropriate error value.
  */
 int rproc_dev_init(int id);
 
 /**
  * rproc_is_initialized() - check to see if remoteproc devices are initialized
- *
- * Return: 0 if all devices are initialized, else appropriate error value.
+ * @return true if all devices are initialized, false otherwise.
  */
 bool rproc_is_initialized(void);
 
@@ -105,55 +143,49 @@ bool rproc_is_initialized(void);
  * @id:		id of the remote processor
  * @addr:	address in memory where the binary image is located
  * @size:	size of the binary image
- *
- * Return: 0 if all ok, else appropriate error value.
+ * @return 0 if all ok, else appropriate error value.
  */
 int rproc_load(int id, ulong addr, ulong size);
 
 /**
  * rproc_start() - Start a remote processor
  * @id:		id of the remote processor
- *
- * Return: 0 if all ok, else appropriate error value.
+ * @return 0 if all ok, else appropriate error value.
  */
 int rproc_start(int id);
 
 /**
  * rproc_stop() - Stop a remote processor
  * @id:		id of the remote processor
- *
- * Return: 0 if all ok, else appropriate error value.
+ * @return 0 if all ok, else appropriate error value.
  */
 int rproc_stop(int id);
 
 /**
  * rproc_reset() - reset a remote processor
  * @id:		id of the remote processor
- *
- * Return: 0 if all ok, else appropriate error value.
+ * @return 0 if all ok, else appropriate error value.
  */
 int rproc_reset(int id);
 
 /**
  * rproc_ping() - ping a remote processor to check if it can communicate
  * @id:		id of the remote processor
+ * @return 0 if all ok, else appropriate error value.
  *
  * NOTE: this might need communication path available, which is not implemented
  * as part of remoteproc framework - hook on to appropriate bus architecture to
  * do the same
- *
- * Return: 0 if all ok, else appropriate error value.
  */
 int rproc_ping(int id);
 
 /**
  * rproc_is_running() - check to see if remote processor is running
  * @id:		id of the remote processor
+ * @return 0 if running, 1 if not running, -ve on error.
  *
  * NOTE: this may not involve actual communication capability of the remote
  * processor, but just ensures that it is out of reset and executing code.
- *
- * Return: 0 if all ok, else appropriate error value.
  */
 int rproc_is_running(int id);
 #else
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
