Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF51325677
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 May 2019 19:19:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1025C35E05
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 May 2019 17:19:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99B1AC7C7D4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 17:19:34 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4LHHspU004450; Tue, 21 May 2019 19:19:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=TBCJ5uCtXtRtZaGJC1ED1R3Fi65ZMXGGcYenjs2EWDA=;
 b=m3q/Or2B7BXh9z0p5B3O0kfhgBD+t9ZPDv6MBBaDKxYLlxPyTKsH+hHFaDAwTpXLNHOG
 xk7n7apaQvo93yHNH0YmgrqcONSU90XOq+XcuoH374EHV0D0lKpuMJS07HRh10N4iTlq
 /JvEyO2UmKGKaZj4E9F6NgwEteQZ9wdrsFCgZVI4DW3O9sPWcW8rU82J266UConxrunT
 EjuGw+W10gVgGC3OhK21zkd/nHu20MDPd9aGsTbq1x/IAHpHRJr8VNW64r8OfI2XaPDp
 1W30UnjJ6iha2aiFvjlZUL2+LlVgdB2C1j69PtWfnDh7Sc68Ap2sUc069Aauuav/1Z10 Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7tu307f-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 21 May 2019 19:19:30 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1ABBA38;
 Tue, 21 May 2019 17:19:30 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 05BB14F13;
 Tue, 21 May 2019 17:19:30 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 21 May
 2019 19:19:30 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 21 May 2019 19:19:29
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 May 2019 19:19:12 +0200
Message-ID: <1558459153-14104-3-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558459153-14104-1-git-send-email-patrick.delaunay@st.com>
References: <1558459153-14104-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-21_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Anatolij Gustschin <agust@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 2/3] fdt: Allow indicating a node is for
	U-Boot proper only
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

This add missing parts for previous commit 06f94461a9f4
("fdt: Allow indicating a node is for U-Boot proper only")

At present it is not possible to specify that a node should be used before
relocation (in U-Boot proper) without it also ending up in SPL and TPL
device trees. Add a new "u-boot,dm-pre-proper" boolean property for this.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

Changes in v3: None
Changes in v2: None

 drivers/core/util.c          | 2 ++
 drivers/video/video-uclass.c | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/core/util.c b/drivers/core/util.c
index 96e47dc..60b939a 100644
--- a/drivers/core/util.c
+++ b/drivers/core/util.c
@@ -42,6 +42,8 @@ bool dm_ofnode_pre_reloc(ofnode node)
 #else
 	if (ofnode_read_bool(node, "u-boot,dm-pre-reloc"))
 		return true;
+	if (ofnode_read_bool(node, "u-boot,dm-pre-proper"))
+		return true;
 
 	/*
 	 * In regular builds individual spl and tpl handling both
diff --git a/drivers/video/video-uclass.c b/drivers/video/video-uclass.c
index 14aac88..d922e53 100644
--- a/drivers/video/video-uclass.c
+++ b/drivers/video/video-uclass.c
@@ -291,7 +291,9 @@ static int video_post_bind(struct udevice *dev)
 		return 0;
 	size = alloc_fb(dev, &addr);
 	if (addr < gd->video_bottom) {
-		/* Device tree node may need the 'u-boot,dm-pre-reloc' tag */
+		/* Device tree node may need the 'u-boot,dm-pre-reloc' or
+		 * 'u-boot,dm-pre-proper' tag
+		 */
 		printf("Video device '%s' cannot allocate frame buffer memory -ensure the device is set up before relocation\n",
 		       dev->name);
 		return -ENOSPC;
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
