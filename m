Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E764D212A08
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 18:48:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A81DDC36B26
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 16:48:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF2E2C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 16:48:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062GjIig029829; Thu, 2 Jul 2020 18:48:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=E2VSvRh9nG9/lNtgR8ISzNV0YvoEbrKeYPUIpBw7/Lk=;
 b=EZkGKUoNnzf9AVRMjnsgBkO0gNFNCbSgkXffgPbjYDJqSsZWiwr/wQolMdSQKd4xPTWh
 6uwxIP3sGE6/WoU/64LqZZc3wGrXcdCHJRuKCRdolWG6b17yFNc12yacgC//5X+Sm5zD
 sU8a/Vm1NtmxagDgy8xp3Dqf4fOXhBsPbCwIgXM2bEx3tcp6QS9PWsCq6gPzOGsYjuZs
 lTeuUBJeoZfieNO+NTk4veBSrX5Abk5f7ePiF259abIXVaizztG78QD5H/djI8bPMgAq
 H+0jWuq9JEmepIeCwJWKINnZNo4+9uQiqJrO8O4k74P4p59tqA1+XbYkPdffZNFkCn7H KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wu8a1s3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 18:48:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B5AE010002A;
 Thu,  2 Jul 2020 18:48:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A4CCF2C97AB;
 Thu,  2 Jul 2020 18:48:05 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 2 Jul 2020 18:48:05 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 2 Jul 2020 18:48:02 +0200
Message-ID: <20200702164802.15079-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_09:2020-07-02,
 2020-07-02 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2] stm32mp1: use the command env info -q in
	env_check
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

Activate the new option -q in command "env info"
to avoid unnecessary trace during boot.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---
Hi,

This patch was previous included in V3 serie 158105.

This patch have dependency with serie 184539 for -q option
and with serie 187232 for stm32mp1 env_check update.


Changes in v2:
- correct commit message (commit-notes) and add review by Patrice

 include/configs/stm32mp1.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index e927787be0..038a639843 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -155,7 +155,7 @@
 	"splashimage=0xc4300000\0"  \
 	"ramdisk_addr_r=0xc4400000\0" \
 	"altbootcmd=run bootcmd\0" \
-	"env_check=if env info -p -d; then env save; fi\0" \
+	"env_check=if env info -p -d -q; then env save; fi\0" \
 	STM32MP_BOOTCMD \
 	BOOTENV \
 	"boot_net_usb_start=true\0"
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
