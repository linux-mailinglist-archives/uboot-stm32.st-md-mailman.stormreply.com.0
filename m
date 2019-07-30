Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF617AAF4
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 16:28:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FEFCC36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 14:28:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E263C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 14:28:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UEPaNn007862
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 30 Jul 2019 16:28:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=LVVUVv3AUV05pT73TNF3cJwMUCKPkvXp9yAHdQkKLRA=;
 b=mOx/s2PkOxIHljhPwCiw6aKkl9+ixj2/kgn0ewob38WKaEqH2JPFAa0hlhfsmOJuPcD7
 yjRGepKIclKxoJA3QgTQn3EijsD3hcYuAb4HZOtsfK7KUDA/LCLVC5E3LKuYHc41MWDt
 AILW8E9fh+IrJYbvRqUkYLsrfqwG44OfSComy+ugVYaw6bwTsxkTuEBuA60TFjEBp5ZV
 4LptghEnY8p1X8vpYEZHaqWezgIuA+k0/Ktsf96FrGwOQCpVetBuDC/++mxiIzouHtkA
 BhEJLXRrokegU+sHbyou+5Z/4h6D9pCT6tcI1VUo6QNT/e6RfFpCZ7FY+wYIIe4w6Hf7 tA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp49jmq-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 30 Jul 2019 16:28:55 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8F0663D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 14:28:54 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8699118D8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 14:28:48 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 16:28:48 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 16:28:47
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: Patrick Delaunay <patrick.delaunay@st.com>, Patrice CHOTARD
 <patrice.chotard@st.com>
Date: Tue, 30 Jul 2019 16:28:41 +0200
Message-ID: <1564496921-15594-4-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564496921-15594-1-git-send-email-patrick.delaunay@st.com>
References: <1564496921-15594-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_07:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [U-BOOT internal][PATCH 3/3] usb: host: dwc2: add
	trace to have clean usb start
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

Solve issue for display of usb start command on stm32mp1,
because the carriage return is missing in DWC2 probe.

STM32MP> usb start
starting USB...
USB0:   USB1:   USB EHCI 1.00

after the patch:

STM32MP> usb start
starting USB...
USB0:   USB DWC2
USB1:   USB EHCI 1.00

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/usb/host/dwc2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
index 06db8da..a634346 100644
--- a/drivers/usb/host/dwc2.c
+++ b/drivers/usb/host/dwc2.c
@@ -1214,6 +1214,8 @@ static int dwc2_init_common(struct udevice *dev, struct dwc2_priv *priv)
 	if (readl(&regs->gintsts) & DWC2_GINTSTS_CURMODE_HOST)
 		mdelay(1000);
 
+	printf("USB DWC2\n");
+
 	return 0;
 }
 
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
