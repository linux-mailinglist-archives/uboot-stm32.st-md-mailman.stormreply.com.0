Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7250F2781D1
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Sep 2020 09:41:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F31FFC3FADE;
	Fri, 25 Sep 2020 07:41:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2D72C32EA8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Sep 2020 07:41:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08P7bn76018153; Fri, 25 Sep 2020 09:41:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=cHqeQ3iWUV+/wErWkTrkCFE3cwr30HVGPkjBlkFT+JM=;
 b=O9UoHwNDq3xFypFo6FGADuwKS7JkT8VGLCgV5h8DmFmEKT0XaOxb1cnjHkUdmB56tnsh
 onmLwJHsrpFq8sbdEB4MqVfzDpWPzLixj3hMmXpXE71xjyPiRqNMzfuRcPYCXTSsAuwO
 9tqVk74xk8gts8A4Q7m+Gz4ec71CsKtg8ni5JxCPvdEbmolv5UfbVqSJxbMNFeZQ0783
 zduOqKevV5PCxA9Z3Punx3bWVuXOWCgmk0pMX6qiFUrsbNYwADmGgdnmOylpPH0wV7Y9
 nmQJ8fXw7KXdKaq0qqcb6Z1FkNMBq8zvQipudun9xvyHUeIUP7szcyJOIKqoXyEtOWBW /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33n748k6t1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Sep 2020 09:41:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8FD86100034;
 Fri, 25 Sep 2020 09:41:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 82C9221FE8F;
 Fri, 25 Sep 2020 09:41:28 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 25 Sep 2020 09:41:28 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 25 Sep 2020 09:41:15 +0200
Message-ID: <20200925074116.16068-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925074116.16068-1-patrick.delaunay@st.com>
References: <20200925074116.16068-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-25_02:2020-09-24,
 2020-09-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/3] fdtdec: correct test on return of
	fdt_node_offset_by_phandle
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

The result of fdt_node_offset_by_phandle is negative for error,
so this patch corrects the check of this result in
fdtdec_parse_phandle_with_args.

This patch allows to have the same behavior with or without OF_LIVE
for the function dev_read_phandle_with_args with cell_name = NULL and
with invalid phandle.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 lib/fdtdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index d3b22ec323..90d7e50646 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -746,7 +746,7 @@ int fdtdec_parse_phandle_with_args(const void *blob, int src_node,
 			if (cells_name || cur_index == index) {
 				node = fdt_node_offset_by_phandle(blob,
 								  phandle);
-				if (!node) {
+				if (node < 0) {
 					debug("%s: could not find phandle\n",
 					      fdt_get_name(blob, src_node,
 							   NULL));
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
