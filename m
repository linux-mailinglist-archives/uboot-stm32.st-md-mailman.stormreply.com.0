Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F2815AFF3
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:38:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE0FBC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:38:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09B41C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:38:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIXwNe014899; Wed, 12 Feb 2020 19:38:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=jerjgl1EVMEReFc6Fv/0zt8jsmY0aiuV8bl9MY4yd9w=;
 b=VTJNShVg/Z56ja1dgz+23x/YgM6JMzKsezyXlIHBWX1t/28zr5bQUt2xhM84odbSWiLN
 cAcSmtA/97BYEx4AK+RChRt2MSrp2p0OvqkmrLL7cUmQCgB8cnqfMLIboayBULM15AuM
 oPGnhoBKaOwFCYZl9Qs1UOPzbeKYDHIhDBrNaii8WiY8EOQ3ivBF5ewlaTa0V+4fnPiV
 tfu3QD4aKWJeVYq9wi3qBUuzCuFyl7A3YrJqdqUTzGN6p/barQPfKwZqnSSo7fPBNk2M
 r1s6r1ORfRvEl5BR+RfgtULO5+XUVlAny8TIPAAqyx3OHSg+iPBZwexVNvaOps+cru2V pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uvdqtws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:38:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6FD21100080;
 Wed, 12 Feb 2020 19:37:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 685412C60AA;
 Wed, 12 Feb 2020 19:37:48 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:37:47 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:37:36 +0100
Message-ID: <20200212183744.5309-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212183744.5309-1-patrick.delaunay@st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 02/10] board: stm32mp1: read OTP in command
	stboard
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

Read the value directly from the OTP and no more of the shadows
to avoid the need of reboot after stboard command to have correct value.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/common/cmd_stboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
index b740f4510e..c7ca773b1c 100644
--- a/board/st/common/cmd_stboard.c
+++ b/board/st/common/cmd_stboard.c
@@ -58,7 +58,7 @@ static int do_stboard(cmd_tbl_t *cmdtp, int flag, int argc,
 					  DM_GET_DRIVER(stm32mp_bsec),
 					  &dev);
 
-	ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
+	ret = misc_read(dev, STM32_BSEC_OTP(BSEC_OTP_BOARD),
 			&otp, sizeof(otp));
 
 	if (ret < 0) {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
