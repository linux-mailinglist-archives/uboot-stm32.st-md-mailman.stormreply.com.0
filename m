Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 936421830BF
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Mar 2020 13:59:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 478A9C36B0D
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Mar 2020 12:59:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EC81C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2020 12:59:28 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02CCn1Lt018534; Thu, 12 Mar 2020 13:59:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Im2jESaLAe+/asCY3pC4x8QPR72QwOIWCghTtM1DAoI=;
 b=LWU4XgNbwWvdMdWkF6zhnQbZDr9SSiurvInYZF4DiffrV10aF0VCMPE3Ro1pkswCiTYs
 d6g5IOaLxe/kmchXftEmAch2SBMNuj+4tiJCmot+S44AWpWmIW4cluyNSWn5uCF9cWGI
 oPA7M4QcEf3rTAqDppC667IMGngfZUHNCznpRXWnPTiUvliCokBjjEt9SPjmEYVCdpl6
 DxYVzfJpvsvUnR3BPP7VpZRm62xqon27AwfMqexX/XK8AGvqmldEgQPvG21j1acjmXY0
 i5cEnQ1Izr4/tn2yLX091OVUVW8WSIj3FSayPCYAHoRWfavu47EaSWbMhwOnocdsWtaw 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ynecdrr0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Mar 2020 13:59:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0507B100042;
 Thu, 12 Mar 2020 13:59:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E69DB2A88E1;
 Thu, 12 Mar 2020 13:59:23 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 12 Mar 2020 13:59:23 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 12 Mar 2020 13:59:19 +0100
Message-ID: <20200312135913.1.I98f004eb93dff0dad8ebd9447a3cff76bd1ecc91@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-12_04:2020-03-11,
 2020-03-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] usb: host: dwc3-sti-glue: Use UCLASS_NOP
	instead of UCLASS_MISC
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

dwc3-sti-glue has been broken since MISC uclass has been
modified to scan DT sub-nodes after bind.
Fixing it by a using the no-op uclass.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 drivers/usb/host/dwc3-sti-glue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/dwc3-sti-glue.c b/drivers/usb/host/dwc3-sti-glue.c
index ad7cf6e6b53d..f25e1dc6640c 100644
--- a/drivers/usb/host/dwc3-sti-glue.c
+++ b/drivers/usb/host/dwc3-sti-glue.c
@@ -245,7 +245,7 @@ static const struct udevice_id sti_dwc3_glue_ids[] = {
 
 U_BOOT_DRIVER(dwc3_sti_glue) = {
 	.name = "dwc3_sti_glue",
-	.id = UCLASS_MISC,
+	.id = UCLASS_NOP,
 	.of_match = sti_dwc3_glue_ids,
 	.ofdata_to_platdata = sti_dwc3_glue_ofdata_to_platdata,
 	.probe = sti_dwc3_glue_probe,
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
