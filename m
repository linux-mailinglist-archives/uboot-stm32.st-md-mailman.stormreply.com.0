Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1BC17B9F7
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 11:14:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C8BDC36B0E
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 10:14:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 972A4C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2020 10:14:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026AEQGX020360; Fri, 6 Mar 2020 11:14:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=wGOk8JiQfJwAoJnmUsIl1Ref4ylqxkCrLxqU/M5jPug=;
 b=cNkSb0LXMT8qqd50QzAs3OmeFGnF5b6gDwe0UjAfUTqxCuru4jR1y2YdzFKiyh4esfzT
 xwf8hyn8WjaQGzMBq0ueuBNVK/iiJVbpMox+rx63dvyj0iaRUZ6dzULSPbDa4A/SMiCg
 vQMIl78SPX7g80PrWvVpdxRvt6qTsZFqmlQvuqOil7/EPMDmgGj/jxQDBWVbvbuEwgqr
 Xx3+Hl1aDdVmbIClbYnck/lc2+oFsZUgGcbsA8eblFbffnnB1nWeed+I7eHv9MgiPds3
 J+gnIbajHAmjanSGKdFaI1fIt9ZubUKUiJtt/CIbny5MEzyuCGggidQfe0K4cZjTSpbY QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yffqqegs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 11:14:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B4B2610003B;
 Fri,  6 Mar 2020 11:14:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AA46D2A7189;
 Fri,  6 Mar 2020 11:14:35 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 6 Mar 2020 11:14:35 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Mar 2020 11:14:09 +0100
Message-ID: <20200306111355.7.I0f31274f26e4299269ef3c7d5a581d2abe96aad2@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306101412.15376-1-patrick.delaunay@st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_02:2020-03-05,
 2020-03-06 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 7/9] ram: stm32mp1_ddr: fix self refresh
	disable during DQS training
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

DDRCTRL_PWRCTL.SELFREF_EN needs to be reset before DQS training step, not
to enter in self refresh mode during the execution of this phase.
Depending on settings, it can be set after the DQS training.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/ram/stm32mp1/stm32mp1_ddr.c      | 5 ++++-
 drivers/ram/stm32mp1/stm32mp1_ddr_regs.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/ram/stm32mp1/stm32mp1_ddr.c b/drivers/ram/stm32mp1/stm32mp1_ddr.c
index a87914f2d5..b9300dd6d1 100644
--- a/drivers/ram/stm32mp1/stm32mp1_ddr.c
+++ b/drivers/ram/stm32mp1/stm32mp1_ddr.c
@@ -639,7 +639,8 @@ void stm32mp1_refresh_disable(struct stm32mp1_ddrctl *ctl)
 	start_sw_done(ctl);
 	/* quasi-dynamic register update*/
 	setbits_le32(&ctl->rfshctl3, DDRCTRL_RFSHCTL3_DIS_AUTO_REFRESH);
-	clrbits_le32(&ctl->pwrctl, DDRCTRL_PWRCTL_POWERDOWN_EN);
+	clrbits_le32(&ctl->pwrctl, DDRCTRL_PWRCTL_POWERDOWN_EN |
+				   DDRCTRL_PWRCTL_SELFREF_EN);
 	clrbits_le32(&ctl->dfimisc, DDRCTRL_DFIMISC_DFI_INIT_COMPLETE_EN);
 	wait_sw_done_ack(ctl);
 }
@@ -652,6 +653,8 @@ void stm32mp1_refresh_restore(struct stm32mp1_ddrctl *ctl,
 		clrbits_le32(&ctl->rfshctl3, DDRCTRL_RFSHCTL3_DIS_AUTO_REFRESH);
 	if (pwrctl & DDRCTRL_PWRCTL_POWERDOWN_EN)
 		setbits_le32(&ctl->pwrctl, DDRCTRL_PWRCTL_POWERDOWN_EN);
+	if ((pwrctl & DDRCTRL_PWRCTL_SELFREF_EN))
+		setbits_le32(&ctl->pwrctl, DDRCTRL_PWRCTL_SELFREF_EN);
 	setbits_le32(&ctl->dfimisc, DDRCTRL_DFIMISC_DFI_INIT_COMPLETE_EN);
 	wait_sw_done_ack(ctl);
 }
diff --git a/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h b/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h
index 9d33186b3a..afd93c518e 100644
--- a/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h
+++ b/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h
@@ -260,6 +260,7 @@ struct stm32mp1_ddrphy {
 
 #define DDRCTRL_MRSTAT_MR_WR_BUSY		BIT(0)
 
+#define DDRCTRL_PWRCTL_SELFREF_EN		BIT(0)
 #define DDRCTRL_PWRCTL_POWERDOWN_EN		BIT(1)
 #define DDRCTRL_PWRCTL_SELFREF_SW		BIT(5)
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
