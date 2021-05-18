Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF8938799E
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 May 2021 15:12:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23755C59788;
	Tue, 18 May 2021 13:12:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3CE5C57B74
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 13:12:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IDBwnW024389; Tue, 18 May 2021 15:12:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=3L63zgiJTLuxe9KPOuy/U6jCDhjjhuCL47mHovUbZ9k=;
 b=chSlNnRPWB5Nt2ug5fyhj+lXQh/IzghjBE1dP8rVUECqCDFHiw2pbu55hzYCx8uvcc9m
 mbHQ9XTQ9aKItVx4wR2Zl0Mr3teWiYJ/YocvIZhZTaqMIhFXTL/z/rKzY5kigngmh2xq
 w71czrs6aY1v/q5pwJBNal8IuH09tZ7/5d0ogB5jD+kJDJku743O6FOVE4N7v9+RgWCo
 ned6M7Bb5HVF0ejxoyeS8paQqOo9ceF/s1IzsaH2OB5MTIiZH1qD2QDel7KhvLmPESwu
 ZRue364EPe6VbTYgumejc99JYeQCdKlY5GKoaINE+re8/XBM3AAphGBADZzDyTJquQuh ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38km707wp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 15:12:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AFC3A10002A;
 Tue, 18 May 2021 15:12:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A6D852275E0;
 Tue, 18 May 2021 15:12:22 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May 2021 15:12:21
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 May 2021 15:12:08 +0200
Message-ID: <20210518151206.5.Ic81eb7eb5bd44c0d9022eb4b7aed823a934eecda@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
References: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-18,
 2021-05-18 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 05/10] stm32mp: stm32prog: handle the next
	phase after USB re-enumeration
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

Handle the second USB enumeration only when the flashlayout is received
and when phase is PHASE_FLASHLAYOUT. This patch removes the call of
stm32prog_next_phase as it is already done in stm32prog_dfu_init().

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
index bc44d9fc8f..d4a3f7ea16 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
@@ -207,13 +207,10 @@ bool stm32prog_usb_loop(struct stm32prog_data *data, int dev)
 
 	if (stm32prog_data->phase == PHASE_FLASHLAYOUT) {
 		ret = run_usb_dnl_gadget(dev, "usb_dnl_dfu");
-		if (ret || stm32prog_data->phase == PHASE_DO_RESET)
+		if (ret || stm32prog_data->phase != PHASE_FLASHLAYOUT)
 			return ret;
 		/* prepare the second enumeration with the FlashLayout */
-		if (stm32prog_data->phase == PHASE_FLASHLAYOUT)
-			stm32prog_dfu_init(data);
-		/* found next selected partition */
-		stm32prog_next_phase(data);
+		stm32prog_dfu_init(data);
 	}
 
 	ret = run_usb_dnl_gadget(dev, "usb_dnl_dfu");
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
