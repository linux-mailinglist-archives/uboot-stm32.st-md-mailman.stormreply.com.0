Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A5317B9F6
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 11:14:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22E54C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 10:14:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59420C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2020 10:14:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026AESEm018894; Fri, 6 Mar 2020 11:14:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=tf0P7pd05Pu0A5ljwIC5Ing/O8Sj6W6LI/LwwYZb+3U=;
 b=I0DAjUSFzuNwNCzUWETJoEIEOb8gJe6u2UHznzaUgo5NQA+67+PYjPkcgN4uszJqwfRK
 1fXUV1rrZxrzHOc4H6iLWJm1+gjaG9gBLESZim1NBDsrTXRUQcYW/T80yn/HdOINeI0u
 rQ9mLoWDanSz/b1uODZkCzPLchxYjShfgLoHITUq52y2CwF3FWJZFSpZcvUOFKqc9kUD
 o17rZ0HqEUmQTjHCATIEpO6RFOLhVmJ+NJitqY+tf9bL60PkqazBodaxkEAuXa2AdZ3x
 OEamLhAL4XVj0ep1aPo3r6/p9VQxCLsOjeRV3AlseLN2Bu4/nydaKw6G42OnMiYF5PGf TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfea7ef3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 11:14:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 38AB110002A;
 Fri,  6 Mar 2020 11:14:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 303BD2A7189;
 Fri,  6 Mar 2020 11:14:34 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 6 Mar 2020 11:14:33 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Mar 2020 11:14:07 +0100
Message-ID: <20200306111355.5.I2f3d97c071fc1de6dae7e15ee0bbc1df0f16fd9a@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306101412.15376-1-patrick.delaunay@st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_02:2020-03-05,
 2020-03-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 5/9] ram: stm32mp1: tuning: deactivate
	derating during BIST test
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

The derating (timing parameter derating using MR4 read value)
can't be activated during BIST test, as the MR4 read answer will
be not understood by BIST (BISTGSR.BDONE bit stay at 0,
BISTWCSR.DXWCNT = 0x206 instead of BISTWCR.BWCNT = 0x200).

This patch only impacts the tuning on LPDDR2/LPDDR3,
if derateen.derate_enable = 1.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/ram/stm32mp1/stm32mp1_tuning.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/ram/stm32mp1/stm32mp1_tuning.c b/drivers/ram/stm32mp1/stm32mp1_tuning.c
index cab6cf087a..37d3ec8fef 100644
--- a/drivers/ram/stm32mp1/stm32mp1_tuning.c
+++ b/drivers/ram/stm32mp1/stm32mp1_tuning.c
@@ -1288,11 +1288,16 @@ static enum test_result do_read_dqs_gating(struct stm32mp1_ddrctl *ctl,
 {
 	u32 rfshctl3 = readl(&ctl->rfshctl3);
 	u32 pwrctl = readl(&ctl->pwrctl);
+	u32 derateen = readl(&ctl->derateen);
 	enum test_result res;
 
+	writel(0x0, &ctl->derateen);
 	stm32mp1_refresh_disable(ctl);
+
 	res = read_dqs_gating(ctl, phy, string);
+
 	stm32mp1_refresh_restore(ctl, rfshctl3, pwrctl);
+	writel(derateen, &ctl->derateen);
 
 	return res;
 }
@@ -1303,11 +1308,16 @@ static enum test_result do_bit_deskew(struct stm32mp1_ddrctl *ctl,
 {
 	u32 rfshctl3 = readl(&ctl->rfshctl3);
 	u32 pwrctl = readl(&ctl->pwrctl);
+	u32 derateen = readl(&ctl->derateen);
 	enum test_result res;
 
+	writel(0x0, &ctl->derateen);
 	stm32mp1_refresh_disable(ctl);
+
 	res = bit_deskew(ctl, phy, string);
+
 	stm32mp1_refresh_restore(ctl, rfshctl3, pwrctl);
+	writel(derateen, &ctl->derateen);
 
 	return res;
 }
@@ -1318,11 +1328,16 @@ static enum test_result do_eye_training(struct stm32mp1_ddrctl *ctl,
 {
 	u32 rfshctl3 = readl(&ctl->rfshctl3);
 	u32 pwrctl = readl(&ctl->pwrctl);
+	u32 derateen = readl(&ctl->derateen);
 	enum test_result res;
 
+	writel(0x0, &ctl->derateen);
 	stm32mp1_refresh_disable(ctl);
+
 	res = eye_training(ctl, phy, string);
+
 	stm32mp1_refresh_restore(ctl, rfshctl3, pwrctl);
+	writel(derateen, &ctl->derateen);
 
 	return res;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
