Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D23B7F5C0
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 13:08:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 424A7C35E0B
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 11:08:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD560C35E03
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 11:08:20 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72B2LL8027548; Fri, 2 Aug 2019 13:08:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=GzZaSpRY9TLk7/+h8hDkjStI15RAHCwsqXW5/7Up6hs=;
 b=DJ6VpzHuLAOMCaUhkHYA/5uHZhaxCk+1et994q6j57kGGlKICXixSfxl/bEmd3xd3AFf
 bR1zluNDAkacuwImelGsljYyvf/twC5/hZYYFXc2d24QNMFhtIRVEsG1ZzRbtXALdQlH
 ZeGXfLgiwjBf2plnN7BoZrQSRJpY3zVSZM+NB/vZxI9AYuHP8aEdPwpcBzkYWLbpErZC
 gnDZEF6c/iJAtWr+cGii3CMT5GmsvsYo4qkzxc/9sLWHItC6rxFKHzc3A28Md2gS2AiF
 P8/BwE/XAflVeSk8Sw1GLNS5sqeCI++tz1NGTdBjfh8Sncofdk4nPGXhsGMYYBFYaCR7 kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4u7r4-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 13:08:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D163038;
 Fri,  2 Aug 2019 11:08:11 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C629D207419;
 Fri,  2 Aug 2019 13:08:11 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 13:08:11 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 13:08:11
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 2 Aug 2019 13:08:01 +0200
Message-ID: <1564744088-16896-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_05:, , signatures=0
Cc: Albert Aribaud <albert.u.boot@aribaud.net>, Lukasz
 Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, U-Boot
 STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 0/7] misc: update drivers for stm32mp1
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


Update the stm32mp1 drivers after the commit 8729b1ae2cbd
("misc: Update read() and write() methods to return bytes xfered")
And the introduction of NOP u-class.


Changes in v2:
- udpate bsec patch after rebase (use offs)
- impact in added command stboard after rebase
- rebase v2019.10-rc1

Patrick Delaunay (7):
  bsec: update after MISC u-class update
  pmu: stpmic1: change specific NVM api to MISC
  stpmic1: simplify stpmic1_sysreset_request
  stm32mp1: update test on misc_read result
  stm32mp1: update sysconf_init on misc_read result
  stm32mp1: board update command stboard on misc_read result
  misc: change RCC form MISC to NOP uclass

 arch/arm/mach-stm32mp/bsec.c    |  30 +++++------
 board/st/stm32mp1/cmd_stboard.c |   2 +-
 board/st/stm32mp1/stm32mp1.c    |   4 +-
 drivers/misc/stm32_rcc.c        |   5 +-
 drivers/misc/stm32mp_fuse.c     |  74 ++++++++++++++++++++-------
 drivers/power/pmic/stpmic1.c    | 107 +++++++++++++++++++++-------------------
 include/power/stpmic1.h         |   7 ---
 7 files changed, 134 insertions(+), 95 deletions(-)

-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
