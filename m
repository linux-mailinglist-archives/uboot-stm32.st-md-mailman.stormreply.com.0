Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F4A213E5B
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 19:13:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A313BC36B26
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 17:13:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 887D6C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jul 2020 17:13:09 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 063H56pv005938; Fri, 3 Jul 2020 19:13:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=cvda/mrWdYW6EQ5KFxqy/SEzkYh7sWlTx5U2z7FyNeI=;
 b=IB91LhNWkTru4Z+GmcbQkih6EsHSCGt8DZq2/L27RjLo2BVv/pzARXVNAF/9dkjSQX2v
 lgT4JudQ+5iYLA69iZOBn/SfKYDuBfQhMuV88A80aA0sR3cMk9sBeYb+ze9UZGbiATe+
 VMNOIVqKMXuG/yEU4b/J8hDS2xCr3RH0VKEJpLUT8xnh8qJg3opQGSMjcR6reCQsIsmf
 tQjRBSZP48GulLqL2A8kDUauuHMUa5NLInNiX2pALjQds4Z3kZZ5wpONQLL1SdH2zWBX
 Fkx53BUyrcm4iaUtaQUuLER4hl5Ci6ylfbG2MWljNDelWpxfVb0EYbpYOOS3CKvEtu0S EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuvwqnj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 19:13:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EBB8B10002A;
 Fri,  3 Jul 2020 19:13:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D398B2CA5D0;
 Fri,  3 Jul 2020 19:13:04 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 3 Jul 2020 19:13:04 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 3 Jul 2020 19:13:02 +0200
Message-ID: <20200703191239.1.I230b778f5bf092459aaadca7d51fecbc808d417d@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_13:2020-07-02,
 2020-07-03 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Joe Hershberger <joe.hershberger@ni.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] phy: usbphyc: use
	regulator_set_enable_if_allowed for disabling vdd supply
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

Use regulator_set_enable_if_allowed() api instead of regulator_set_enable()
while disabling vdd supply. This way the driver doesn't see an error
when disabling an always-on regulator.

This patch is needed since the commit f93fab312615 ("Revert 'power:
regulator: Return success on attempt to disable an always-on regulator'")
and use the API introduced by commit cc4a224af226 ("power: regulator:
Introduce regulator_set_enable_if_allowed api").

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/phy/phy-stm32-usbphyc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
index 464b0735e8..c6d3048602 100644
--- a/drivers/phy/phy-stm32-usbphyc.c
+++ b/drivers/phy/phy-stm32-usbphyc.c
@@ -263,7 +263,7 @@ static int stm32_usbphyc_phy_power_off(struct phy *phy)
 		return 0;
 
 	if (usbphyc_phy->vdd) {
-		ret = regulator_set_enable(usbphyc_phy->vdd, false);
+		ret = regulator_set_enable_if_allowed(usbphyc_phy->vdd, false);
 		if (ret)
 			return ret;
 	}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
