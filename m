Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9D8354DD1
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Apr 2021 09:27:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6555EC57B69;
	Tue,  6 Apr 2021 07:27:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77AC8C57B5E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Apr 2021 07:27:44 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1367R8fM025846; Tue, 6 Apr 2021 09:27:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=twJeGcRfOG/R56jvMU4XppOJmdL953zpmy1DYcCnk0Q=;
 b=CRaOhMM7mE0N3fxVUZnjOieE5qjyS78ybfDEZQNpSDx2+O7qvtwiY1NWrxs+7JF27iEv
 hiF/3LMdjQy/ab7kT4BW8iY8Xz9gbRSpFOgt57bBB+T8WUMaGjlBdvlFOb6vc7YiN3hX
 ZJI8y7fFanpQI8UzzuJyruFw18D59OFztgZpUsrKtJyZNo9LzO5U90eaH94/3Oq7LyBM
 Ch++muo1tKbRzbZBSdw9TY3orjIEP29Z5eitaLr4K8Lls9ohIZeE5oNmiqNojTefzyEn
 w/cIpWKFej2ODycr0Jq+Q7DMCDzfv9vamhlk/LMshu/eK4rsJekj5tkFpqFiff/UoUuK JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37rjf009ph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 09:27:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF0EC10002A;
 Tue,  6 Apr 2021 09:27:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A4D7221E68E;
 Tue,  6 Apr 2021 09:27:42 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 6 Apr 2021 09:27:42
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 6 Apr 2021 09:27:38 +0200
Message-ID: <20210406092731.1.Iad88039569017850ed77dfae267b261f8efc8ad7@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_01:2021-04-01,
 2021-04-06 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] stm32mp: update uart number in trace of
	serial device not found
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

Align the uart number in the trace of setup_boot_mode() with the name of
the uart/usart device (start at 1) and not with the instance value
(start at 0), i.e. the serial device sequence number and the index in
serial_addr[].

Fixes: f49eb16c17e2c ("stm32mp: stm32prog: replace alias by serial
device sequence number")

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 897ec13ad8..2f05c5e91b 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -503,7 +503,7 @@ static void setup_boot_mode(void)
 				gd->flags &= ~(GD_FLG_SILENT |
 					       GD_FLG_DISABLE_CONSOLE);
 			printf("uart%d = %s not found in device tree!\n",
-			       instance, cmd);
+			       instance + 1, cmd);
 			break;
 		}
 		sprintf(cmd, "%d", dev_seq(dev));
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
