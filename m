Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B496E38E
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 11:39:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA704C61BF6
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 09:39:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A1B4C61A2B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 09:39:47 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6J9acUH004472; Fri, 19 Jul 2019 11:39:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=8GZPtctAJXZIuP8EfIPx79oGqyqBOwVaa9RnD4XQRRY=;
 b=PVFsrEIOyRbcXHHGZIWAttGTUBzOD7H/ub6lseRxPPiX2+7Lpv5Z74iW0ZFk8yAXEbHf
 /CTjssBl5d3oCNNKwwqa2eqgguLjZvSwQMgPHAcnoiBg8yl7DVntKoZUiuIv4LeFf/gS
 A15O7HSksGi15MmTV39bVWsaN7lUuhvSzjzpBgMs3LT2cQMdKx+xqZjyQFtDF+wtFI2h
 IoC2eWhMFbN38baF373zU6fMNkfIzE1/Mm3izUg+wpJBxLGdKgv7MBrMdUQ6eGlSgT/o
 RyI5THAcLY1f3lfU/eULbaxbHet5SJFVLpih+SLRvTtuOYby7tND4HjEnbhkPlquU2lf TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tq4s27het-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 11:39:46 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C89E83D;
 Fri, 19 Jul 2019 09:39:45 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B8E4C27E8;
 Fri, 19 Jul 2019 09:39:45 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul
 2019 11:39:45 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul 2019 11:39:45
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jul 2019 11:39:30 +0200
Message-ID: <1563529171-16796-5-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563529171-16796-1-git-send-email-patrick.delaunay@st.com>
References: <1563529171-16796-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_07:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 4/5] stm32mp1: update test on misc_read result
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

Update the stm32mp1 baord after the commit 8729b1ae2cbd
("misc: Update read() and write() methods to return bytes xfered")

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 7769293..b1e592c 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -95,7 +95,7 @@ int checkboard(void)
 	if (!ret)
 		ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
 				&otp, sizeof(otp));
-	if (!ret && otp) {
+	if (ret > 0 && otp) {
 		printf("Board: MB%04x Var%d Rev.%c-%02d\n",
 		       otp >> 16,
 		       (otp >> 12) & 0xF,
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
