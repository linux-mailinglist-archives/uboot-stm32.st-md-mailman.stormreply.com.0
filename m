Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A20421563D
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Jul 2020 13:21:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12FF4C36B29
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Jul 2020 11:21:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEE42C36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2020 11:21:08 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 066AngjA006318; Mon, 6 Jul 2020 13:21:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=GQF5giJJqqGt7gzBUzVxqm21LRsbHGCwTEJ+Nm2Nmug=;
 b=OvqVouOfxdecUdr+dphu10ZzFvAkuE+lDLc9NaamK8MYvP95YMLxVOrlrq9Gn1CpygWE
 IeiyBtOLNjTZ0WG6eftDm9d6YfdEb3HaLM+51eLoBNxwZscXL6gvL28q2puF2+c1Bf9Q
 93x2VeFuVvL6iZ5bQTYoEyPaP5cEtrUA8faKH9MbLBH0SntZ8IhmN6WlvQ/9aKJ26ZUV
 C3j1wjjhyRPPxPf+shx2aJeypSnSYivXPB0AGUVk1lOWavU0Av+SYYtEc5igbDRjICn6
 Bvbab10We/SlTf+Rm+T1mtQJswR03OqoPFraX6UnpOVOlzTXttKeY3gill/Ub5QDmDZn dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 322fhutxkg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 13:21:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 99DDE10002A;
 Mon,  6 Jul 2020 13:21:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 894332BF9B3;
 Mon,  6 Jul 2020 13:21:00 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 6 Jul 2020 13:21:00 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 6 Jul 2020 13:20:58 +0200
Message-ID: <20200706132052.1.I28c26381b4f45a78d97ea917280479c10df92e76@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-06_08:2020-07-06,
 2020-07-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] arm: stm32mp: stm32prog: check result of
	find_mmc_device
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

Check result of find_mmc_device() before calling mmc_init().

This patch avoid a data abort when the command try to acces
to sd/mmc device deactivated in device tree.

Fixes: aff4c5dd8265 ("stm32mp: stm32prog: add MMC device")
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index c5b8841b23..e4199dbaa5 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -560,7 +560,7 @@ static int init_device(struct stm32prog_data *data,
 #ifdef CONFIG_MMC
 	case STM32PROG_MMC:
 		mmc = find_mmc_device(dev->dev_id);
-		if (mmc_init(mmc)) {
+		if (!mmc || mmc_init(mmc)) {
 			stm32prog_err("mmc device %d not found", dev->dev_id);
 			return -ENODEV;
 		}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
