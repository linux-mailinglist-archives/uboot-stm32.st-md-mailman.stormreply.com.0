Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A10204E917
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:27:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BC27CA029D
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:27:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F871CA0298
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:27:31 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDRHEL031159; Fri, 21 Jun 2019 15:27:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=poexO9Epoiuhlv0Kp+TR6xxiwaItJNf3jPESuO1Uq08=;
 b=Y9zYjg+2a0V7S4mgGCDxbLXaJEvgROuJ1/GetXb0YTzX0BtqFTOu1POTLqA9igps8jjc
 eoZPCE3mViSBBwJUiuexuImpUt4Wb5aUu80oPiSHsIGbN6KIzclzbZ30lO2UMeRHcSNi
 nv+yrB7BCC1+ZS+IUX+FJC+bOIWW4/Y3kR2ANuCKPlYApOnPNGj8fWE1HCePRDwoJp98
 h7RLevcCVjeCA0LOENOESeMtBWWX9UWix5NPiyDiuzVkOjQlhZw+v0DV7IZc7YyYZIyK
 ZNRU1QdOnoobHYE1GYLF7F8fuiZNNMh+aN0zpZqltSWnDfuPknwEH07FvV4qT3W3bCaQ PQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7813qeay-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:27:30 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5EBDB38;
 Fri, 21 Jun 2019 13:27:23 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 49BCE2A50;
 Fri, 21 Jun 2019 13:27:23 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:27:23 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:27:22
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:26:56 +0200
Message-ID: <1561123618-2029-18-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 18/20] cmd: pinmux: Fix warnings when
	compiling with W=1
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

This patch solves the following warnings:

cmd/pinmux.c: In function 'do_dev':
cmd/pinmux.c:26:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
   if (ret) {
      ^
cmd/pinmux.c:30:2: note: here
  case 1:
  ^~~~

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 cmd/pinmux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/cmd/pinmux.c b/cmd/pinmux.c
index 6c8ec51..de909a1 100644
--- a/cmd/pinmux.c
+++ b/cmd/pinmux.c
@@ -27,6 +27,7 @@ static int do_dev(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
 			printf("Can't get the pin-controller: %s!\n", name);
 			return CMD_RET_FAILURE;
 		}
+		/* fall through */
 	case 1:
 		if (!currdev) {
 			printf("Pin-controller device is not set!\n");
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
