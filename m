Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 540D1323ACD
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Feb 2021 11:52:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D702C57B55;
	Wed, 24 Feb 2021 10:52:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB9B9C3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 10:52:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OApNlg006019; Wed, 24 Feb 2021 11:52:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=c+/6qbLv95EHY9jWgxpawCImyoQjFyYAzFnYc0y6FjY=;
 b=rp3UOS+J8GirrVQpFSDp9mUhWR2roFAXnGWvZAVtD3eBtb8Y3c4j1YRopQiMNfoJIp1s
 PDgk86uAV396mpez8rr8h9dBbVf00h8ebdMdPwo4Qaw7ROchl3PsQ7dom+OBIEcivfrc
 jZ5EOLamj6gkwjdjiTkrCdh7zqoU/niGuCH/TY43CgOwv/8BWkuMXyyadDdYBohKXMz9
 RRGhsVFQyPbytXtMXn+JQ5BPaELK0nmmpOoA6LuPjP6zZLuyn/rQBSTbeB8gJ5L/ufR1
 i7RX9ThJQuFLcFjkP0tjIkAmGeZaxoZeB/ZieOnPq0x77m2Hv0gblEEz4rZ7NL2K1czB Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66xweqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 11:52:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BBFBC10002A;
 Wed, 24 Feb 2021 11:52:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF25D22767F;
 Wed, 24 Feb 2021 11:52:39 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Feb 2021 11:52:39
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Feb 2021 11:52:35 +0100
Message-ID: <20210224115218.RFC.1.Ie56b2c6882d80bb19c6e899de5ddeca350a89d61@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224105236.25663-1-patrick.delaunay@foss.st.com>
References: <20210224105236.25663-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_03:2021-02-24,
 2021-02-24 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>
Subject: [Uboot-stm32] [RFC PATCH 1/2] env: sf: add missing spi_flash_free
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

Free the SPI resources by calling spi_flash_free() in each env sf
function to avoid issue for other SPI users.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 env/sf.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/env/sf.c b/env/sf.c
index 6b61a4b8de..acbd712aef 100644
--- a/env/sf.c
+++ b/env/sf.c
@@ -149,6 +149,9 @@ static int env_sf_save(void)
 	printf("Valid environment: %d\n", (int)gd->env_valid);
 
 done:
+	spi_flash_free(env_flash);
+	env_flash = NULL;
+
 	if (saved_buffer)
 		free(saved_buffer);
 
@@ -246,6 +249,9 @@ static int env_sf_save(void)
 	puts("done\n");
 
 done:
+	spi_flash_free(env_flash);
+	env_flash = NULL;
+
 	if (saved_buffer)
 		free(saved_buffer);
 
@@ -404,6 +410,9 @@ static int env_sf_init_early(void)
 		gd->env_addr = (unsigned long)&tmp_env1->data;
 	}
 
+	spi_flash_free(env_flash);
+	env_flash = NULL;
+
 	return 0;
 err_read:
 	spi_flash_free(env_flash);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
