Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEA41F5A51
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 19:29:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5CFEC36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 17:29:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3042DC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 17:29:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05AHRLOV032219; Wed, 10 Jun 2020 19:28:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=S0YcRvYUGzMWpyfoNBNkozb0Fc/lkanwDWCpD72lAZk=;
 b=TULENzFGlrDpgkls3C9UPTCTVQs2VU04A4J29mo2K0+0VTQ61qacE07+v5g3rKNDS3ak
 d4dss4uJwpy27cclE2CFG//Fbz48UFT97q3utTwCMhj/b3Poa/GG8zRDMo4E1CEBsQ1T
 VyRV0GrQdEyIaQMdxN9NsG3kZaSUl5c6YAdNK1BBgbYWBVBVd7BAarYy9p1hCkEKc18v
 71Zsa3Cg4jJSqfAqQumNvBHZ42r6fWP9PjKZT35S726NE5ERRRocDya01tMsORUV1eBh
 V7cRuocS+3uW+R117zZSXQwHuReMtwCV1QrDCjY0vYme+a+B+oNw8Zd/jMeJ937nhxeR 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31g097eh69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 19:28:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C2C5A10002A;
 Wed, 10 Jun 2020 19:28:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A8632BBAA5;
 Wed, 10 Jun 2020 19:28:54 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 10 Jun 2020 19:28:54 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 10 Jun 2020 19:28:42 +0200
Message-ID: <20200610172842.3728-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-10_10:2020-06-10,
 2020-06-10 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [Uboot-stm32] [PATCH] env: Kconfig: cosmetics: update comment for
	SYS_RELOC_GD_ENV_ADDR
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

Update the comment for SYS_RELOC_GD_ENV_ADDR as gd->env_addr is updated
in board_r.c::initr_reloc_global_data() under the compilation flags
CONFIG_SYS_RELOC_GD_ENV_ADDR

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

The current code in board_r.c is:

static int initr_reloc_global_data(void)
{
....
#ifdef CONFIG_SYS_RELOC_GD_ENV_ADDR
        /*
         * Relocate the early env_addr pointer unless we know it is not inside
         * the binary. Some systems need this and for the rest, it doesn't hurt.
         */
        gd->env_addr += gd->reloc_off;
#endif
...


 env/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/env/Kconfig b/env/Kconfig
index ca7fef682b..38e7fadbb9 100644
--- a/env/Kconfig
+++ b/env/Kconfig
@@ -562,7 +562,7 @@ config ENV_UBI_VID_OFFSET
 	  UBI VID offset for environment. If 0, no custom VID offset is used.
 
 config SYS_RELOC_GD_ENV_ADDR
-	bool "Relocate gd->en_addr"
+	bool "Relocate gd->env_addr"
 	help
 	  Relocate the early env_addr pointer so we know it is not inside
 	  the binary. Some systems need this and for the rest, it doesn't hurt.
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
