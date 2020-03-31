Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F509199AD2
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 18:05:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BF62C36B18
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 16:05:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E885C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 16:05:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VG3FHX025814; Tue, 31 Mar 2020 18:05:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=wUTWrB6Nis+z6lDewgvpOpvnKWykk/1VJ0U/OQ8NnPs=;
 b=ogoA9e9ZQxFMoMcY9BUI6uU2PxJ5u3bCI/T6lFklCxjpY4hx2A3HLtRA4JW0AwV1Vil4
 5QByU0OVSR+ogQxMQfv+x9bTlVr6Qz6QwLnZBtsFup3swJ603ndQSMzT1+TCL6IppJm2
 rmqWsSsqiesOuuWFURLIYzfHcxQRnFca7dVHNc3UnNM6dtmpYlsGCTXtxH1eDYEygr5f
 /OK63soZIP26VGvaswsV9FCoeRaSKzNH7InT27OHGDxtlp+EnrC2tlLydbwU/3tmMyG3
 rbbg1iG5T1lTgtq7vPjjsHQHxX+AU1I0FnMxsMHYF5qqlBjnVJ+12/IJqIlG0e5VNmgG Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301vkdrd4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 18:05:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D003E10002A;
 Tue, 31 Mar 2020 18:05:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C91C72BEC6E;
 Tue, 31 Mar 2020 18:05:02 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 31 Mar 2020 18:05:02 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 31 Mar 2020 18:04:28 +0200
Message-ID: <20200331180330.11.Ic051e25812481db408f2431c7962da1db1f198fb@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_05:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 11/16] board: stm32mp1: check env_get result
	in board_late_init
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

This patch avoids crash in strcmp when the boot_device is not
present in environment (this case should be never occur)

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 89a088cd28..fff4cef2c2 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -753,7 +753,8 @@ int board_late_init(void)
 
 	/* Check the boot-source to disable bootdelay */
 	boot_device = env_get("boot_device");
-	if (!strcmp(boot_device, "serial") || !strcmp(boot_device, "usb"))
+	if (boot_device &&
+	    (!strcmp(boot_device, "serial") || !strcmp(boot_device, "usb")))
 		env_set("bootdelay", "0");
 
 	return 0;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
