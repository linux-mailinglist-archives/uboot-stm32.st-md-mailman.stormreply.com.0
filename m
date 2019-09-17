Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC898B48D6
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 10:10:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F490C35E03
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 08:10:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 250F1C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Sep 2019 08:10:16 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8H86paY025065; Tue, 17 Sep 2019 10:10:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=CGXT2l4Lps5CbD0UJ4K0pp6bZ38MLBl+eNecYFhzloM=;
 b=tMNDtYeSKJBpuWmYbQJd0PBRyKYQV1Bq3HcHODj9GdUzgwiD+f3nh+YjBqtTM+b/EPmS
 1I9gN4U9YpZwMFhh2JNwwEmC9ZwQp2S1THoXBKbmhfIH3Fv/bmbOuKjwaCDhIz3UEgAL
 +ESwyiV4vkrDDBb5twzrf8ErwoheDuLl0cn6LDj7UJL50i118O2QjVJljCPJaii35CW8
 KSp34ldoITmE/53+5+yjrZ4K092fDXNDJf8ixCqB5G5uS8jCdSpWQS8DQM32ZInDx+C8
 QFHNCd/4uo3z55dIvA94+5jqOeYYNYu7Nf/LEPl4RSi2coiuO2RCTvogj8JqCo43hfyU 1w== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v0nyx01dg-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 17 Sep 2019 10:10:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 158BD53;
 Tue, 17 Sep 2019 08:09:55 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C68472AC5E7;
 Tue, 17 Sep 2019 10:09:54 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 17 Sep
 2019 10:09:54 +0200
Received: from localhost (10.201.23.73) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 17 Sep 2019 10:09:53
 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 17 Sep 2019 10:09:40 +0200
Message-ID: <20190917080946.9593-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.23.73]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-17_05:2019-09-11,2019-09-17 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Kamil Lulko <kamil.lulko@gmail.com>
Subject: [Uboot-stm32] [PATCH 0/5] Disable CONFIG_NET flag for STM32F4 and
	STM32H7 boards
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


All STM32F4 and STM32H7 boards have CONFIG_NET flags enable in
their defconfig whereas network support was never added. Simply
disable CONFIG_NET to avoid following compilation warning:

===================== WARNING ======================
This board does not use CONFIG_DM_ETH (Driver Model
for Ethernet drivers). Please update the board to use
CONFIG_DM_ETH before the v2020.07 release. Failure to
update by the deadline may result in board removal.
See doc/driver-model/migration.rst for more info.
====================================================


Patrice Chotard (5):
  configs: stm32f429-discovery: Disable CONFIG_NET flag
  configs: stm32f429-evaluation: Disable CONFIG_NET flag
  configs: stm32f469-discovery: Disable CONFIG_NET flag
  configs: stm32h743-disco: Disable CONFIG_NET flag
  configs: stm32h743-eval: Disable CONFIG_NET flag

 configs/stm32f429-discovery_defconfig  | 1 +
 configs/stm32f429-evaluation_defconfig | 2 +-
 configs/stm32f469-discovery_defconfig  | 2 +-
 configs/stm32h743-disco_defconfig      | 1 +
 configs/stm32h743-eval_defconfig       | 1 +
 5 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
