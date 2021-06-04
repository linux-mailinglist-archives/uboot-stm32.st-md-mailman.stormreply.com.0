Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5245139BDA6
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Jun 2021 18:51:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E4E9C57B69;
	Fri,  4 Jun 2021 16:51:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 396F0C57B55
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jun 2021 16:51:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 154GlZpw025694; Fri, 4 Jun 2021 18:51:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=2GoU2ycg3fkaC2XTQGrL2fcZ7vLhNJ8km8+8iaFt/3w=;
 b=2HIy3OZ0+CbMj13Z5AxKWKXOV/N1XBveWqow43JkdsOk3B8UnXY8Z78YyZQxRWrLksoc
 pGStnIZi5eGzubnCL8S7yNXqy2a3g/Q3ultO46r7q+PS9ACs3aw3PIe9L74nc645bP/R
 pUja9uXs5Yr6tGdYUaPnPn/sKSLJJa0Xu79rg+RiB8kjgTxdkolDr0W6b+IGXytp8uDy
 0OUtX8cXzA+ziEbkjD05KvF4BNcsuVYtB+Qz2Qw7upyu2xsNGMnCAILPkmjEQPvDiUJZ
 9zlVJt7lT7Jq55Xcq7G37VHVBXgY8oTmyjMHxfSU9IFcQ8dQKYgzQbzGyHSVpt69sec2 dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38y4ye61jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 18:51:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8846A10002A;
 Fri,  4 Jun 2021 18:51:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7E559248EC7;
 Fri,  4 Jun 2021 18:51:55 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun 2021 18:51:54
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 4 Jun 2021 18:51:47 +0200
Message-ID: <20210604185138.v2.2.I567147108d7efaa02a3532cde06cf1d5df59ce38@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210604165147.31788-1-patrick.delaunay@foss.st.com>
References: <20210604165147.31788-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-04_11:2021-06-04,
 2021-06-04 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 2/2] doc: usage: man-page for ums command
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

Provide a man-page for the ums command - USB Mass Storage.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- clarify description
- add reference to <partitions> and align parameter name
- correct information for partition = 0 (expose all partitions)
- update dependency

 doc/usage/index.rst |  1 +
 doc/usage/ums.rst   | 57 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 doc/usage/ums.rst

diff --git a/doc/usage/index.rst b/doc/usage/index.rst
index 41b247bc62..1bab6ae3e9 100644
--- a/doc/usage/index.rst
+++ b/doc/usage/index.rst
@@ -43,3 +43,4 @@ Shell commands
    scp03
    size
    true
+   ums
diff --git a/doc/usage/ums.rst b/doc/usage/ums.rst
new file mode 100644
index 0000000000..19d2ebb4a6
--- /dev/null
+++ b/doc/usage/ums.rst
@@ -0,0 +1,57 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+ums command
+===========
+
+Synopsis
+--------
+
+::
+
+    <dev> [<interface>] <devnum[:partnum]>
+
+Description
+-----------
+
+Use the USB Mass Storage class (also known as UMS) to make accessible an U-Boot
+block device (fully or with :ref:`U-Boot's partition syntax <partitions>`)
+to a USB host and to enable file transfers. U-Boot, the USB device, acts as a
+simple external hard drive plugged on the host USB port.
+
+This command "ums" stays in the USB's treatment loop until user enters Ctrl-C.
+
+dev
+    USB gadget device number
+
+interface
+    interface for accessing the block device (mmc, sata, scsi, usb, ....)
+    defaults is "mmc"
+
+devnum
+    device number for selected interface
+
+partnum
+    partition number or 0 to expose all partitions, defaults to 0
+
+Example
+-------
+
+::
+
+    => ums 0 mmc 0
+    => ums 0 usb 1:2
+
+Configuration
+-------------
+
+The ums command is only available if CONFIG_CMD_USB_MASS_STORAGE=y
+and depends on CONFIG_USB_USB_GADGET and CONFIG_BLK.
+
+Return value
+------------
+
+The return value $? is set to 0 (true) when the USB stack was successfully
+started and interrupted, with Ctrl-C or after USB cable issue (detection
+timeout or cable removal).
+
+If an error occurs, the return value $? is set to 1 (false).
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
