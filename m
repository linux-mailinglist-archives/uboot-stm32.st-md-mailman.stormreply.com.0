Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6132C7F5BE
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 13:08:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E1F1C35E05
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 11:08:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21171C35E06
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 11:08:20 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72B6fE0006427; Fri, 2 Aug 2019 13:08:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=LQZ9Qk+srqMghdwgap5kfiKUtzrhS+JMkuIRDXIYtbQ=;
 b=UZ9BlXfe177Bap4d0EUqerklQjkGTYr+98jDhFkCb0gwfvyRcvA05s6zmgpUt88Dmf6C
 DbcNHoBYBzbFehdxoBiRkrvxn5RWepT1V4/DUZk0L//Afr/Cvb7HmuZft4NA++jEPnQh
 HHbk1zrb29a6lRSLq6tKCxFhAywfvJ2m23lazVXfvYAETbDg09GUp4HOPycOt3ZbYWn9
 APikEMugVwey25J1SA8N6dykadk6NswO8xbLsDKSCWraxw0WBzTBzayKORE2OhhGN/o9
 Vc4TVEt7gVEa2DOxe1OSlP9ALqtBZ1x5jeRQx6fqtkzcFCs/y4m0ZGrYpBbgqhjIxYd4 Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0c2yuycd-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 13:08:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BAFFA31;
 Fri,  2 Aug 2019 11:08:18 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B462A207409;
 Fri,  2 Aug 2019 13:08:18 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 13:08:18 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 13:08:18
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 2 Aug 2019 13:08:07 +0200
Message-ID: <1564744088-16896-7-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564744088-16896-1-git-send-email-patrick.delaunay@st.com>
References: <1564744088-16896-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_05:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 6/7] stm32mp1: board update command stboard
	on misc_read result
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

Update management of misc_read, which now return length of data
after the commit 8729b1ae2cbd ("misc: Update read() and write()
methods to return bytes xfered")

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- impact in added command stboard after rebase

 board/st/stm32mp1/cmd_stboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/st/stm32mp1/cmd_stboard.c b/board/st/stm32mp1/cmd_stboard.c
index f781c36..04352ae 100644
--- a/board/st/stm32mp1/cmd_stboard.c
+++ b/board/st/stm32mp1/cmd_stboard.c
@@ -60,7 +60,7 @@ static int do_stboard(cmd_tbl_t *cmdtp, int flag, int argc,
 	ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
 			&otp, sizeof(otp));
 
-	if (ret) {
+	if (ret < 0) {
 		puts("OTP read error");
 		return CMD_RET_FAILURE;
 	}
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
