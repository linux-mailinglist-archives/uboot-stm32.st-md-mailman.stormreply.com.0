Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B811BDBE8
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2020 14:20:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DD65C36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2020 12:20:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAB9FC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 12:20:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03TCIXJi007782; Wed, 29 Apr 2020 14:20:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=e4q7bKoGVe2uLRz+FtC6qEFW1wXQ3Q4bRyifacW/u4s=;
 b=P6M5ic7FXxuUh93lzn17Tt+gR3zfoAIXEgsWGD1AtdhFpQWINA/B3rVw6PXBsxhft6Ur
 8mpLcbLeaYS/3Y1ZeSyqDsuSbMFOhOVF1DLog4CMiLGx0NazVoKr2bZY9JZpj9ZaEWpd
 HQyl6VTc9liw/GST1yfvSkCnOm3+j8UTdkStr4FgjPTKJzNuj9PeWi2kKkQCx2WaI3Z6
 Pg3YRkcm2R33BQbdJf2uHB2dOrZkG0vm8ViJcdBukV2QvTz9zrc0BBLOiaAlTCOhzCyX
 SOyiuBEnR30Vea9a7rxlxEgaVjCYOLIcwvf7IgB1HiDIARD38fzDk3L7VW0g3BRMENXE rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhq6695t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 14:20:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4467D100039;
 Wed, 29 Apr 2020 14:20:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 39BC5212A70;
 Wed, 29 Apr 2020 14:20:39 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 29 Apr 2020 14:20:38 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 29 Apr 2020 14:20:31 +0200
Message-ID: <20200429122031.31279-6-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429122031.31279-1-patrice.chotard@st.com>
References: <20200429122031.31279-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_05:2020-04-29,
 2020-04-29 signatures=0
Cc: Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 5/5] doc: add bind/unbind command
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

Changes in v2: None

 doc/driver-model/bind.rst  | 32 ++++++++++++++++++++++++++++++++
 doc/driver-model/index.rst |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 doc/driver-model/bind.rst

diff --git a/doc/driver-model/bind.rst b/doc/driver-model/bind.rst
new file mode 100644
index 0000000000..df6b5f143b
--- /dev/null
+++ b/doc/driver-model/bind.rst
@@ -0,0 +1,32 @@
+.. SPDX-License-Identifier: GPL-2.0+
+.. sectionauthor:: Patrice Chotard <patrice.chotard@st.com>
+
+Binding/unbiding a driver
+=========================
+
+This documents aims to describe the bind and unbind commands.
+
+For debug purpose, it should be useful to bind or unbind a driver from
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
+usage example:
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
