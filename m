Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A680F502793
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Apr 2022 11:46:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 640F5C5E2CC;
	Fri, 15 Apr 2022 09:46:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A7F3C01577
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Apr 2022 09:46:54 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23F8xJ9q016592;
 Fri, 15 Apr 2022 11:46:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=OAKSsB6LMziwFSVQ7uIS/eRitt6GzYnZq8i6QIPCnPI=;
 b=cupsH8X0G2DCj8BYzqojIj3zemuVh8FNVekqPlx7fRBsEn0p3F0szCJmwel1DIdAxPac
 S0ArV/7CXd/LtsGD/2E9iCh6XdPjezCdGxf33P4nwntX/sQZl2o5s9jlnFjreuW5u0cq
 MkJk0gcQ+r4rsymstlq02x7GA91J2apffeMRxn9xRIHc+z5Fr3m6UeSFC5vVjWkL1oax
 0HLsfMToHyuO5KBBCMTjfSZszBLDojLZZgaJDhhTAv3wvHcbEOOrQg41tnFIuSeqglOi
 NH1VT+g+6se5PjLSrf9dD3kBqE61T9+S+lNqvwHTV5Kl4JCFKhO5oVlR5o+0194zK4YY rQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fb74qsn5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Apr 2022 11:46:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C2CA310002A;
 Fri, 15 Apr 2022 11:46:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0D7D2194E5;
 Fri, 15 Apr 2022 11:46:51 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 15 Apr 2022 11:46:51
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 15 Apr 2022 11:46:50 +0200
Message-ID: <20220415114643.1.Id540e65885e62d3a51328b7f4205a137cd249537@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-15_03,2022-04-14_02,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH] board: st: common: fix the error messages in
	stboard command
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

Add missing \n at the end of the error trace

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 board/st/common/cmd_stboard.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
index c1ecd643b0..e12669b862 100644
--- a/board/st/common/cmd_stboard.c
+++ b/board/st/common/cmd_stboard.c
@@ -92,14 +92,14 @@ static int do_stboard(struct cmd_tbl *cmdtp, int flag, int argc,
 			&otp, sizeof(otp));
 
 	if (ret != sizeof(otp)) {
-		puts("OTP read error");
+		puts("OTP read error\n");
 		return CMD_RET_FAILURE;
 	}
 
 	ret = misc_read(dev, STM32_BSEC_LOCK(BSEC_OTP_BOARD),
 			&lock, sizeof(lock));
 	if (ret != sizeof(lock)) {
-		puts("LOCK read error");
+		puts("LOCK read error\n");
 		return CMD_RET_FAILURE;
 	}
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
