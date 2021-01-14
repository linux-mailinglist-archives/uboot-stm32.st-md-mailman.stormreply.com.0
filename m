Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF38B2F5F71
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Jan 2021 12:04:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 010EFC5660F;
	Thu, 14 Jan 2021 11:04:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E02BC424C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 11:04:11 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10EB20m0025292; Thu, 14 Jan 2021 12:04:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=auRAG2b4JDwD/Qshb/W6gwA33FS0ZV1wHjcOdcpcMmo=;
 b=mdhGPZvXFIn+ySqbF0USeRd5bkqJDvLbZEayE8+kFtBKD+1Pk2mQ+bGhCKXbY545y8+7
 WHFpvd4zzqJK/yLFtPrQRH9F1utRkIsXniQLneNccCqj2smvBd6/x12Jp6knURbnqeQy
 0w9z7KkirI7pHLJaFohCoHc9lePgT20+cLWtos+N7f4Xcf697Nux6NdMJ0U2JPTvqham
 dyqs0SJ5QIb/cGL8xmnsJO/1BQkN8o1oANGCMAvGa/nZXvbuzNW7aIJUE1Ppe/6J7y62
 +uci/lpdOPHk5OHQRZynvHOZdqQJlx3uEmpGcR32DGA3MnWXF5c6+UDg0Xtc1VXXsUYw Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5gxcdj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 12:04:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 203DF10002A;
 Thu, 14 Jan 2021 12:04:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 134A7233160;
 Thu, 14 Jan 2021 12:04:07 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan 2021 12:04:06
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 14 Jan 2021 12:04:04 +0100
Message-ID: <20210114120355.1.I3bbd596e6af847434c65a45cd845fe58e55bdbc5@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_03:2021-01-13,
 2021-01-14 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH] doc: update help message
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

Update the help message used for 'make help':

  Documentation targets:
    Linux kernel internal documentation in different formats from ReST:
=>
    U-Boot documentation in different formats from ReST:

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 doc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/Makefile b/doc/Makefile
index 0e0da5666f..a686d4728e 100644
--- a/doc/Makefile
+++ b/doc/Makefile
@@ -106,7 +106,7 @@ cleandocs:
 	$(Q)$(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=doc/media clean
 
 dochelp:
-	@echo  ' Linux kernel internal documentation in different formats from ReST:'
+	@echo  ' U-Boot documentation in different formats from ReST:'
 	@echo  '  htmldocs        - HTML'
 	@echo  '  latexdocs       - LaTeX'
 	@echo  '  pdfdocs         - PDF'
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
