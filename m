Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5CD150816
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Feb 2020 15:10:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3A74C36B0D
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Feb 2020 14:10:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 759C7C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2020 14:10:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 013E9ORS009947; Mon, 3 Feb 2020 15:10:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=xlv3SC1XiW8WLRZ3Oemkgj+Y42Efvn1yli3yv6rrO8o=;
 b=bDxQcmN0er5vrdS8YE2g9sMQ5VJxIh+lE1t2/ksESW1G7pAHGt0d8slpBPeSfztZCtmc
 8tyqaqvb5E6mxwTVo4ZQ97oDf1SJ+YhuesZrLgkE6gq8geT+YKM/jHwOKbm53RQ1t6gu
 aufaRDriVDazEG314F/wt1ZWtnXS3hIZcALE1f+60c6jywXHxEXV2AqsKeGU5vHgDZPf
 O5+Ya4ZaW/JGK0DAsNIpOOXfKQvPWPAIgGUpRGamAlqrhoW/BFpw6wjIdUT+4UCDH6kL
 QTjWK5QN7Tl0ibeZWJWDQ6mi1jO3yWYOc+6oiMvOA1cL3oj61uaxsuJvl77w7wP9v6Wp KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xw13nhc6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 15:10:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1AA3A100038;
 Mon,  3 Feb 2020 15:10:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 127A92B1872;
 Mon,  3 Feb 2020 15:10:45 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 3 Feb 2020 15:10:44 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 3 Feb 2020 15:10:38 +0100
Message-ID: <20200203141040.3236-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-03_04:2020-02-02,
 2020-02-03 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v1 0/2] Update board environment for STM32
	MCU's boards
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


This series:
 - standardizes the fdt_addr, scriptaddr and pxefile_addr
   across all STM32 MCU's board.
 - remove fdt_high and initrd_high from board environment



Patrice Chotard (2):
  board: stm32: fix extra env setings addresses
  board: stm32: remove fdt_high and fdt_highinitrd_high

 include/configs/stm32f429-evaluation.h | 15 +++++++++------
 include/configs/stm32f469-discovery.h  | 15 +++++++++------
 include/configs/stm32f746-disco.h      | 15 +++++++++------
 include/configs/stm32h743-disco.h      | 14 ++++++++------
 include/configs/stm32h743-eval.h       | 14 ++++++++------
 5 files changed, 43 insertions(+), 30 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
