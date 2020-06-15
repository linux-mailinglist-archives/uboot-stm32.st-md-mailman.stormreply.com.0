Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C14AF1F91AA
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 10:39:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 710BEC36B14
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 08:39:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5302EC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 08:39:20 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05F8Rn1G024890; Mon, 15 Jun 2020 10:39:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=dE6R/vfUimqm54sfJuZT2UJDauPkQmN36sKk385VVSA=;
 b=XK6DSZ9DGsCuZXWTxnGTGospBSLDuMo68eymhpL43PaRq+Jm6EZlR+8yQd8d/o56PfV0
 kM+N67tFAhVNDV81Lw83SDHbXdp294up0zqrvkx0AJASxrAFaOMW78PtKeVBRpDF/830
 x3ZWJteCLMj/fHAVmGz/2X9yy+R2gJkNCSC97kNFum3N6ezVgD1bbD9YNwQiR044QOZ2
 ccEgpvwVe+T8UTz4kWCWCWuSFsQnUo5UH5xv1NMl246z7Olhc/Na2/mkQLsjMpXIuxxu
 2qw+sANhPpAd1GXB6cWAWi4CFqS5ekCyH4yqgsP2ogDPlgv1Tmm67ukQa9W9e6dqKji9 Hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mkx90p7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 10:39:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D623C10002A;
 Mon, 15 Jun 2020 10:39:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C059A2BC7D5;
 Mon, 15 Jun 2020 10:39:08 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 15 Jun 2020 10:39:08 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jun 2020 10:38:54 +0200
Message-ID: <20200615083857.3825-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_01:2020-06-15,
 2020-06-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Peng Fan <peng.fan@nxp.com>,
 Wolfgang Denk <wd@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RESEND PATCH 0/3] env: mmc: allow support of
	mmc_get_env_dev with OF_CONTROL
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


Hi Joe,

It is a resend of previous serie [1] after rebase.

This serie provides several corrections on ENV suport in MMC partition.
No code modification on this RESEND, tested on STM32MP157C-EV1.

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=165325

Regards

Patrick



Patrick Delaunay (3):
  env: mmc: allow support of mmc_get_env_dev with OF_CONTROL
  env: mmc: correct the offset returned by mmc_offset_try_partition
  env: mmc: add redundancy support in mmc_offset_try_partition

 env/mmc.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
