Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64630494830
	for <lists+uboot-stm32@lfdr.de>; Thu, 20 Jan 2022 08:19:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 085DDC5AB61;
	Thu, 20 Jan 2022 07:19:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57E77C57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jan 2022 07:19:28 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20K3tMJR014913;
 Thu, 20 Jan 2022 08:19:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=Xi6MfA/fZqECX6ixa2kw/rKcQ3mffgTxeZ4urN7cqhg=;
 b=2KV1VaVixV6NSi/ro4kW56ipaChlgELoNLdRrWo23VuY2slv5CPqKtqxiHulGHqUqmj2
 Wt0NgPCVW3JxNtvAgDxAovgaxZ/cNf1QKT50qbmc2ud2Cp+2/dcKy9bzC42YSkXazbGB
 ZiKMIN7zZdhVXEyM57PAbDko/urc94kR5w4hsqEZrTzV7Q+6pVzoYGmdoCpQNfLXv2UE
 66bhG2P3N8NU2R3mV6UTv/IB5nAiURiRQfKZ/TibpRmu7ArJT9oOHF8eIZd/fwRqsvJz
 Ei5wKFUuooEqNvsSAw7Qtqij79goXig+5Kf6wyTdFCLylKOvRQ3W4yfnj0fGBQQ4I8H7 3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dppmutvr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jan 2022 08:19:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AD99C10002A;
 Thu, 20 Jan 2022 08:19:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 888DB20C118;
 Thu, 20 Jan 2022 08:19:26 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE1.st.com (10.75.127.4)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 20 Jan 2022 08:19:25
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 20 Jan 2022 08:19:15 +0100
Message-ID: <20220120071915.8314-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_02,2022-01-19_01,2021-12-02_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] configs: stm32mp15: Enable OF_BOARD flag
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

Since commit 985503439762 ("fdt: Don't call board_fdt_blob_setup()
 without OF_BOARD") board_fdt_blob_setup() is no more called on
STM32MP platforms in trusted boot which hangs during boot process.

Enable OF_BOARD flag to fix this issue.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/mach-stm32mp/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index a6c7fc5bfd..1ef426c0e0 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -40,6 +40,7 @@ config STM32MP15x
 	select CPU_V7A
 	select CPU_V7_HAS_NONSEC
 	select CPU_V7_HAS_VIRT
+	select OF_BOARD if TFABOOT
 	select OF_BOARD_SETUP
 	select PINCTRL_STM32
 	select STM32_RCC
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
