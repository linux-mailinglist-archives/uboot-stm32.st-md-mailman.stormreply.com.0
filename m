Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 001A4314D71
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Feb 2021 11:49:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9736C57B54;
	Tue,  9 Feb 2021 10:49:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3B2FC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 10:49:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 119AhCSv016713; Tue, 9 Feb 2021 11:48:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=RgLIkwDKcC/xQQnnx3fY3evAZX1umw/rhArepdKqra8=;
 b=p735VCKEkNeEPzQKSnUcysGoVXxmeybf7sPAaU5G0e5HFdbdHAyqjt0MNB54Hggf1+Jh
 ryfO3e2tKDC+RnRRZOwetXsjf4CQgEaEir/V0Is3KG6SOFWpFtzEw5bz64POrCg782i1
 6iL6Cb5z5wuqkB9/TZ1WtywThPx4tR45byX8tYiOBqg6hL5WeIafFkJD+To/mDQztlHz
 XohmzYqNCT837m6zlBqoWPJUTlPl+LqX+fkBD9zLWs2ilt+qPSU4cKwKK1NzwkDKiOso
 +MKPZ6AkS/BC1tw5MoCFUR5tNGUfDBa2iPAnNd2Y1tha+XQrtjVdDu9X8tXJk2bYsnjS ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hrf781sg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 11:48:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5F9B110002A;
 Tue,  9 Feb 2021 11:48:55 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 47EDC226F66;
 Tue,  9 Feb 2021 11:48:55 +0100 (CET)
Received: from localhost (10.75.127.121) by GPXDAG2NODE6.st.com (10.75.127.70)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 9 Feb 2021 11:48:54 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 9 Feb 2021 11:48:49 +0100
Message-ID: <20210209104852.1293-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG2NODE6.st.com (10.75.127.70) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_03:2021-02-09,
 2021-02-09 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>
Subject: [Uboot-stm32] [PATCH 0/3] env: sf: add support of command env erase
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


Hi,

I add support of env erase command for SPI flash backend (sf).

To erase the environment, this patch only invalidate the content at
CONFIG_ENV_OFFSET and at CONFIG_ENV_OFFSET_REDUND (force a bad CRC).

The 2 first patchs of the serie are preliminary and clenaup steps.

Patrick



Patrick Delaunay (3):
  env: add ENV_ERASE_PTR macro
  env: sf: update the use of macro ENV_SAVE_PTR
  env: sf: add support of command env erase

 env/ext4.c             |  3 +--
 env/mmc.c              |  6 +-----
 env/sf.c               | 36 +++++++++++++++++++++++++++++++++++-
 include/env_internal.h |  1 +
 4 files changed, 38 insertions(+), 8 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
