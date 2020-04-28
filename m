Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B271BBCD2
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Apr 2020 13:50:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2C81C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Apr 2020 11:50:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5CA2C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 11:50:03 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03SBgMUF023832; Tue, 28 Apr 2020 13:50:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=llSd3nqPbSmolaL2PNJB4GsVcWMTOU5Ae9NrakB5CGY=;
 b=SfOC8SCj2D12Ls8N/sOKzNwRD1wfzCDy6FSW84kKCHVKNbPVyukoMG7XWsZ7ki3A3b6h
 Opmb3ig/pTc06bi7LFh39ENqy0oCd0Ou0pJ+6bncJS7lRhtR5M777kSk9VbwrGcLJ1HR
 tA9j73aFe4I2b3m4JAEsCPDBWC9qp6Pf/gwGy1pzFQwUImFa3BTtiaXAr209eLxO9a55
 FPtA6YUWW00iDFHORXzUr8KRUu/BqkkknBpvyPBHWTC2xkmERISIHdkQZOu3m41x4tgj
 bK4S09xefJ//UPW1zRuyjE+VLdHCEtfqBapw8rUvHeMl8RtNvNPdqOMsiRchotjtBtVT HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhcbyk2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 13:50:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3C170100034;
 Tue, 28 Apr 2020 13:50:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 26C172B0356;
 Tue, 28 Apr 2020 13:50:00 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Apr 2020 13:49:59 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Apr 2020 13:49:50 +0200
Message-ID: <20200428134918.1.I98f004eb93dff0dad8ebd9447a3cff76bd1ecc91@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-28_07:2020-04-28,
 2020-04-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RESEND PATCH] usb: host: dwc3-sti-glue: Use
	UCLASS_NOP instead of UCLASS_MISC
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
index c99a1985cca5..99d4e29414aa 100644
--- a/drivers/usb/host/dwc3-sti-glue.c
+++ b/drivers/usb/host/dwc3-sti-glue.c
@@ -239,7 +239,7 @@ static const struct udevice_id sti_dwc3_glue_ids[] = {
 
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
