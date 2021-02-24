Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5752F323ACE
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Feb 2021 11:52:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1484DC3FAD6;
	Wed, 24 Feb 2021 10:52:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91571C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 10:52:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OApQNQ006072; Wed, 24 Feb 2021 11:52:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=BQv0DbiLbF4djbRz5yGHFbRi+97pMRdwFkERK6+CWoo=;
 b=U+u2Jj1iztTlC1VrtZvIBTXYFMVBBJ3PcYNWfjVSN8wJOmLKWDyFbuR4vLN/RHH0docc
 N1ZBKNQ7kqYdTndhnZljVJSmPB42BT9gLvELB4dOA5y/iZLDPjFwpU75JxLMwB0h9L7q
 F/u4dkFzKPbyfbjcTNRUPrixjRbj6T0F0UHZ8Lu719YtP6g1Yp4oiRZ8Wscve+4/EQMx
 zKRAN8UCbAg4toP4Gwtq2ht1GDTIoABy6rBPPsTklH/8ZZIkoe13P16FhD8riuIWfMMM
 oEJJRR4ZgD1ik0UqsjTSiwsdPKJvNayhOdY9RIS58IYnDd+Hqmkx0Xdh/4SVBDPEq+8H nA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66xweqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 11:52:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CA66D10002A;
 Wed, 24 Feb 2021 11:52:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B8E1222767F;
 Wed, 24 Feb 2021 11:52:38 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Feb 2021 11:52:38
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Feb 2021 11:52:34 +0100
Message-ID: <20210224105236.25663-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_03:2021-02-24,
 2021-02-24 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>
Subject: [Uboot-stm32] [RFC PATCH 0/2] env: sf: remove the static env_flash
	variable
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


Proposal to cleanup the SPI device support in env/sf.c,
after the question of mail [1].

Release the SPI flash after each ENV request, so U-Boot can't have
conflict of other SPI user.

This serie can be applied on top on previous serie [2].

Drawback: possible performance issue as SPI device is probed/release
for each ENV access when several ENV opts are called.

[1] Mail "Question about env_flash variable in env/sf.c" Dec 17, 2020; 6:33pm
http://u-boot.10912.n7.nabble.com/Question-about-env-flash-variable-in-env-sf-c-tt435311.html

[2] env: sf: add support of command env erase
http://patchwork.ozlabs.org/project/uboot/list/?series=228696&state=*

Patrick



Patrick Delaunay (2):
  env: sf: add missing spi_flash_free
  env: sf: remove the static env_flash variable

 env/sf.c | 44 ++++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
