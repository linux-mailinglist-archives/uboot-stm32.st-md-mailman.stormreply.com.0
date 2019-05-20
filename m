Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F334222F92
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 10:58:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A458DC06F94
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 08:58:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6C64C06F93
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 08:58:56 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4K8qJB6000628; Mon, 20 May 2019 10:58:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=ncqfx3oxA+XSVZOtnCmNQHoRSn/7wTrKsYamu2VJvSw=;
 b=AKenbPDhFxr+06UTP7UCapnyEjUOWsow95seHDyo5tUp5yX9JARNQGpJcb68WUYFkPM3
 QTGzENhT65JpR7igb7WMMYQ4Q5AfF8MymDoJU9Hq2QPwBpkZbwxgkDNoqyvGIF374UOy
 Tk5I/OVgYASZyIrpBYN8hpisxWrZ9YS7HezW8zAJ1UBju30BqCnbvLsuTvkasrYwIri2
 V7tlWy5bi2S1b8vLmVIE/GobzSMqbX+H3psYcQ2qFuWGKs/qR7BmmhcNsZLoCau7AiVU
 uRWC244RAOLFfwQKP8k10jZm7nCuA2v3muz3L6B4GXoRZlswAV+0DbfHz8d4rZEl5USF qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7h0jjm6-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 20 May 2019 10:58:55 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F34EE3A;
 Mon, 20 May 2019 08:58:54 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 01B67178E;
 Mon, 20 May 2019 08:58:53 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May
 2019 10:58:53 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May 2019 10:58:53
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 May 2019 10:58:39 +0200
Message-ID: <1558342719-11895-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] sysreset: syscon: add support for power off
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

The new type sysreset 'POWER_OFF', introduced by
commit 751fed426f87 ("sysreset: Add a way to find the last reset")
is only supported for "syscon-poweroff" compatible.

For details see Linux binding:
./Documentation/devicetree/bindings/power/reset/syscon-poweroff.txt

This patch removes the support of POWER_OFF for "syscon-reboot"
and keeps only the COLD reset (for command reset support)
and it introduces the compatible "syscon-poweroff"
for the POWER_OFF case.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/sysreset/sysreset_syscon.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/sysreset/sysreset_syscon.c b/drivers/sysreset/sysreset_syscon.c
index 1028160..d0e586f 100644
--- a/drivers/sysreset/sysreset_syscon.c
+++ b/drivers/sysreset/sysreset_syscon.c
@@ -23,8 +23,9 @@ struct syscon_reboot_priv {
 static int syscon_reboot_request(struct udevice *dev, enum sysreset_t type)
 {
 	struct syscon_reboot_priv *priv = dev_get_priv(dev);
+	ulong driver_data = dev_get_driver_data(dev);
 
-	if (type == SYSRESET_POWER)
+	if (type != driver_data)
 		return -EPROTONOSUPPORT;
 
 	regmap_write(priv->regmap, priv->offset, priv->mask);
@@ -53,7 +54,8 @@ int syscon_reboot_probe(struct udevice *dev)
 }
 
 static const struct udevice_id syscon_reboot_ids[] = {
-	{ .compatible = "syscon-reboot" },
+	{ .compatible = "syscon-reboot", .data = SYSRESET_COLD },
+	{ .compatible = "syscon-poweroff", .data = SYSRESET_POWER_OFF },
 	{ /* sentinel */ }
 };
 
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
