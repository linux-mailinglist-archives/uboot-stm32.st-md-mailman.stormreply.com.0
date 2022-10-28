Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A9E610C9F
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Oct 2022 11:01:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECE09C04003;
	Fri, 28 Oct 2022 09:01:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2573CC03FC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 09:01:45 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29S86mJ8013073;
 Fri, 28 Oct 2022 11:01:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=eVO7s89PQuG3fcgq7DAnStQuungjwMFvIP4mL2HdI5s=;
 b=0K9ofNBrN0r3pSHprYMy465hbvHrC/rkoGB9HSjqYFaP+88d1Iw3xsLXphr8XiZ0bSXt
 aBtRxNwacDjqKFQvPO24g8MxN8tvxmfW7DowoOCIQYXar3FUhvFWAi61qCSFvqS4vVqb
 ER9ie0zqFe5E0olLAVMHYQAbAab2FCsENX6GOy1gRG3iPrkK108Todw6t58ccy3ysghP
 fCej2f+rkblu/Q26c+rg83UmRdD8J7qOvD2Q5POyHMuFB5OYK+YgrAZTQoGqwzoSxCxN
 R/AkwzZAzYcHfM5gGUat9hjT6AL3ZkR6+iFx4r8bVChysh86P7Liz7tbI8s02UBs5vSS SQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kfahu3dpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 11:01:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D771A10002A;
 Fri, 28 Oct 2022 11:01:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D1FF5215153;
 Fri, 28 Oct 2022 11:01:36 +0200 (CEST)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 28 Oct
 2022 11:01:33 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 28 Oct 2022 11:01:20 +0200
Message-ID: <20221028110055.3.I4bb4d81ec61fcc6340db1f81d5504905a22e90af@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
References: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_04,2022-10-27_01,2022-06-22_01
Cc: Peter Hoyes <Peter.Hoyes@arm.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Artem Lapkin <email2tema@gmail.com>, Zhaofeng Li <hello@zhaofeng.li>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 3/3] cmd: pxe: use strdup to copy config
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

Replace malloc and strcpy by strdup in
function parse_label_kernel.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 boot/pxe_utils.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/boot/pxe_utils.c b/boot/pxe_utils.c
index 756b201eda91..84e63c5cb85f 100644
--- a/boot/pxe_utils.c
+++ b/boot/pxe_utils.c
@@ -1180,11 +1180,10 @@ static int parse_label_kernel(char **c, struct pxe_label *label)
 	if (!s)
 		return 1;
 
-	label->config = malloc(strlen(s) + 1);
+	label->config = strdup(s);
 	if (!label->config)
 		return -ENOMEM;
 
-	strcpy(label->config, s);
 	*s = 0;
 
 	return 1;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
