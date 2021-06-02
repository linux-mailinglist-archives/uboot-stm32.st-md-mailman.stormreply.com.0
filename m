Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6A9398B15
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Jun 2021 15:52:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6B7AC57196;
	Wed,  2 Jun 2021 13:52:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F17CFC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 13:52:52 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 152Dq9DJ028730; Wed, 2 Jun 2021 15:52:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=Ukf2eFbHRnIITOqLbr9ZJ5hhqm0qlf33tPVva4ABgIg=;
 b=0vz+GiQ7Fwqv7wPZrcdsg3p7khYvpgK4b5syCiZWt125VhiGQe+IDtzbjs6UrypKcyzA
 6T1idDtz2EiTmhpPQdOB4iR9m0WpdI2BI00IZpKsX5hzZU99uaoUq1lBorp4cEF3HtqO
 GJ3pPQce2879BhOHFEEEJUdkEatv7xtgWI2cWvwJBpXCnkVL3VA2BVmuKYym/IxAg5S5
 BqOBoLaPlykKmBjhP89sVdC0vscGq3k3hGB3wji9CdbCL93sQ+kTBVeFhXHz4TpqdUmU
 FHVXezdqWKeXRGLlVWD1nXhMYWBGTI8A+LvON/Cxg0WrCegXFJ5hMpesclCb9qtSOYPL XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38x3gt602a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 15:52:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A31B810002A;
 Wed,  2 Jun 2021 15:52:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9700F20AAA9;
 Wed,  2 Jun 2021 15:52:49 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 2 Jun 2021 15:52:49
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 2 Jun 2021 15:52:47 +0200
Message-ID: <20210602155241.1.I567147108d7efaa02a3532cde06cf1d5df59ce38@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-02_07:2021-06-02,
 2021-06-02 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] doc: usage: man-page for ums command
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

Provide a man-page for the ums command for USB Mass Storage.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 doc/usage/index.rst |  1 +
 doc/usage/ums.rst   | 54 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)
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
index 0000000000..cf0e3a9479
--- /dev/null
+++ b/doc/usage/ums.rst
@@ -0,0 +1,54 @@
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
+    <USB_controller> [<devtype>] <dev[:part]>
+
+Description
+-----------
+
+Use the USB Mass Storage class (also known as USB MSC or UMS) to make
+accessible a block device (based on UCLASS_BLK) to a host computing device and
+to enable file transfers between the host and the U-Boot device.
+
+This command "ums" stays in the USB's treatment loop until user enters Ctrl-C.
+
+USB_controller
+    USB device number
+
+devtype
+    block device interface, defaults to "mmc"
+
+dev
+    device number for devtype
+
+part
+    partition number, defaults to 0 (first partition)
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
+The ums command is only available if CONFIG_CMD_USB_MASS_STORAGE=y.
+
+Return value
+------------
+
+The return value $? is set to 0 (true) when the USB stack was successfully
+started and interrupted Ctrl-C or after USB cable detection issue
+(timeout or cable removal).
+
+If an error occurs, the return value $? is set to 1 (false).
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
