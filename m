Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B3D4208E2
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Oct 2021 12:00:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E3D1C5AB71;
	Mon,  4 Oct 2021 10:00:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39DBEC57182
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Oct 2021 10:00:20 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194565eS017627; 
 Mon, 4 Oct 2021 12:00:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=5n811FDWNliN2jGxhiRryKLfG7pNjZzxsuKgdBTE3bk=;
 b=R9syxguI4gPjx/wetxtjSvv67ZZV7qB3wJCCO3SYkrnXx1x5HJq3wp/lFGv5SIOfw4Sm
 EKbXW8/wRtOr6YYjb+NDkcEW4dqs3L8+PKnRd8NFCuO6evdUl6elRRY9G2xVSAiB5/0s
 /G+wPFyWjRgjpnlPM8Ak8GVAttlG07N7EtpC3vWeYzyTHpgPbRc8cWpHP/GltpAdkP7u
 zO8k7jarD3j5dJIp8ze8bUYd8JBP4bvh+D9Uu1HF2Xmx92JCdpHHboKhT6FpZ2ip3wwD
 jYemZAL7z1NV5Fork3kmLA21aMxBs8TPfcTyNz4FzpueAbpGLhAAxPFZydyGOmHSBF5j 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bfu5y1dkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 12:00:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 938FA100038;
 Mon,  4 Oct 2021 12:00:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8D4B1233C6A;
 Mon,  4 Oct 2021 12:00:16 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 4 Oct 2021 12:00:16
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 4 Oct 2021 11:59:55 +0200
Message-ID: <20211004115942.6.Ia3825658ff431b2f6ff143ee01c2d44d24219558@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
References: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_02,2021-10-01_02,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Stefan Roese <sr@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 6/6] scripts: remove CONFIG_IS_ENABLED in
	config_whitelist.txt
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

Redefine the macro CONFIG_IS_ENABLED is not allowed,
so this entry can be removed in whitelist file.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 scripts/config_whitelist.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index b3ebd20c57..41a0952c97 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -649,7 +649,6 @@ CONFIG_IRAM_SIZE
 CONFIG_IRAM_STACK
 CONFIG_IRAM_TOP
 CONFIG_IRDA_BASE
-CONFIG_IS_ENABLED
 CONFIG_JFFS2_DEV
 CONFIG_JFFS2_LZO
 CONFIG_JFFS2_NAND
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
