Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6111439BDA8
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Jun 2021 18:52:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24760C57B6B;
	Fri,  4 Jun 2021 16:52:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25B14C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jun 2021 16:52:01 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 154GlSp5009339; Fri, 4 Jun 2021 18:51:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=1iCNXGnPYr0V3Le5uo+imT86hV9urR3uMg+c0ObNnvA=;
 b=Lb5m0QP9DBXYab9UlLaHd+7cSB2go41iwD9j0UQUrlkm9ch09YOA5CZ3Aik4Kws59MwB
 BEkSOsjnFerBtjbaPjU8+6XyQ1C9x+UYXByKCU/vAd7VfBJzFmMXo2TP7hn40npK3PMA
 AVa5wInPW12dbhKlsHnfbMOfvVBLc6ezDHqZ5/Z0FoqerIHiWkl2F9vHsC65V+pZB+X/
 F9QQGumSdofghq1r10XpO7CTfd7UnmBRxhp+KNlUqhBmqutJiuS+xmohCHC18/LBdAnN
 9QJih49Vob2RutrsgZANRnN1CuG6mgWxHePcOtwhHfitGhjH4W42qohBWVzkwXXASAgy 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38yea1kk86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 18:51:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B028B100034;
 Fri,  4 Jun 2021 18:51:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94431248EC7;
 Fri,  4 Jun 2021 18:51:54 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun 2021 18:51:53
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 4 Jun 2021 18:51:46 +0200
Message-ID: <20210604185138.v2.1.I5e3a3276d6423b96b60bf2e60e6a57978c772154@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210604165147.31788-1-patrick.delaunay@foss.st.com>
References: <20210604165147.31788-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-04_11:2021-06-04,
 2021-06-04 signatures=0
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= <frederic.danis@collabora.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 1/2] cmd: Add dependency for ums command
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

Add the missing dependency for the command ums:
- CONFIG_BLK: call of blk_* functions in usb_mass_storage.c
- CONFIG_USB_GADGET: required to select CONFIG_USB_FUNCTION_MASS_STORAGE

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- NEW: Add dependency for ums command

 cmd/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/cmd/Kconfig b/cmd/Kconfig
index f962bb7141..a9fb4eead2 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -1346,8 +1346,11 @@ config CMD_ROCKUSB
 config CMD_USB_MASS_STORAGE
 	bool "UMS usb mass storage"
 	select USB_FUNCTION_MASS_STORAGE
+	depends on BLK && USB_GADGET
 	help
-	  USB mass storage support
+	  Enables the command "ums" and the USB mass storage support to the
+	  export a block device: U-Boot, the USB device, acts as a simple
+	  external hard drive plugged on the host USB port.
 
 config CMD_PVBLOCK
 	bool "Xen para-virtualized block device"
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
