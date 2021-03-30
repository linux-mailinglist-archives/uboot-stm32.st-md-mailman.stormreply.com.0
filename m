Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FA334E91B
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Mar 2021 15:29:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0516C5719E;
	Tue, 30 Mar 2021 13:29:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75E53C5719D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 13:29:11 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12UDLxNt002250; Tue, 30 Mar 2021 15:29:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=XwSsLspLtBpTPc0lA56sfxhda2dkrQ13BMW3VYyhU0Q=;
 b=TGa+aW+8ZGsCcJyIGaiwEcmNbaKk4ii83YtpRu3AqFnBrUCUrZ+qG5JhRmiK26iAVa8h
 vmtv/+20BBzixiBOc4sRCWp6Ght893DOCA++JLLHQirHZUqRecM/WyuN+z5wqaVVnLkN
 X6y9YKZnITEJc9Vx0jcvh4nmvsTKISoL2LxBe4QA1cLXPl7w51ACBZdmKas4ElGthDWC
 ANvEm6DYJXcNtjmLlUQ21wOVaqN09Av959UpzZkTcRbUMz5G7lxFNDMAwAxryv4/fADp
 Bn6Li0RoBDkgAzDU9G5rM/HFtvsv25XRnNPIBd/9Nm6g/8eCguPifkW0jH6zA40Ca1NT qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37kxrwtj1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 15:29:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BAB7010002A;
 Tue, 30 Mar 2021 15:29:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 281AF25C103;
 Tue, 30 Mar 2021 15:29:06 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 30 Mar 2021 15:29:05
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Mar 2021 15:29:03 +0200
Message-ID: <20210330152813.1.I5743d7539eaa2c2c5a15114120d50ef8eece1431@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-30_04:2021-03-30,
 2021-03-30 signatures=0
Cc: Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Etienne CARRIERE <etienne.carriere@foss.st.com>
Subject: [Uboot-stm32] [PATCH] scmi: translate the resource only when
	livetree is not activated
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

Call the translation function on the ofnode_read_resource result only
when the livetree is not activated.

Today of_address_to_resource() calls ofnode_read_resource() for livetree
support and fdt_get_resource() when livetree is not supported.

The fdt_get_resource() doesn't do the address translation
so when it is required when livetree is activated but this address
translation is already done by ofnode_read_resource().

Fixes: 240720e9052f ("firmware: scmi: mailbox/smt agent device")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
Hi,

This patch is a short-term workaround for ofnode_read_resource translation
issue on stm32mp15 boards when scmi is used and OF_LIVE is activated.

A full solution is a patch in core to have the same behavior of the API
ofnode_read_resource() when livretree is activated or not:

fdt_get_resource()
  ...
        while (ptr + na + ns <= end) {
                if (i == index) {
  -                     res->start = fdtdec_get_number(ptr, na);
  +                     if (CONFIG_IS_ENABLED(OF_TRANSLATE))
  +                             res->start = fdt_translate_address(fdt, node, ptr);
  +                     else
  +                             res->start = fdtdec_get_number(ptr, na);
  +

I will propose it soon but it is more aggressive and impacts all the user
of fdt_get_resource() or fdt_get_named_resource() function;
this correct patch need more tests.

So I think it will take many time to be integrated so I prefer to
propose the current patch for a short term integration on
v2021.07.

Patrick


 drivers/firmware/scmi/smt.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/scmi/smt.c b/drivers/firmware/scmi/smt.c
index 4954355c1a..f1915c0074 100644
--- a/drivers/firmware/scmi/smt.c
+++ b/drivers/firmware/scmi/smt.c
@@ -41,8 +41,13 @@ int scmi_dt_get_smt_buffer(struct udevice *dev, struct scmi_smt *smt)
 	if (ret)
 		return ret;
 
-	faddr = cpu_to_fdt32(resource.start);
-	paddr = ofnode_translate_address(args.node, &faddr);
+	/* TEMP workaround for ofnode_read_resource translation issue */
+	if (of_live_active()) {
+		paddr = resource.start;
+	} else {
+		faddr = cpu_to_fdt32(resource.start);
+		paddr = ofnode_translate_address(args.node, &faddr);
+	}
 
 	smt->size = resource_size(&resource);
 	if (smt->size < sizeof(struct scmi_smt_header)) {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
