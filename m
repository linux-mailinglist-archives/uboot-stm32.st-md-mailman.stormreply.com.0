Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F362B8E63
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Nov 2020 10:09:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8021AC56630;
	Thu, 19 Nov 2020 09:09:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6F39C35E3C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Nov 2020 09:09:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJ97CbJ011381; Thu, 19 Nov 2020 10:09:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=zHu4AJnuRsPmF8Hmm8ki6rp6/QZcH57oHsCFrT+1SRM=;
 b=bHjXYY6x674JBEWUuaBzDSHYUIr7cAMiqYbFj+W4WBqWZxoMc61T5IkxM5994od5DgWH
 yRwz0AfJXohENoOyfOkjVJr0cUGX9An0RQg0+1Nbi74Iflbndxn+HmPmXJwWnZeQe3+p
 1L4cv1psMt1SwWAOqYQrlMu0a8G/k0V6QaUbxFRmUV8NMlVjj+Ii0vrspSM25vWqZlPb
 mv/GMeLWM8P0dcBuyvPQnotQQE7Hk6fzWj2Jsa8cwqQ2k0t9b6MOSv5N5A0rUu7sw4aP
 Xo2p0b44KxTro5/EpQl2P9wy6F09pd/ghIvy2GXYPQDxuNRCaZLmDwRQZfjaUQRN0RoH 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34t58cy2mg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 10:09:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 95D3A10002A;
 Thu, 19 Nov 2020 10:09:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B163236ED1;
 Thu, 19 Nov 2020 10:09:15 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Nov 2020 10:09:15
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 19 Nov 2020 10:08:42 +0100
Message-ID: <20201119090843.5614-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119090843.5614-1-patrick.delaunay@st.com>
References: <20201119090843.5614-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_05:2020-11-17,
 2020-11-19 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/3] test: correct the test prefix in ut
	cmd_mem
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

Align the prefix used in cmd_ut_category function and name of tests
for ut mem.
This patch solves the issues detected by "make qcheck" after previous
patch.

Fixes: 550a9e7902ce ("cmd: Update the memory-search command")
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 test/cmd/mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/cmd/mem.c b/test/cmd/mem.c
index fa6770e8c0..fbaa8a4b3c 100644
--- a/test/cmd/mem.c
+++ b/test/cmd/mem.c
@@ -15,6 +15,6 @@ int do_ut_mem(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
 	struct unit_test *tests = ll_entry_start(struct unit_test, mem_test);
 	const int n_ents = ll_entry_count(struct unit_test, mem_test);
 
-	return cmd_ut_category("cmd_mem", "cmd_mem_", tests, n_ents, argc,
+	return cmd_ut_category("cmd_mem", "mem_test_", tests, n_ents, argc,
 			       argv);
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
