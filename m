Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAEA42082D
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Oct 2021 11:24:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DAE9C5AB64;
	Mon,  4 Oct 2021 09:24:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90221C5AB62
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Oct 2021 09:24:03 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19448QAP019227; 
 Mon, 4 Oct 2021 11:23:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=j8OzF114R3TQnGzF541wiM3QkLCQPyOzJj7eJYa53kU=;
 b=M+E50ztwPq3oog2jNp83ReR6TJrANf8gC+w5Jt+F3F8xVcoF7YvtTA5TvXLeoBPCLQrQ
 +n83LGxFC/PUWglJ7vBHaI6sQ3FzkxybR7EzfgkupiBfnw0qxFarkcf+SkluUpJ61fD5
 FKUHpX6Q3Y/08kqUGJFlLjZTSYXWkYhGra0DGbZIFVjHKMA0sP1/xkoejCuv5kS7FaJz
 WKTjs3NI0FIBdRGM/Zi+wDRfJQwnfmw3vTUlp+FjLCObQPoFLM+i52z6Kq9fTgmr9mS3
 rtdV4ZfuUUxuiKKVz8O/7Ck4wdzUFaGoSAAhql3613GC0H69vNnJh6pKbVHL/2XM5IXk yQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bftaahd05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 11:23:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 41CAF10002A;
 Mon,  4 Oct 2021 11:23:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E8D72309E7;
 Mon,  4 Oct 2021 11:23:44 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 4 Oct 2021 11:23:43
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 4 Oct 2021 11:23:41 +0200
Message-ID: <20211004112322.1.Ibee20141b9082ea184cc316944070e647a60fc92@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_02,2021-10-01_02,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, Ian Ray <ian.ray@ge.com>,
 Simon Glass <sjg@chromium.org>, Lukasz Majewski <lukma@denx.de>,
 Rick Chen <rick@andestech.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Aswath Govindraju <a-govindraju@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>
Subject: [Uboot-stm32] [PATCH] configs: Move some usb config in defconfig
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

Using the tools moveconfig.py to move the following config in the
defconfig files:
 CONFIG_USB_HOST_ETHER
 CONFIG_USB_ETHER_ASIX
 CONFIG_USB_ETHER_MCS7830
 CONFIG_USB_ETHER_SMSC95XX

