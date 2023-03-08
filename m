Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E446B089A
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Mar 2023 14:26:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95E23C6907B;
	Wed,  8 Mar 2023 13:26:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDAAFC69067
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Mar 2023 13:26:57 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 328AFgcg019709; Wed, 8 Mar 2023 14:26:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=MatEM9MsoTwvppA7huUnlE93Q1P4ewB5PhwoO6cEb+g=;
 b=gxnYFZLjUNzUsp9xXcf+Vh35vvG58Gp1oBeCCuiKTZsgxncOG1C8+8H+mj5XqL35zovQ
 0N8WMGd80GUrRaThOpX71oVQqzxXoEc/WuvA+ZI/p5hsBfI01vO0afLQ5sMM0eHjFQlQ
 BZRKPjciFlQfYiF6djPoLhkQYsmBOQYVyenb1op8WAkZTVnQRdrKvZKuQ4x/C6a4cFSA
 vpQ6zyObbXANhcy1/c0UOZclM2G1/fX2Xk2eSIwOa0VuJ/hUbq1RgTKVUpFeZK0UnF7o
 lGS0/spySQ3+TqEB535FS0Q4N7e9HSF8qt4tT1Bu8S1FBJrgfHtq3ueUe0w8nHFrut/7 Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3p6fdrmdqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Mar 2023 14:26:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D079510002A;
 Wed,  8 Mar 2023 14:26:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8291E2138EC;
 Wed,  8 Mar 2023 14:26:52 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 8 Mar
 2023 14:26:51 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 8 Mar 2023 14:26:47 +0100
Message-ID: <20230308142555.1.I43130d8c0b1b4b863e2cbd9bcb26e07e44e5e235@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308132649.355398-1-patrick.delaunay@foss.st.com>
References: <20230308132649.355398-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_08,2023-03-08_03,2023-02-09_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [Uboot-stm32] [PATCH 1/2] efi: remove error in efi_disk_probe
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

EFI has no reason to block the dm core device_probe() in the callback
efi_disk_probe() registered with EVT_DM_POST_PROBE.

This patch avoids to have error in DM core on device_probe()

  ret = device_notify(dev, EVT_DM_POST_PROBE);

only because EFI is not able to create its instance/handle.

For example on usb start, when the SAME KEY (PID/VID) is present on
2 ports of the USB HUB, the 2nd key have the same EFI device path
with the call stack:

efi_disk_probe()
	efi_disk_create_raw()
		efi_disk_add_dev()
			efi_install_multiple_protocol_interfaces()
				EFI_ALREADY_STARTED

In case of error in probe, the 2nd key is unbound and deactivated for
the next usb commands even if the limitation is only for EFI.

This patch removes any return error in probe event callback;
if something occurs in EFI registration, the device is still probed.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 lib/efi_loader/efi_disk.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/lib/efi_loader/efi_disk.c b/lib/efi_loader/efi_disk.c
index d2256713a8e7..8d53ba3bd27e 100644
--- a/lib/efi_loader/efi_disk.c
+++ b/lib/efi_loader/efi_disk.c
@@ -677,14 +677,18 @@ int efi_disk_probe(void *ctx, struct event *event)
 	desc = dev_get_uclass_plat(dev);
 	if (desc->uclass_id != UCLASS_EFI_LOADER) {
 		ret = efi_disk_create_raw(dev, agent_handle);
-		if (ret)
-			return -1;
+		if (ret) {
+			log_err("efi_disk_create_raw %s failed (%d)\n",
+				dev->name, ret);
+			return 0;
+		}
 	}
 
 	device_foreach_child(child, dev) {
 		ret = efi_disk_create_part(child, agent_handle);
 		if (ret)
-			return -1;
+			log_err("efi_disk_create_part %s failed (%d)\n",
+				dev->name, ret);
 	}
 
 	return 0;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
