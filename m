Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3C317B9FB
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 11:14:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF6A3C36B13
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 10:14:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCE73C36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2020 10:14:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026ADsaP020437; Fri, 6 Mar 2020 11:14:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=/n/3t7Bn4p6lIGVyEQVdH0au5Aj7GOCwjEBl76iLjpk=;
 b=Xb2q/cQYAZhGr7i7hkuIYEAhg98Q7OsAM/qz+y+4+0fBrT5JDqNHe6KbAzXimwbHAJCv
 ccoS1QOR5xj3A8jQ8xL8XRs7Zg+N6orre1k1ZjTdKnkoiOMSumxIBXOcgJol2qKWWxZY
 zq0dXnamq3LENi30FhqQIjm81kjz52h2h/5acploaQVopH0qMOgzhuqTb5T2P69frkdb
 lvvwf4oW7ZDxy3grns44ewJIqFYZ4GgFz/ezRJpCYAuV3Qb90jhsy1JGg4Gynt9uSymy
 iWSbMYUt0zys9r541rs/FEJuZkhu0CMzTjpdEGucjto9L4W/zFGjKn6HJZL3kTAIzVpe Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfdydex1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 11:14:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6887210003E;
 Fri,  6 Mar 2020 11:14:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 610B52A7189;
 Fri,  6 Mar 2020 11:14:36 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 6 Mar 2020 11:14:36 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Mar 2020 11:14:10 +0100
Message-ID: <20200306111355.8.I2ed443e2c15db6b007f836254b3753da9b06e76d@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306101412.15376-1-patrick.delaunay@st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_02:2020-03-05,
 2020-03-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 8/9] ram: stm32mp1: reduce delay after BIST
	reset for tuning
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

Reduce the delay after BIST delay, from 1ms to 10us
which is enough accoriding datasheet.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/ram/stm32mp1/stm32mp1_tuning.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ram/stm32mp1/stm32mp1_tuning.c b/drivers/ram/stm32mp1/stm32mp1_tuning.c
index 07d57d496c..3013b7b667 100644
--- a/drivers/ram/stm32mp1/stm32mp1_tuning.c
+++ b/drivers/ram/stm32mp1/stm32mp1_tuning.c
@@ -402,7 +402,7 @@ run:
 		writel(rand(), &phy->bistlsr);
 
 	/* some delay to reset BIST */
-	mdelay(1);
+	udelay(10);
 
 	/*Perform BIST Run*/
 	clrsetbits_le32(&phy->bistrr,
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
