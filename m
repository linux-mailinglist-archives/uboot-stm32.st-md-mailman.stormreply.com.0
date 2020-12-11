Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 029772D75B1
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Dec 2020 13:36:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AF91C3FADC;
	Fri, 11 Dec 2020 12:36:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37B07C3FADB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Dec 2020 12:36:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BBCQueS015255; Fri, 11 Dec 2020 13:36:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=T0WgykCbq4pcoQ0s1H9mzUP52Kf+WQXD2YFyJEX8MPs=;
 b=O+AwkcGseEsg+2WasCO93i7baszoHjSzN+z3BVSmv++ITOgCa1Cwe/mpldB0RupGaV2P
 uXbp2oLQySgBTPW/3TcSxkfqMqFgOntSkTU+z1zF+QrJt64gobFnsreFLwlq/YJAZXbR
 lRCtdrDIjdcPRr6pt9/d4PXiBRIyJfriGXZCVQhk8Wr4wWp1EvMKJzrxWi7mKzVS6K06
 GO90otgV93njzAovhFmw1iVp3SZgecdVr19gvviID+yO6bkyqluZsz+QuVcaXdkn+zGY
 +B1WA5f2PFjFqw7ooc/DUI+7PUYDz3RXbGJ0UcmJIEfzQvZ/NafmRm/zPBBaN0dZ5yhf qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35agwg2kra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Dec 2020 13:36:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C2857100034;
 Fri, 11 Dec 2020 13:36:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B7CAA24D2DD;
 Fri, 11 Dec 2020 13:36:20 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Dec 2020 13:36:20
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 11 Dec 2020 13:36:18 +0100
Message-ID: <20201211133612.1.I5168c97ed041354102af2ba6ba3f5b3e5d0b9a47@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-11_02:2020-12-09,
 2020-12-11 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] arm: stm32mp: stm32prog: always flush DFU on
	start command for uart
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

From: Patrick Delaunay <patrick.delaunay@st.com>

Remove the test on data->dfu_seq, because dfu_seq=0 not only when
the DFU is not started (mask with 0xffff). This flush is mandatory
as the final treatment, common with USB, is done in DFU callback.

This patch avoids issue if the received length is a multiple of
the DFU packet.

For example if size of bootfs partition is egual to 0x4000000,
data->dfu_seq=0 at the end of the partition, the flush it not
requested and the phase is not increased in the callback.
U-Boot continue to request the bootfs in the next GetPhase command.

Fixes: 468f0508b58b ("stm32mp: stm32prog: add serial link support")
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 .../mach-stm32mp/cmd_stm32prog/stm32prog_serial.c   | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
index 8aad4be467..8fba92b2b5 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
@@ -397,14 +397,13 @@ static u8 stm32prog_start(struct stm32prog_data *data, u32 address)
 		if (!dfu_entity)
 			return -ENODEV;
 
-		if (data->dfu_seq) {
-			ret = dfu_flush(dfu_entity, NULL, 0, data->dfu_seq);
-			data->dfu_seq = 0;
-			if (ret) {
-				stm32prog_err("DFU flush failed [%d]", ret);
-				return ret;
-			}
+		ret = dfu_flush(dfu_entity, NULL, 0, data->dfu_seq);
+		if (ret) {
+			stm32prog_err("DFU flush failed [%d]", ret);
+			return ret;
 		}
+		data->dfu_seq = 0;
+
 		printf("\n  received length = 0x%x\n", data->cursor);
 		if (data->header.present) {
 			if (data->cursor !=
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
