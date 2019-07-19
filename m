Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA346E393
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 11:39:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08390C628BE
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 09:39:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67DB4C628AA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 09:39:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6J9amtk031390; Fri, 19 Jul 2019 11:39:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=ekI02RXFo8q4sBWNII0cUEcvmHXiJ8kXwOUJZ9/6jNI=;
 b=MCyLUZjE57h2Fp9bWF+cgzjN4vVoJHfK6LI1Xm2PYu09n3VkGUMTjVXGMeu2Nn6fYx1Q
 KjhPnTpQo9pogOMi0vWuW8L1F0bC9svAa6Fb3/1M/POg3R+rLfQmKS7QxfKpYPrrdsQG
 xj7g7BryTIy7vbHSvbNW3Vz6lpZJvr+qIi3rRF7RCTVmLwepIYQ8U5FpCreEx3LNi6b/
 hnBkp3rJnCgkYP6ojZQASQRW5iWwmMFc68LzTVqxFGZ7wLBM+RSij0CkoDiRmT2LHkp7
 h/JVLVIOFwgEuGKJjat0DsQMt4QFzNpTImHd3pKmDOQZBjHXCjTFAa5KndgggRMWJX2g 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tq4e9g8xa-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 11:39:43 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C5E574D;
 Fri, 19 Jul 2019 09:39:41 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6F8BD27ED;
 Fri, 19 Jul 2019 09:39:41 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul
 2019 11:39:41 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul 2019 11:39:41
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jul 2019 11:39:26 +0200
Message-ID: <1563529171-16796-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_06:, , signatures=0
Cc: Albert Aribaud <albert.u.boot@aribaud.net>,
 Christophe Kerello <christophe.kerello@st.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 0/5] misc: update drivers for stm32mp1
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



Patrick Delaunay (5):
  bsec: update after MISC u-class update
  pmu: stpmic1: change specific NVM api to MISC
  stpmic1: simplify stpmic1_sysreset_request
  stm32mp1: update test on misc_read result
  misc: change RCC form MISC to NOP uclass

 arch/arm/mach-stm32mp/bsec.c |  31 +++++++------
 board/st/stm32mp1/stm32mp1.c |   2 +-
 drivers/misc/stm32_rcc.c     |   5 +-
 drivers/misc/stm32mp_fuse.c  |  74 +++++++++++++++++++++++-------
 drivers/power/pmic/stpmic1.c | 107 +++++++++++++++++++++++--------------------
 include/power/stpmic1.h      |   7 ---
 6 files changed, 132 insertions(+), 94 deletions(-)

-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
