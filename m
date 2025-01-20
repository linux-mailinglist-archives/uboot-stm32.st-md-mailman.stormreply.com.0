Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC787A167DF
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Jan 2025 09:05:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7D95C7801E;
	Mon, 20 Jan 2025 08:05:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 352E6C78027
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2025 08:05:14 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K7lNdO027503;
 Mon, 20 Jan 2025 09:05:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 q3Hcl5baduoM4DlA6N0wm7UCwJgxdIP39TE8faXTsn8=; b=AWXw86YuCz6AVJjd
 tB8d9+4GvXElW9ph+Mc94o1EQ8vJOkGkXHlkSu4Lw1fkOKYVoq9u3+SVKmWFrK3F
 P2pPkorjVW3WnGks03cPeYFD86Lv25RMHj2iCtN/xbnYIjPVK1vo8iQ7zHlz4eio
 rizRyr0APyAzPIO/b08bm9O833M3xfpZ7qePnid8qEKrc5gvLHC/jzfbeKEQ2Y6J
 PN3EfdpWJGu2bdXtNZNvMY62meqoCNCwsoUsZve/j9emJSRnfb6Lz1v6RGKOnp2A
 Rq/dok3q0XBtvTfD8/qao4FiS48PJS2UzGF2lzj7+Zn+EAysAsIeyQG7mtsJjR7D
 62CK4Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 448pr3b9w6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jan 2025 09:05:07 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D58F140068;
 Mon, 20 Jan 2025 09:03:58 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 16ED7270316;
 Mon, 20 Jan 2025 09:01:24 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 20 Jan
 2025 09:01:23 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 Jan 2025 09:01:13 +0100
Message-ID: <20250120080120.51657-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250120080120.51657-1-patrice.chotard@foss.st.com>
References: <20250120080120.51657-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-20_02,2024-11-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v3 2/9] configs: stih410-b2260: Enable
	DM_REGULATOR flag
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

Since commit 6aa8bde8786d ("usb: host: ehci-generic: Remove DM_REGULATOR
flag") device_get_supply_regulator() returns -ENOSYS which is not handle
by ehci_enable_vbus_supply() and thus, ehci_usb_probe() return an error.

By enabling DM_REGULATOR flag, device_get_supply_regulator() return -ENOENT
which is handle and ehci_usb_probe() return 0.

This fixed the following issue:
stih410-b2260 =>usb start
starting USB...
Bus dwc3@9900000: Register 2000240 NbrPorts 2
Starting the controller
USB XHCI 1.00
Bus usb@9a03c00: USB OHCI 1.0
Bus usb@9a03e00: probe failed, error -38
Bus usb@9a83c00: USB OHCI 1.0
Bus usb@9a83e00: probe failed, error -38
scanning bus dwc3@9900000 for devices... 1 USB Device(s) found
scanning bus usb@9a03c00 for devices... data abort
pc : [<7df929b4>]          lr : [<7df92918>]
reloc pc : [<7d6409b4>]    lr : [<7d640918>]
sp : 7c73b848  ip : 9cf13c5c     fp : 7c879d08
r10: 7c85d040  r9 : 7c74ded0     r8 : 09a03c00
r7 : 00000002  r6 : 7c85d080     r5 : 7c86a040  r4 : 00000000
r3 : 00000000  r2 : 00000000     r1 : 7c85d080  r0 : 7c85d040
Flags: nzCv  IRQs off  FIQs off  Mode SVC_32
Code: 05853ae4 0affffe2 e59a2010 e59a300c (e5832010)
Resetting CPU ...

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marex@denx.de>
---

(no changes since v1)

 configs/stih410-b2260_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stih410-b2260_defconfig b/configs/stih410-b2260_defconfig
index 815f7557d69..e312ca492d2 100644
--- a/configs/stih410-b2260_defconfig
+++ b/configs/stih410-b2260_defconfig
@@ -48,6 +48,7 @@ CONFIG_MMC_SDHCI_STI=y
 CONFIG_PHY=y
 CONFIG_STI_USB_PHY=y
 CONFIG_PINCTRL=y
+CONFIG_DM_REGULATOR=y
 CONFIG_STI_RESET=y
 CONFIG_STI_ASC_SERIAL=y
 CONFIG_SYSRESET=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
