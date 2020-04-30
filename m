Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E431BF4E3
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 12:06:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECBF8C36B11
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 10:06:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30F9CC36B0F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 10:06:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03UA2qif009703; Thu, 30 Apr 2020 12:06:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=UOCA/D3LocyjbZVs+sSElFmzus3T6W0F1a6fVRGydEg=;
 b=g+aq0JMaBli4H9djzAyH6ZU1Dkof+r7ruLaSeecz2FNQ5aJ29wlDURxh6ACTl6O3jJ75
 Vj4WxBt4dD+j0KwWGwsDBZQYa/5LtqLrRI2Djf5+1Dzx5lCtyI/9/KzbV0PlMrcAg79W
 j4upC/F56j5z9a7Qa6V49n+7EIAH+1f36BaPmMufZMcJt1/s2CIqIHbRMA2yrvQH+wrn
 kaaWgDfmJoJTSTJ6kIYkarhTG4DYzmQGV0WbqBlQ/o+avo9kX7UNtvRVy837KKGrvc3s
 +GR1T4/iU0+S/1+1ODkAiCRbRDs3Dq/k7gEhMeYkD5C8TAp72YeY8UsYrQ4QxM/63mG5 rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhjx3jg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 12:06:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B27AC10002A;
 Thu, 30 Apr 2020 12:06:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A7C602B3BD4;
 Thu, 30 Apr 2020 12:06:26 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 30 Apr 2020 12:06:26 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Apr 2020 12:06:19 +0200
Message-ID: <20200430100619.28557-6-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430100619.28557-1-patrice.chotard@st.com>
References: <20200430100619.28557-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_06:2020-04-30,
 2020-04-30 signatures=0
Cc: Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v4 5/5] doc: add bind/unbind command
	documentation
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

Add documentation in doc/drivel-model for the bind/unbind command.
Part of this documentation is extracted from original patch commit
message:
commit 49c752c93a78 ("cmd: Add bind/unbind commands to bind a device to a driver from the command line")

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

---

Changes in v4:
   - fix make htmldocs error "Title underline too short"

Changes in v3:
   - fix typo
   - add bind/unbind parameters description and how to find them

Changes in v2: None

 doc/driver-model/bind.rst  | 49 ++++++++++++++++++++++++++++++++++++++
 doc/driver-model/index.rst |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 doc/driver-model/bind.rst

diff --git a/doc/driver-model/bind.rst b/doc/driver-model/bind.rst
new file mode 100644
index 0000000000..e3e9cb4d3c
--- /dev/null
+++ b/doc/driver-model/bind.rst
@@ -0,0 +1,49 @@
+.. SPDX-License-Identifier: GPL-2.0+
+.. sectionauthor:: Patrice Chotard <patrice.chotard@st.com>
+
+Binding/unbinding a driver
+==========================
+
+This document aims to describe the bind and unbind commands.
+
+For debugging purpose, it should be useful to bind or unbind a driver from
+the U-boot command line.
+
+The unbind command calls the remove device driver callback and unbind the
+device from its driver.
+
+The bind command binds a device to its driver.
+
+In some cases it can be useful to be able to bind a device to a driver from
+the command line.
+The obvious example is for versatile devices such as USB gadget.
+Another use case is when the devices are not yet ready at startup and
+require some setup before the drivers are bound (ex: FPGA which bitsream is
+fetched from a mass storage or ethernet)
+
+usage:
+
+bind <node path> <driver>
+bind <class> <index> <driver>
+
+unbind <node path>
+unbind <class> <index>
+unbind <class> <index> <driver>
+
+Where:
+ - <node path> is the node's device tree path
+ - <class> is one of the class available in the list given by the "dm uclass"
+   command or first column of "dm tree" command.
+ - <index> is the index of the parent's node (second column of "dm tree" output).
+ - <driver> is the driver name to bind given by the "dm drivers" command or the by
+   the fourth column of "dm tree" output.
+
+example:
+
+bind usb_dev_generic 0 usb_ether
+unbind usb_dev_generic 0 usb_ether
+or
+unbind eth 1
+
+bind /ocp/omap_dwc3@48380000/usb@48390000 usb_ether
+unbind /ocp/omap_dwc3@48380000/usb@48390000
diff --git a/doc/driver-model/index.rst b/doc/driver-model/index.rst
index b9df221627..37ef3721df 100644
--- a/doc/driver-model/index.rst
+++ b/doc/driver-model/index.rst
@@ -6,6 +6,7 @@ Driver Model
 .. toctree::
    :maxdepth: 2
 
+   bind
    debugging
    design
    ethernet
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
