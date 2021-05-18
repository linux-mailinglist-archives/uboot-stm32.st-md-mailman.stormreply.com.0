Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2F93879A3
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 May 2021 15:12:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5506C5978D;
	Tue, 18 May 2021 13:12:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53595C5978A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 13:12:28 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14ID6xkG003234; Tue, 18 May 2021 15:12:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=IWaQdvmHS1rTX7dgkM2AajuHeP/V8CP7EiiMi6J6fJg=;
 b=W8VGO/yUm+FmubiKSRLSvskT9w3oMqApJRMQi5vojq2C4XDkiZdC2l5cMpWD5wVyoB7r
 nD2/aYeOMPxuS9gVExkOcnSHnnwrl3zG4z30XSlX22jltA2vZus0F7z6WNL8EjdG7oWA
 PebQg8e3ljala+7DujL567JSSUxJFCaZX9UmWxnJnl31BeOot1DSOs/mRiMEKVvsSwNG
 qmIyydGL0t6LqnHrShHUbVA+iDFFQ1dV1YwxJbsSySimQdHcFeZb+AXU95qW+/lWqlkm
 prtvpsROdyTkNf38SmuTXvagBAlSxqwSQ1O8gccLU176mo4LwVAO5SGOzL3KS+j1FemO nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38maunsb52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 15:12:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7662D100034;
 Tue, 18 May 2021 15:12:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6B97D2275E1;
 Tue, 18 May 2021 15:12:26 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May 2021 15:12:25
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 May 2021 15:12:11 +0200
Message-ID: <20210518151206.8.I356522a80eec573678c8a84e06f1dbba4b380f29@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
References: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-18,
 2021-05-18 signatures=0
Cc: Simon Glass <sjg@chromium.org>, Patrick
 Delaunay <patrick.delaunay@st.com>, U-Boot
 STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 08/10] stm32mp: stm32prog: change one message
	level to debug
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

Move the message "Invalid or missing layout file."
to debug level as it is a normal behavior and not an error
and add the missing '\n'.

This patch avoids the strange trace :
  Boot over usb0!
  Invalid or missing layout file.DFU alt info setting: done

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index f3790f900f..feff73c79e 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -99,7 +99,7 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
 
 	ret = stm32prog_init(data, addr, size);
 	if (ret)
-		printf("Invalid or missing layout file.");
+		log_debug("Invalid or missing layout file at 0x%lx.\n", addr);
 
 	/* prepare DFU for device read/write */
 	ret = stm32prog_dfu_init(data);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
