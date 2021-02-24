Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A091323C0F
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Feb 2021 13:48:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8562C57B53;
	Wed, 24 Feb 2021 12:48:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B80BC3087A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 12:48:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OCgONL025809; Wed, 24 Feb 2021 13:48:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=tBxA/A4BiYUZ0KWsQW902Pfsm0uc6pZku32UHO/P7cA=;
 b=Rd0qrSjxfNS4bEXjqZGuVuBOLOMsFdVkKW3Ixaf4U9EW7QmL2qPc0xgqJJf7K55vXjbQ
 aVRwYvER+wr5jIxB/529AEQLyNCfO2m4iDrjKObby8hb+hdqse7bJIHD0bqlqFmc8X7i
 026vZVWm8yyI8+sbUwwKJw6Ffgx+ni4741kZFxyjhmb35RRk2nXUSC1rvMXkx9fcpzlH
 Ok24SlZ2PkBTeK8C9Gpd2F9xtsJKdpFH/r0wKdNeEw7b4FC9nqDxA1BFU1sMCqJJPqcK
 r3wARVASbbU9j+4jKIaAx2HZHIa5Z04HOwnwDQSQ7wvavRHU17xCPSYNQvCi5LjpdErZ 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66ve5pu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 13:48:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 453D510002A;
 Wed, 24 Feb 2021 13:48:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 358D222D600;
 Wed, 24 Feb 2021 13:48:16 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Feb 2021 13:48:15
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Feb 2021 13:47:55 +0100
Message-ID: <20210224124756.12491-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_04:2021-02-24,
 2021-02-24 signatures=0
Cc: Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: [Uboot-stm32] [PATCH] firmware: scmi: Replace memcpy_from/toio() by
	memcpy() in scmi_read/write_resp_from_smt()
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

From: Patrice Chotard <patrice.chotard@st.com>

To avoid "synchronous abort" in AARCH64 in case the "from" address
is not aligned, replace memcpy_toio() and memcpy_fromio() by memcpy().

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/firmware/scmi/smt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/scmi/smt.c b/drivers/firmware/scmi/smt.c
index d25478796a..b001163b62 100644
--- a/drivers/firmware/scmi/smt.c
+++ b/drivers/firmware/scmi/smt.c
@@ -93,7 +93,7 @@ int scmi_write_msg_to_smt(struct udevice *dev, struct scmi_smt *smt,
 			  SMT_HEADER_PROTOCOL_ID(msg->protocol_id) |
 			  SMT_HEADER_MESSAGE_ID(msg->message_id);
 
-	memcpy_toio(hdr->msg_payload, msg->in_msg, msg->in_msg_sz);
+	memcpy(hdr->msg_payload, msg->in_msg, msg->in_msg_sz);
 
 	return 0;
 }
@@ -124,7 +124,7 @@ int scmi_read_resp_from_smt(struct udevice *dev, struct scmi_smt *smt,
 
 	/* Get the data */
 	msg->out_msg_sz = hdr->length - sizeof(hdr->msg_header);
-	memcpy_fromio(msg->out_msg, hdr->msg_payload, msg->out_msg_sz);
+	memcpy(msg->out_msg, hdr->msg_payload, msg->out_msg_sz);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
