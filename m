Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E9E2E962D
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Jan 2021 14:41:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1428C56632;
	Mon,  4 Jan 2021 13:41:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD5C3C32EB1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jan 2021 13:41:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 104Dfj3b002264; Mon, 4 Jan 2021 14:41:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=21LHsCS9iDP8qC+QbpJp5NIL5+HGtqQWADvEuuHuu0M=;
 b=gRwnqaX0GzzbEQepednrdmgoDH1EFZdclKGzoncb/n8XA4e31DVuEN6f76XSd0uGRjdH
 CJ4EIoV1abKjNPfJ7Aj4Mf+gUjTUdBVu0wT6qes0FkCgImJEZPK5bNMmXpnUeRK114Bw
 CD5dDxAJGqpqB/j7Sm6+ENsTskw5Y3QzcezaRybNNwKh9zHn3s1H8Z7rpQyqMMCBy5iu
 sQmqhCOFdRDPMH0A2a5DSrSEl0gLMvS/pS0+hfJQcK8nyUVL8O9AoUtMD4KlUAWQkxqA
 UcJ6GkMSH8OwaiiEP6WQNESN6y/gYvNo5rxeYvX4auCg2U9tOMjBbJ0Alp4+cyFIxOy2 jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35teuutm0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 14:41:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B6D8B10002A;
 Mon,  4 Jan 2021 14:41:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A22D42BA2D1;
 Mon,  4 Jan 2021 14:41:44 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 Jan 2021 14:41:44
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 4 Jan 2021 14:41:31 +0100
Message-ID: <20210104144122.1.I2b5520b2a38d073b87acd144c15a1d2ac0aadf51@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_08:2021-01-04,
 2021-01-04 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>
Subject: [Uboot-stm32] [PATCH] env: sf: cosmetic: remove unnecessary space
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

Remove the unnecessary space before the 2 "done:" labels
in env_sf_save().

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 env/sf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/env/sf.c b/env/sf.c
index 91ed2860ed..42d762714e 100644
--- a/env/sf.c
+++ b/env/sf.c
@@ -139,7 +139,7 @@ static int env_sf_save(void)
 
 	printf("Valid environment: %d\n", (int)gd->env_valid);
 
- done:
+done:
 	if (saved_buffer)
 		free(saved_buffer);
 
@@ -236,7 +236,7 @@ static int env_sf_save(void)
 	ret = 0;
 	puts("done\n");
 
- done:
+done:
 	if (saved_buffer)
 		free(saved_buffer);
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