These option are already migrated since the commit f58ad98a621c ("usb: net:
migrate USB Ethernet adapters to Kconfig") and the commit ae3584498bf8
("usb: net: migrate CONFIG_USB_HOST_ETHER to Kconfig").

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/dh_imx6_defconfig       | 2 ++
 configs/kp_imx6q_tpc_defconfig  | 2 ++
 configs/mx53ppd_defconfig       | 4 ++++
 configs/stih410-b2260_defconfig | 4 ++++
 include/configs/dh_imx6.h       | 2 --
 include/configs/kp_imx6q_tpc.h  | 2 --
 include/configs/mx53ppd.h       | 4 ----
 include/configs/stih410-b2260.h | 5 -----
 8 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/configs/dh_imx6_defconfig b/configs/dh_imx6_defconfig
index eb588b68d3..abbb6412e8 100644
--- a/configs/dh_imx6_defconfig
+++ b/configs/dh_imx6_defconfig
@@ -97,6 +97,8 @@ CONFIG_MXC_SPI=y
 CONFIG_SYSRESET=y
 CONFIG_SYSRESET_WATCHDOG=y
 CONFIG_USB=y
+CONFIG_USB_HOST_ETHER=y
+CONFIG_USB_ETHER_ASIX=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_MANUFACTURER="dh"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0525
diff --git a/configs/kp_imx6q_tpc_defconfig b/configs/kp_imx6q_tpc_defconfig
index 85fdfad834..bcaa82ab89 100644
--- a/configs/kp_imx6q_tpc_defconfig
+++ b/configs/kp_imx6q_tpc_defconfig
@@ -76,5 +76,7 @@ CONFIG_SYSRESET_WATCHDOG=y
 CONFIG_IMX_THERMAL=y
 CONFIG_USB=y
 # CONFIG_SPL_DM_USB is not set
+CONFIG_USB_HOST_ETHER=y
+CONFIG_USB_ETHER_ASIX=y
 CONFIG_WATCHDOG_TIMEOUT_MSECS=60000
 CONFIG_IMX_WATCHDOG=y
diff --git a/configs/mx53ppd_defconfig b/configs/mx53ppd_defconfig
index 081707f27e..5f39df85ef 100644
--- a/configs/mx53ppd_defconfig
+++ b/configs/mx53ppd_defconfig
@@ -70,6 +70,10 @@ CONFIG_SYSRESET=y
 CONFIG_SYSRESET_WATCHDOG=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_MX5=y
+CONFIG_USB_HOST_ETHER=y
+CONFIG_USB_ETHER_ASIX=y
+CONFIG_USB_ETHER_MCS7830=y
+CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_DM_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
diff --git a/configs/stih410-b2260_defconfig b/configs/stih410-b2260_defconfig
index d5ec00e1e0..a7ad277066 100644
--- a/configs/stih410-b2260_defconfig
+++ b/configs/stih410-b2260_defconfig
@@ -53,6 +53,10 @@ CONFIG_USB_EHCI_GENERIC=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_GENERIC=y
 CONFIG_USB_DWC3=y
+CONFIG_USB_HOST_ETHER=y
+CONFIG_USB_ETHER_ASIX=y
+CONFIG_USB_ETHER_MCS7830=y
+CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
 CONFIG_USB_GADGET_VENDOR_NUM=0x483
diff --git a/include/configs/dh_imx6.h b/include/configs/dh_imx6.h
index 7af8fceb71..ee56eb691a 100644
--- a/include/configs/dh_imx6.h
+++ b/include/configs/dh_imx6.h
@@ -50,8 +50,6 @@
 /* USB Configs */
 #ifdef CONFIG_CMD_USB
 #define CONFIG_EHCI_HCD_INIT_AFTER_RESET
-#define CONFIG_USB_HOST_ETHER
-#define CONFIG_USB_ETHER_ASIX
 #define CONFIG_MXC_USB_PORTSC		(PORT_PTS_UTMI | PORT_PTS_PTW)
 #define CONFIG_MXC_USB_FLAGS		0
 #define CONFIG_USB_MAX_CONTROLLER_COUNT	2 /* Enabled USB controller number */
diff --git a/include/configs/kp_imx6q_tpc.h b/include/configs/kp_imx6q_tpc.h
index 8471dffe83..3061c96e76 100644
--- a/include/configs/kp_imx6q_tpc.h
+++ b/include/configs/kp_imx6q_tpc.h
@@ -23,8 +23,6 @@
 /* USB Configs */
 #ifdef CONFIG_CMD_USB
 #define CONFIG_EHCI_HCD_INIT_AFTER_RESET
-#define CONFIG_USB_HOST_ETHER
-#define CONFIG_USB_ETHER_ASIX
 #define CONFIG_MXC_USB_PORTSC		(PORT_PTS_UTMI | PORT_PTS_PTW)
 #define CONFIG_MXC_USB_FLAGS		0
 #define CONFIG_USB_MAX_CONTROLLER_COUNT	2 /* Enabled USB controller number */
diff --git a/include/configs/mx53ppd.h b/include/configs/mx53ppd.h
index b623242256..f8118818b0 100644
--- a/include/configs/mx53ppd.h
+++ b/include/configs/mx53ppd.h
@@ -14,10 +14,6 @@
 #define CONFIG_SYS_FSL_CLK
 
 /* USB Configs */
-#define CONFIG_USB_HOST_ETHER
-#define CONFIG_USB_ETHER_ASIX
-#define CONFIG_USB_ETHER_MCS7830
-#define CONFIG_USB_ETHER_SMSC95XX
 #define CONFIG_MXC_USB_PORT	1
 #define CONFIG_MXC_USB_PORTSC	(PORT_PTS_UTMI | PORT_PTS_PTW)
 #define CONFIG_MXC_USB_FLAGS	0
diff --git a/include/configs/stih410-b2260.h b/include/configs/stih410-b2260.h
index b1917c9d3f..2fe0900e9f 100644
--- a/include/configs/stih410-b2260.h
+++ b/include/configs/stih410-b2260.h
@@ -57,11 +57,6 @@
 #define CONFIG_USB_OHCI_NEW
 #define CONFIG_SYS_USB_OHCI_MAX_ROOT_PORTS	2
 
-#define CONFIG_USB_HOST_ETHER
-#define CONFIG_USB_ETHER_ASIX
-#define CONFIG_USB_ETHER_MCS7830
-#define CONFIG_USB_ETHER_SMSC95XX
-
 /* NET Configs */
 
 #endif /* __CONFIG_H */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
