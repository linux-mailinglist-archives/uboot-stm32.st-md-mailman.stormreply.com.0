Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA4A6B08A6
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Mar 2023 14:28:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF241C6A5E8;
	Wed,  8 Mar 2023 13:28:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6FD3C6907B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Mar 2023 13:28:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 328ARoGa004633; Wed, 8 Mar 2023 14:28:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Rf8YkYZ2JIcf789H0tcrTGVBx8d8ODnT/2TLLbxjWgw=;
 b=XkZkrjubQQaPhEllkj6OrWZazPhOxOLeeR8qixdj6y2eXBsO5WcNjyBgBRVugRLSeeQs
 ybMJWRinFCrXCcg4bYnKQ8kBvvGSgD7gpl0FRYM27IScPX2rhKD2AW9rThHsLQxYp9N7
 0zgvQy8OjmNsZVOz+Ova1DBF8Apc2+vIPq0Cr0UK07kaYTfMo2QlscbXzvtuNlQ5YvDQ
 W//yqs/ViVFDg/niQi86IgFCSBGYPg3SHqkV7YZi/gAUtsEZgc7TdXm4nAww3kU3Bjti
 4YIgT5INplUvePlOvBi30gHy3SzBJj4eBfIQWRRd32ijulfkUkONzGUEbJmTUUeBDEUs kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3p6fg14c48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Mar 2023 14:28:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5ACF8100034;
 Wed,  8 Mar 2023 14:26:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 52DDD216EDB;
 Wed,  8 Mar 2023 14:26:53 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 8 Mar
 2023 14:26:52 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 8 Mar 2023 14:26:48 +0100
Message-ID: <20230308142555.2.Ie4c0c26b9f9564443ab4eb36059d16195af15fe5@changeid>
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
Subject: [Uboot-stm32] [PATCH 2/2] efi: remove error in efi_disk_remove
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

EFI has no reason to block the driver remove when the associated EFI
resources failed to be released.

This patch avoids DM issue when an EFI resource can't be released,
for example if this resource wasn't created, for duplicated device name
(error EFI_ALREADY_STARTED).

Without this patch, the U-Boot device tree is not updated for "usb stop"
command because EFI stack can't free a resource; in usb_stop(), the
remove operation is stopped on first device_remove() error, including a
device_notify() error on any child.

And this remove error, returned by usb_stop(), is not managed in cmd/usb.c
and the next "usb start" command cause a crash because all the USB devices
need to be released before the next USB scan.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 lib/efi_loader/efi_disk.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/lib/efi_loader/efi_disk.c b/lib/efi_loader/efi_disk.c
index 8d53ba3bd27e..22a0035dcde2 100644
--- a/lib/efi_loader/efi_disk.c
+++ b/lib/efi_loader/efi_disk.c
@@ -767,16 +767,20 @@ int efi_disk_remove(void *ctx, struct event *event)
 {
 	enum uclass_id id;
 	struct udevice *dev;
+	int ret = 0;
 
 	dev = event->data.dm.dev;
 	id = device_get_uclass_id(dev);
 
 	if (id == UCLASS_BLK)
-		return efi_disk_delete_raw(dev);
+		ret = efi_disk_delete_raw(dev);
 	else if (id == UCLASS_PARTITION)
-		return efi_disk_delete_part(dev);
-	else
-		return 0;
+		ret = efi_disk_delete_part(dev);
+
+	if (ret)
+		log_err("%s failed for %s uclass %u (%d)\n", __func__, dev->name, id, ret);
+
+	return 0;
 }
 
 /**
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
